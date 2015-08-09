do language plpgsql $$
declare
rec record;
rec_d record;
begin
    Set schema 'metadata';
    for rec in 
        select *
        from metadata.md_datasources
        --where source_id = 560 --"aeb_producers"
        where source_id = 564 --"cbr"
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
        execute prepare_source_fill_table_time_dimensions(rec.schema --schema_name$c varchar(100)
                                                          , rec.table_name --data_table_name$c varchar(100)
                                                          , false --show_debug$b boolean -- показывать ли отладочные сообщения
                                                          , true --exec_scripts$b boolean -- выполнять ли DDL скрипты
                                                          );
        -- обработаем таблицы справочников
        for rec_d in 
            select *
            from metadata.md_dimensions
            where source_id = rec.source_id
        loop
            -- Создадим closure table для справочника
            execute prepare_source_create_closure_table_dimensions(rec.schema --schema_name$c varchar(100)
                                                                       , rec_d.table_name -- наименование таблицы со словарем-измерением
                                                                       , false --show_debug$b boolean -- показывать ли отладочные сообщения
                                                                       , true --exec_scripts$b boolean -- выполнять ли DDL скрипты
                                                                       );
            -- Заполним closure table для справочника
            execute prepare_source_fill_closure_table_dimensions(rec.schema --schema_name$c varchar(100)
                                                                       , rec_d.table_name -- varchar(100) -- наименование таблицы словаря измерения
                                                                       , false --show_debug$b boolean -- показывать ли отладочные сообщения
                                                                       , true --exec_scripts$b boolean -- выполнять ли DDL скрипты
                                                                       );
        end loop;
    end loop;
end
$$;
