create or replace function prepare_source_create_closure_table_dimensions(schema_name$c varchar(100)
                                                                       , dict_table_name$c varchar(100) -- наименование таблицы со словарем-измерением
                                                                       , show_debug$b boolean -- показывать ли отладочные сообщения
                                                                       , exec_scripts$b boolean -- выполнять ли DDL скрипты
                                                                       ) returns void as $$
declare
-- Пользователь, которому дадим права на чтение
user_for_grant$c text = 'slemma_read_only';
---------------------
query_text$c text;
table_name$c text;
count_rec$i integer;
begin
    -- Создадим closure table
    table_name$c := dict_table_name$c||'_closure';
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
      key integer primary key,
      parent_key integer NOT NULL,
      distance integer NOT NULL
    );';
    if show_debug$b then raise notice '%', query_text$c; end if;
    if exec_scripts$b then execute query_text$c; end if;
    -- Добавим уникальный индекс
    query_text$c := 'create unique index i_'||table_name$c||'_parent_key_key on '||schema_name$c||'.'||table_name$c||' (parent_key, key);';
    if show_debug$b then raise notice '%', query_text$c; end if;
    if exec_scripts$b then execute query_text$c; end if;
    -- Раздадим grant
    query_text$c := 'GRANT SELECT ON TABLE '||schema_name$c||'.'||table_name$c||' TO '||user_for_grant$c||';';
    if show_debug$b then raise notice '%', query_text$c; end if;
    if exec_scripts$b then execute query_text$c; end if;

end;
$$ language plpgsql;

