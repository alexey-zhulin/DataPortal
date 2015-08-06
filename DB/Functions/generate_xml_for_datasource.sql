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
        -- ѕеред формированием xml проверим, есть ли в базе указанна€ таблица с данными
        select count(*)
        into count_rec$i
        from pg_catalog.pg_tables t
        where t.schemaname = md_datasources$r.schema
              and t.tablename = md_datasources$r.table_name
        ;
        if count_rec$i = 0 then
            return null;
        end if;
        
        xml_str$c := '<Schema name="'||source_name$c||'" description="'||md_datasources$r.connection_string||'">';
        xml_str$c := xml_str$c||'<Cube name="'||source_name$c||'">';
        
        -- “аблица с данными
        xml_str$c := xml_str$c||'<Table name="'||md_datasources$r.table_name||'" schema="'||md_datasources$r.schema||'"/>';
        
        -- »змерение по времени
        xml_str$c := xml_str$c||'<Dimension foreignKey="dt" name="dt" type="TimeDimension">';
            xml_str$c := xml_str$c||'<Hierarchy allMemberName="All" hasAll="true" name="Hierarchy" primaryKey="dt" visible="true">';
                xml_str$c := xml_str$c||'<View alias="dt_view">';
                xml_str$c := xml_str$c||'<SQL dialect="generic">select distinct "dt",date_part(''year'', "dt")::integer AS year, date_part(''month'', "dt")::integer AS month, date_part(''day'', "dt")::integer AS day from "'||md_datasources$r.schema||'"."'||md_datasources$r.table_name||'"</SQL>';
                xml_str$c := xml_str$c||'</View>';
                xml_str$c := xml_str$c||'<Level captionColumn="year" column="year" hideMemberIf="Never" levelType="TimeYears" name="Years" type="Integer" uniqueMembers="false"/>';
                xml_str$c := xml_str$c||'<Level column="month" formatter="capsidea.MemberMonthFormatter" hideMemberIf="Never" levelType="TimeMonths" name="Month" type="Integer" uniqueMembers="false"/>';
                xml_str$c := xml_str$c||'<Level column="day" formatter="capsidea.MemberDayFormatter" hideMemberIf="Never" levelType="TimeDays" name="Days" type="Integer" uniqueMembers="false"/>';
            xml_str$c := xml_str$c||'</Hierarchy>';
        xml_str$c := xml_str$c||'</Dimension>';
        
        -- —оберем дополнительные измерени€
        for md_dimensions$r in 
        select *
        from md_dimensions
        where source_id = md_datasources$r.source_id
        loop
            -- ѕеред формированием измерени€ проверим, что така€ таблица существует
            select count(*)
            into count_rec$i
            from pg_catalog.pg_tables t
            where t.schemaname = md_dimensions$r.schema
                  and t.tablename = md_dimensions$r.table_name
            ;
            if count_rec$i = 0 then
                continue;
            end if;
            
            -- —формируем измерение
            xml_str$c := xml_str$c||'<Dimension foreignKey="'||md_dimensions$r.source_column||'" name="'||md_dimensions$r.description||'">';
                xml_str$c := xml_str$c||'<Hierarchy allMemberName="All" hasAll="true" name="'||md_dimensions$r.name_column||'" primaryKey="'||md_dimensions$r.key_column||'" visible="true">';
                    xml_str$c := xml_str$c||'<Table name="'||md_dimensions$r.table_name||'" schema="'||md_dimensions$r.schema||'"/>';
                    xml_str$c := xml_str$c||'<Level column="'||md_dimensions$r.key_column||'" nameColumn="'||md_dimensions$r.name_column||'" parentColumn="'||md_dimensions$r.parent_column||'" hideMemberIf="Never" levelType="Regular" name="Level" type="Integer" uniqueMembers="true"/>';
                xml_str$c := xml_str$c||'</Hierarchy>';
            xml_str$c := xml_str$c||'</Dimension>';
            
        end loop;
       
        --  олонка с данными
        xml_str$c := xml_str$c||'<Measure aggregator="sum" column="vl" name="'||md_datasources$r.value_column||'" visible="true"/>';
        xml_str$c := xml_str$c||'</Cube>';
        xml_str$c := xml_str$c||'</Schema>';
    end loop;
    --
    return xml_str$c;
END;
$$ LANGUAGE plpgsql;
