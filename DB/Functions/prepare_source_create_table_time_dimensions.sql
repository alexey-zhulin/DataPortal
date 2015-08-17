create or replace function prepare_source_create_table_time_dimensions(schema_name$c varchar(100)
                                                                       , data_table_name$c varchar(100) -- наименование таблицы с данными
                                                                       , show_debug$b boolean -- показывать ли отладочные сообщения
                                                                       , exec_scripts$b boolean -- выполнять ли DDL скрипты
                                                                       ) returns void as $$
declare
-- Пользователь, которому дадим права на чтение
user_for_grant$c text = 'slemma_read_only';
---------------------
query_text$c text;
table_name$c text;
column_name$c text;
data_table_constraint_name$c text;
count_rec$i integer;
rec record;
begin
    -- Создадим словарь уровней динамики
    table_name$c := schema_name$c||'_dynamic_levels';
    --
    select count(*)
    into count_rec$i
    from information_schema.tables
    where table_schema = schema_name$c
          and table_name = table_name$c;
    -- Удалим таблицу
    if count_rec$i > 0 then
        query_text$c := 'drop table '||schema_name$c||'.'||table_name$c||' cascade;';
        if show_debug$b then raise notice '%', query_text$c; end if;
        if exec_scripts$b then execute query_text$c; end if;
    end if;
    -- Создадим таблицу
    query_text$c := 'create table '||schema_name$c||'.'||table_name$c||' (
        level_id             INT4                 primary key,
        level_name           VARCHAR(100)         not null,
        sort_order           INT4                 not null
        );';
    if show_debug$b then raise notice '%', query_text$c; end if;
    if exec_scripts$b then execute query_text$c; end if;
    -- Заполним таблицу
    for rec in
    execute '
        select *
        from metadata.md_dynamic_levels
        where exists (select 1
                         from '||schema_name$c||'.'||data_table_name$c||'
                         where dl = level_id
                         )
    '
    loop
        query_text$c := '
            insert into '||schema_name$c||'.'||table_name$c||'
            (level_id, level_name, sort_order)
            values
            ($1, $2, $3);
        ';
            ----
        if show_debug$b then raise notice '%', query_text$c; end if;
        if exec_scripts$b then execute query_text$c using rec.level_id, rec.level_name, rec.sort_order; end if;
    end loop;
    -- Раздадим grant
    query_text$c := 'GRANT SELECT ON TABLE '||schema_name$c||'.'||table_name$c||' TO '||user_for_grant$c||';';
    if show_debug$b then raise notice '%', query_text$c; end if;
    if exec_scripts$b then execute query_text$c; end if;
    -- Создадим таблицу иерархии
    table_name$c := schema_name$c||'_time_hierarchy';
    --
    select count(*)
    into count_rec$i
    from information_schema.tables
    where table_schema = schema_name$c
          and table_name = table_name$c;
    -- Удалим таблицу
    if count_rec$i > 0 then
        query_text$c := 'drop table '||schema_name$c||'.'||table_name$c||' cascade;';
        if show_debug$b then raise notice '%', query_text$c; end if;
        if exec_scripts$b then execute query_text$c; end if;
    end if;
    -- Создадим таблицу
    query_text$c := 'create table '||schema_name$c||'.'||table_name$c||' (
      time_id serial primary key,
      time_value timestamp(3) without time zone NOT NULL,
      parent_time_id integer,
      level_id integer NOT NULL,
      time_name character varying(100)
    );';
    if show_debug$b then raise notice '%', query_text$c; end if;
    if exec_scripts$b then execute query_text$c; end if;
    -- Создадим constraint
    query_text$c := 'alter table '||schema_name$c||'.'||table_name$c||' add constraint '||table_name$c||'_time_id_parent_time_id foreign key (parent_time_id)
      references '||schema_name$c||'.'||table_name$c||' (time_id)
      on delete restrict on update restrict;';
    if show_debug$b then raise notice '%', query_text$c; end if;
    if exec_scripts$b then execute query_text$c; end if;
    ---
    query_text$c := 'alter table '||schema_name$c||'.'||table_name$c||' add constraint '||table_name$c||'_level_id foreign key (level_id)
      references '||schema_name$c||'.'||schema_name$c||'_dynamic_levels (level_id)
      on delete restrict on update restrict;';
    if show_debug$b then raise notice '%', query_text$c; end if;
    if exec_scripts$b then execute query_text$c; end if;
    -- Добавим уникальный индекс на дату и уровень динамики
    query_text$c := 'create unique index i_'||table_name$c||'_level_date on '||schema_name$c||'.'||table_name$c||' (level_id, time_value);';
    if show_debug$b then raise notice '%', query_text$c; end if;
    if exec_scripts$b then execute query_text$c; end if;
    -- Раздадим grant
    query_text$c := 'GRANT SELECT ON TABLE '||schema_name$c||'.'||table_name$c||' TO '||user_for_grant$c||';';
    if show_debug$b then raise notice '%', query_text$c; end if;
    if exec_scripts$b then execute query_text$c; end if;

    -- Создадим closure table
    table_name$c := schema_name$c||'_time_hierarchy_closure';
    --
    select count(*)
    into count_rec$i
    from information_schema.tables
    where table_schema = schema_name$c
          and table_name = table_name$c;
    -- Удалим таблицу
    if count_rec$i > 0 then
        query_text$c := 'drop table '||schema_name$c||'.'||table_name$c||';';
        if show_debug$b then raise notice '%', query_text$c; end if;
        if exec_scripts$b then execute query_text$c; end if;
    end if;
    -- Создадим таблицу
    query_text$c := 'create table '||schema_name$c||'.'||table_name$c||' (
      time_id integer primary key,
      parent_time_id integer NOT NULL,
      distance integer NOT NULL
    );';
    if show_debug$b then raise notice '%', query_text$c; end if;
    if exec_scripts$b then execute query_text$c; end if;
    -- Добавим уникальный индекс
    query_text$c := 'create unique index i_'||table_name$c||'_parent_time_time on '||schema_name$c||'.'||table_name$c||' (parent_time_id, time_id);';
    if show_debug$b then raise notice '%', query_text$c; end if;
    if exec_scripts$b then execute query_text$c; end if;
    -- Раздадим grant
    query_text$c := 'GRANT SELECT ON TABLE '||schema_name$c||'.'||table_name$c||' TO '||user_for_grant$c||';';
    if show_debug$b then raise notice '%', query_text$c; end if;
    if exec_scripts$b then execute query_text$c; end if;

    -- Добавим колонку time_id в таблицу с данными, предварительно удалив, если создавали ранее
    column_name$c := 'time_id';
    --
    select count(*)
    into count_rec$i
    from information_schema.columns
    where table_schema = schema_name$c
          and table_name = data_table_name$c
          and column_name = column_name$c;
    -- Удалим колонку
    if count_rec$i > 0 then
        query_text$c := 'alter table '||schema_name$c||'.'||data_table_name$c||' drop column '||column_name$c||';';
        if show_debug$b then raise notice '%', query_text$c; end if;
        if exec_scripts$b then execute query_text$c; end if;
    end if;
    query_text$c := 'alter table '||schema_name$c||'.'||data_table_name$c||' add column '||column_name$c||' integer;';
    if show_debug$b then raise notice '%', query_text$c; end if;
    if exec_scripts$b then execute query_text$c; end if;
    -- Добавим constraint
    data_table_constraint_name$c := data_table_name$c||'_time_id';
    table_name$c := schema_name$c||'_time_hierarchy';
    query_text$c := 'alter table '||schema_name$c||'.'||data_table_name$c||' add constraint '||data_table_constraint_name$c||' foreign key (time_id)
      references '||schema_name$c||'.'||table_name$c||' (time_id)
      on delete restrict on update restrict;';
    if show_debug$b then raise notice '%', query_text$c; end if;
    if exec_scripts$b then execute query_text$c; end if;
end;
$$ language plpgsql;

