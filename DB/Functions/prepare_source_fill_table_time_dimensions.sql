create or replace function prepare_source_fill_table_time_dimensions(schema_name$c varchar(100)
                                                                       , data_table_name$c varchar(100) -- наименование таблицы с данными
                                                                       , show_debug$b boolean -- показывать ли отладочные сообщения
                                                                       , exec_scripts$b boolean -- выполнять ли DDL скрипты
                                                                       ) returns void as $$
declare
query_text$c text;
table_name$c text;
begin
end;
$$ language plpgsql;

