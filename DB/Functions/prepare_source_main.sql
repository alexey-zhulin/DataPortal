﻿create or replace function prepare_source_main(source_name$c varchar(100)
                                               , show_debug$b boolean -- показывать ли отладочные сообщения
                                               , exec_scripts$b boolean -- выполнять ли DDL скрипты
                                               ) returns void as $$
declare
rec record;
rec_d record;
begin
    -- Основная процедура подговоки источника
    for rec in 
        select *
        from metadata.md_datasources
        where source_name = source_name$c
    loop
        
        -- 1. Создадим иерархическую таблицу с датами и closure table
        --    Добавим в таблицу с данными колонку time_id
        --    Создадим constraint в таблице с данными на таблицу с датами
        execute prepare_source_create_table_time_dimensions(rec.schema --schema_name$c varchar(100)
                                                            , rec.table_name --data_table_name$c varchar(100)
                                                            , show_debug$b
                                                            , exec_scripts$b
                                                            );

        -- 2. Заполним таблицу с датами и closure table, опираясь на таблицу с данными
        execute prepare_source_fill_table_time_dimensions(rec.schema --schema_name$c varchar(100)
                                                          , rec.table_name --data_table_name$c varchar(100)
                                                          , show_debug$b
                                                          , exec_scripts$b
                                                          );
        -- обработаем таблицы справочников
        for rec_d in 
            select *
            from metadata.md_dimensions
            where source_id = rec.source_id
                  and data_type_id = 1 -- Словарь
        loop
            -- Создадим closure table для справочника
            execute prepare_source_create_closure_table_dimensions(rec.schema --schema_name$c varchar(100)
                                                                       , rec_d.table_name -- наименование таблицы со словарем-измерением
                                                                       , show_debug$b
                                                                       , exec_scripts$b
                                                                       );
            -- Заполним closure table для справочника
            execute prepare_source_fill_closure_table_dimensions(rec.schema --schema_name$c varchar(100)
                                                                       , rec_d.table_name -- varchar(100) -- наименование таблицы словаря измерения
                                                                       , show_debug$b
                                                                       , exec_scripts$b
                                                                       );
        end loop;
    end loop;
end;
$$ language plpgsql;

