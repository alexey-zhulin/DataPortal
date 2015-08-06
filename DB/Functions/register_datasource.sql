set schema 'metadata';
CREATE OR REPLACE FUNCTION register_datasource(source_name$c varchar(100)
                                               , connection_string$c varchar(100)
                                               , description$c text
                                               , schema$c varchar(100)
                                               , table_name$c varchar(100)
                                               , time_dimention_column$c varchar(100)
                                               , value_column$c varchar(100)
                                               ) RETURNS integer AS $$
DECLARE
    source_id$i integer;
BEGIN
    -- Удалим старое значение, опираясь на поле source_name
    delete from md_datasources
    where source_name = source_name$c;
    -- Вставим новое значение
    insert into md_datasources
    (source_name, connection_string, description, schema, table_name, time_dimention_column, value_column)
    values
    (source_name$c, connection_string$c, description$c, schema$c, table_name$c, time_dimention_column$c, value_column$c) 
    returning source_id into source_id$i;
    --
    return source_id$i;
END;
$$ LANGUAGE plpgsql;