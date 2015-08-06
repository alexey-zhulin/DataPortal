do language plpgsql $$
declare
rec record;
begin
    Set schema 'metadata';
    for rec in 
        select *
        from metadata.md_datasources
        where source_id = 560 --"aeb_producers"
    loop
        
        -- 1. Создадим иерархическую таблицу с датами и closure table
        --    Добавим в таблицу с данными колонку time_id
        --    Создадим constraint в таблице с данными на таблицу с датами
        execute prepare_source_create_table_time_dimensions(rec.schema --schema_name$c varchar(100)
                                                            , rec.table_name --data_table_name$c varchar(100)
                                                            , false --show_debug$b boolean -- показывать ли отладочные сообщения
                                                            , true --exec_scripts$b boolean -- выполнять ли DDL скрипты
                                                            );

        -- 2. Заполним таблицу с датами и closure table, опираясь на таблицу с данными
    end loop;
end
$$;
