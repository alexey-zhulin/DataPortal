create or replace function prepare_source_fill_closure_table_dimensions(schema_name$c varchar(100)
                                                                       , table_name$c varchar(100) -- наименование таблицы словаря измерения
                                                                       , show_debug$b boolean -- показывать ли отладочные сообщения
                                                                       , exec_scripts$b boolean -- выполнять ли DDL скрипты
                                                                       ) returns void as $$
declare
query_text$c text;
begin
    -- Заполним closure table
    query_text$c := '
truncate table '||schema_name$c||'.'||table_name$c||'_closure;
--
insert into '||schema_name$c||'.'||table_name$c||'_closure
(key, parent_key, distance)
select key, key, 0
from '||schema_name$c||'.'||table_name$c||';
    ';
    if show_debug$b then raise notice '%', query_text$c; end if;
    if exec_scripts$b then execute query_text$c; end if;
    -- Заполним иерархию в измерениии по времени
end;
$$ language plpgsql;

