create or replace function prepare_source_find_parent_for_table_time_dimensions(schema_name$c varchar(100) -- схема
                                                                               , table_name$c varchar(100) -- таблица
                                                                               , date_value$d timestamp(3) without time zone -- дата
                                                                               , level_id$i integer -- уровень динамики
                                                                               ) returns integer as $$
-- Функция находит родителя для переданного значения date_value$d и уровня динамики level_id$i таблицы измерения по времени
declare
query_text$c text;
parent_level_id$i integer;
parent_time_id$i integer;
begin
    -- Найдем уровень, на котором будем искать родителя для переданного значения
    query_text$c := '
select level_id
from '||schema_name$c||'.'||schema_name$c||'_dynamic_levels
where sort_order in (select max(sort_order)
                     from '||schema_name$c||'.'||schema_name$c||'_dynamic_levels
                     where sort_order < $1
                     );
                     ';
    execute query_text$c into parent_level_id$i using level_id$i;
    --
    if parent_level_id$i is null then
        return null;
    end if;
    --
    return parent_time_id$i;
end;
$$ language plpgsql;
