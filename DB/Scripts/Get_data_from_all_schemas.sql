do language plpgsql $$
declare
rec record;
rec_sch record;
begin
    Set schema 'metadata';
    for rec in 
        select *
        from metadata.md_datasources
        where dont_use = 0
    loop
        for rec_sch in execute format ('select distinct dl as dl from %I.%I', rec.schema, rec.table_name)
        loop
            raise notice '%, %', rec.schema, rec_sch.dl;
        end loop;
    end loop;
end
$$;
