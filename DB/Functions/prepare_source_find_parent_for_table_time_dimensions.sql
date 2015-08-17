create or replace function prepare_source_find_parent_for_table_time_dimensions(schema_name$c varchar(100) -- схема
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
                     where sort_order < (select max(sort_order) from '||schema_name$c||'.'||schema_name$c||'_dynamic_levels where level_id = $1)
                     );
                     ';
    execute query_text$c into parent_level_id$i using level_id$i;
    --
    if parent_level_id$i is null then
        return null;
    end if;
    --
    if parent_level_id$i = 1 then -- Годы
        query_text$c := '
            select max(th.time_id)
            from '||schema_name$c||'.'||schema_name$c||'_time_hierarchy th
            where level_id = 1
                  and extract(year from th.time_value) = extract(year from $1)
                                ';
        execute query_text$c into parent_time_id$i using date_value$d;
    elsif parent_level_id$i = 2 then -- Полугодия
        if extract(month from date_value$d) < 7 then -- 1-е полугодие
            query_text$c := '
                select max(th.time_id)
                from '||schema_name$c||'.'||schema_name$c||'_time_hierarchy th
                where level_id = 2
                      and extract(year from th.time_value) = extract(year from $1)
                      and extract(month from th.time_value) = 1
                                    ';
            execute query_text$c into parent_time_id$i using date_value$d;
        else -- 2-е полугодие
            query_text$c := '
                select max(th.time_id)
                from '||schema_name$c||'.'||schema_name$c||'_time_hierarchy th
                where level_id = 2
                      and extract(year from th.time_value) = extract(year from $1)
                      and extract(month from th.time_value) = 7
                                    ';
            execute query_text$c into parent_time_id$i using date_value$d;
        end if;
    elsif parent_level_id$i = 3 then -- Кварталы
        query_text$c := '
            select max(th.time_id)
            from '||schema_name$c||'.'||schema_name$c||'_time_hierarchy th
            where level_id = 3
                  and extract(year from th.time_value) = extract(year from $1)
                  and extract(quarter from th.time_value) = extract(quarter from $1)
                                ';
        execute query_text$c into parent_time_id$i using date_value$d;
    elsif parent_level_id$i = 4 then -- Месяцы
        query_text$c := '
            select max(th.time_id)
            from '||schema_name$c||'.'||schema_name$c||'_time_hierarchy th
            where level_id = 4
                  and extract(year from th.time_value) = extract(year from $1)
                  and extract(month from th.time_value) = extract(month from $1)
                                ';
        execute query_text$c into parent_time_id$i using date_value$d;
    elsif parent_level_id$i = 7 then -- Недели
        query_text$c := '
            select max(th.time_id)
            from '||schema_name$c||'.'||schema_name$c||'_time_hierarchy th
            where level_id = 7
                  and extract(year from th.time_value) = extract(year from $1)
                  and extract(week from th.time_value) = extract(week from $1)
                                ';
        execute query_text$c into parent_time_id$i using date_value$d;
    elsif parent_level_id$i = 5 then -- Дни
        return null;
    end if;
    --
    return parent_time_id$i;
end;
$$ language plpgsql;
