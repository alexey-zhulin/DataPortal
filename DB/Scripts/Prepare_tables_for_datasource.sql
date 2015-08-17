do language plpgsql $$
declare
rec record;
begin
    Set schema 'metadata';
    for rec in 
        select *
        from metadata.md_datasources
        --where source_id = 560 --"aeb_producers"
        --where source_id = 564 --"cbr"
        --where source_id = 561 --"aijk_data"
    loop
        SET client_min_messages TO NOTICE;
        raise notice '==============================';
        raise notice '%', upper(rec.source_name);
        SET client_min_messages TO WARNING;
        execute prepare_source_main(rec.source_name
                                    , false --show_debug$b boolean -- показывать ли отладочные сообщения
                                    , true --exec_scripts$b boolean -- выполнять ли DDL скрипты
                                   );
    end loop;
end
$$;
