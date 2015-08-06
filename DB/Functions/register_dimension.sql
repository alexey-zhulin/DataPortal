set schema 'metadata';
CREATE OR REPLACE FUNCTION register_dimension(source_id$i integer
                                               , schema$c varchar(100)
                                               , table_name$c varchar(100)
                                               , description$c text
                                               , source_column$c varchar(100)
                                               , key_column$c varchar(100)
                                               , name_column$c varchar(100)
                                               , parent_column$c varchar(100)
                                               ) RETURNS integer AS $$
DECLARE
    dimension_id$i integer;
BEGIN
    insert into md_dimensions
    (source_id, schema, table_name, description, source_column, key_column, name_column, parent_column)
    values
    (source_id$i, schema$c, table_name$c, description$c, source_column$c, key_column$c, name_column$c, parent_column$c)
    returning dimension_id into dimension_id$i;
    --
    return dimension_id$i;
END;
$$ LANGUAGE plpgsql;