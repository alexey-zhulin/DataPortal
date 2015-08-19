set schema 'metadata';
CREATE OR REPLACE FUNCTION generate_xml_for_datasource(source_name$c varchar(100)
                                                        ) RETURNS text AS $$
DECLARE
md_datasources$r md_datasources%rowtype;
md_dimensions$r md_dimensions%rowtype;
xml_str$c text;
count_rec$i integer;
BEGIN
    for md_datasources$r in
    select *
    from md_datasources
    where source_name = source_name$c
    loop
        -- Перед формированием xml проверим, есть ли в базе указанная таблица с данными
        select count(*)
        into count_rec$i
        from pg_catalog.pg_tables t
        where t.schemaname = md_datasources$r.schema
              and t.tablename = md_datasources$r.table_name
        ;
        if count_rec$i = 0 then
            return null;
        end if;
        
        xml_str$c := '<Schema name="'||md_datasources$r.description||'" description="'||md_datasources$r.connection_string||'">';
        xml_str$c := xml_str$c||'<Cube name="'||source_name$c||'">';
        
        -- Таблица с данными
        xml_str$c := xml_str$c||'<Table name="'||md_datasources$r.table_name||'" schema="'||md_datasources$r.schema||'"/>';
        
        -- Измерение по времени
        xml_str$c := xml_str$c||'<Dimension foreignKey="time_id" name="Время">';
            xml_str$c := xml_str$c||'<Hierarchy allMemberName="All" hasAll="true" name="time_name" primaryKey="time_id" visible="true">';
                xml_str$c := xml_str$c||'<Table name="'||md_datasources$r.schema||'_time_hierarchy" schema="'||md_datasources$r.schema||'"/>';
                xml_str$c := xml_str$c||'<Level column="time_id" nameColumn="time_name" parentColumn="parent_time_id" hideMemberIf="Never" levelType="Regular" name="Level" type="Integer" uniqueMembers="true">';
                xml_str$c := xml_str$c||'<Closure parentColumn="parent_time_id" childColumn="time_id">';
                    xml_str$c := xml_str$c||'<Table name="'||md_datasources$r.schema||'_time_hierarchy_closure" schema="'||md_datasources$r.schema||'"/>';
                xml_str$c := xml_str$c||'</Closure>';
                xml_str$c := xml_str$c||'</Level>';
            xml_str$c := xml_str$c||'</Hierarchy>';
        xml_str$c := xml_str$c||'</Dimension>';
        
        -- Соберем дополнительные измерения
        for md_dimensions$r in 
        select *
        from md_dimensions
        where source_id = md_datasources$r.source_id
              and data_type_id = 1 -- Словарь
        loop
            -- Перед формированием измерения проверим, что такая таблица существует
            select count(*)
            into count_rec$i
            from pg_catalog.pg_tables t
            where t.schemaname = md_dimensions$r.schema
                  and t.tablename = md_dimensions$r.table_name
            ;
            if count_rec$i = 0 then
                continue;
            end if;
            
            -- Сформируем измерение
            xml_str$c := xml_str$c||'<Dimension foreignKey="'||md_dimensions$r.source_column||'" name="'||md_dimensions$r.description||'">';
                xml_str$c := xml_str$c||'<Hierarchy allMemberName="All" hasAll="true" name="'||md_dimensions$r.name_column||'" primaryKey="'||md_dimensions$r.key_column||'" visible="true">';
                    xml_str$c := xml_str$c||'<Table name="'||md_dimensions$r.table_name||'" schema="'||md_dimensions$r.schema||'"/>';
                    xml_str$c := xml_str$c||'<Level column="'||md_dimensions$r.key_column||'" nameColumn="'||md_dimensions$r.name_column||'" parentColumn="'||md_dimensions$r.parent_column||'" hideMemberIf="Never" levelType="Regular" name="Level" type="Integer" uniqueMembers="true">';
                    xml_str$c := xml_str$c||'<Closure parentColumn="parent_key" childColumn="key">';
                        xml_str$c := xml_str$c||'<Table name="'||md_dimensions$r.table_name||'_closure" schema="'||md_dimensions$r.schema||'"/>';
                    xml_str$c := xml_str$c||'</Closure>';
                    xml_str$c := xml_str$c||'</Level>';
                xml_str$c := xml_str$c||'</Hierarchy>';
            xml_str$c := xml_str$c||'</Dimension>';
            
        end loop;
       
        -- Колонка с данными
        xml_str$c := xml_str$c||'<Measure aggregator="sum" column="'||md_datasources$r.value_column||'" name="Значение" visible="true"/>';
        xml_str$c := xml_str$c||'</Cube>';
        xml_str$c := xml_str$c||'</Schema>';
    end loop;
    --
    return xml_str$c;
END;
$$ LANGUAGE plpgsql;
