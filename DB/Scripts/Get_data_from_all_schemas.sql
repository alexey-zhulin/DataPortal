do language plpgsql $$
declare
rec record;
rec_sch record;
query_text$c text;
count_rec$i integer;
begin
    Set schema 'metadata';
    for rec in 
        select *
        from metadata.md_datasources
        where dont_use = 0
    loop
        --raise notice '%', rec.schema;
        /*
        for rec_sch in execute format ('select distinct dl as dl from %I.%I', rec.schema, rec.table_name)
        loop
            raise notice '%', rec_sch.dl;
        end loop;
        */
        for rec_sch in 
        select *
        from metadata.md_dimensions
        where source_id = rec.source_id
        loop
            select count(*)
            into count_rec$i
            from information_schema.tables
            where table_schema = rec.schema
                  and table_name = rec_sch.table_name;
            --
            if count_rec$i = 0 then
                raise notice '%', rec.schema||'.'||rec_sch.table_name;
            end if;
            /*
            query_text$c := 'select count(*) from '||rec.schema||'.'||rec_sch.table_name;
            execute query_text$c into count_rec$i;
            raise notice '% = % records', rec_sch.table_name, count_rec$i;
            */
            
        end loop;
        --raise notice '======================';
    end loop;
end
$$;
