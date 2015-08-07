create or replace function prepare_source_fill_table_time_dimensions(schema_name$c varchar(100)
                                                                       , data_table_name$c varchar(100) -- наименование таблицы с данными
                                                                       , show_debug$b boolean -- показывать ли отладочные сообщения
                                                                       , exec_scripts$b boolean -- выполнять ли DDL скрипты
                                                                       ) returns void as $$
declare
query_text$c text;
table_name$c text;
begin
    -- Заполним таблицу измерения по времени, опираясь на даты и уровни динамики, которые присутствуют в данных
    table_name$c := schema_name$c||'_time_hierarchy';
    query_text$c := '
insert into '||schema_name$c||'.'||table_name$c||'
(time_value, level_id, time_name)
select dt
       , dl
       , metadata.get_period_name(dt -- дата, которую нужно преобразовать в наименвоание периода
                                , dl -- идентификатор уровня динамики
                                )
from (
      select distinct d.dl, d.dt
      from '||schema_name$c||'.'||data_table_name$c||' d
      where not exists (select 1
                        from '||schema_name$c||'.'||table_name$c||' h
                        where h.level_id = d.dl
                              and h.time_value = d.dt
                        )
      order by d.dl, d.dt
      ) m
    ';
    if show_debug$b then raise notice '%', query_text$c; end if;
    if exec_scripts$b then execute query_text$c; end if;
    -- Обновим поле time_id таблицы с данными ключами из заполненной таблицы измерения по времени
    query_text$c := '
update '||schema_name$c||'.'||data_table_name$c||'
set time_id = (select h.time_id
                 from '||schema_name$c||'.'||table_name$c||' h
                 where h.level_id = dl
                       and h.time_value = dt
                 )
where time_id is null
    ';
    if show_debug$b then raise notice '%', query_text$c; end if;
    if exec_scripts$b then execute query_text$c; end if;
    -- Заполним closure table
    query_text$c := '
truncate table '||schema_name$c||'.'||table_name$c||'_closure;
--
insert into '||schema_name$c||'.'||table_name$c||'_closure
(time_id, parent_time_id, distance)
select time_id, time_id, 0
from '||schema_name$c||'.'||table_name$c||';
    ';
    if show_debug$b then raise notice '%', query_text$c; end if;
    if exec_scripts$b then execute query_text$c; end if;
    -- Заполним иерархию в измерениии по времени
end;
$$ language plpgsql;

