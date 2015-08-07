create or replace function get_period_name(date$d timestamp(3) without time zone -- дата, которую нужно преобразовать в наименвоание периода
                                           , dl$i integer -- идентификатор уровня динамики
                                           ) returns text as $$
declare
result$c text;
month_number$i integer;
begin
    -- Инициализируем результат
    result$c := to_char(date$d, 'DD.MM.YYYY');
    month_number$i := to_number(to_char(date$d, 'MM'), '99');
    if dl$i = 1 then -- Годы
        result$c := to_char(date$d, 'YYYY');
    end if;
    if dl$i = 2 then -- Полугодия
        if month_number$i < 7 then
            result$c := '1 полугодие '||to_char(date$d, 'YYYY');
        else
            result$c := '2 полугодие '||to_char(date$d, 'YYYY');
        end if;
    end if;
    if dl$i = 3 then -- Кварталы
        if month_number$i < 4 then
            result$c := '1 квартал '||to_char(date$d, 'YYYY');
        elsif month_number$i < 7 then
            result$c := '2 квартал '||to_char(date$d, 'YYYY');
        elsif month_number$i < 10 then
            result$c := '3 квартал '||to_char(date$d, 'YYYY');
        else
            result$c := '4 квартал '||to_char(date$d, 'YYYY');
        end if;
    end if;
    if dl$i = 4 then -- Месяцы
        if month_number$i = 1 then
            result$c := 'январь '||to_char(date$d, 'YYYY');
        elsif month_number$i = 2 then
            result$c := 'февраль '||to_char(date$d, 'YYYY');
        elsif month_number$i = 3 then
            result$c := 'март '||to_char(date$d, 'YYYY');
        elsif month_number$i = 4 then
            result$c := 'апрель '||to_char(date$d, 'YYYY');
        elsif month_number$i = 5 then
            result$c := 'май '||to_char(date$d, 'YYYY');
        elsif month_number$i = 6 then
            result$c := 'июнь '||to_char(date$d, 'YYYY');
        elsif month_number$i = 7 then
            result$c := 'июль '||to_char(date$d, 'YYYY');
        elsif month_number$i = 8 then
            result$c := 'август '||to_char(date$d, 'YYYY');
        elsif month_number$i = 9 then
            result$c := 'сентябрь '||to_char(date$d, 'YYYY');
        elsif month_number$i = 10 then
            result$c := 'октябрь '||to_char(date$d, 'YYYY');
        elsif month_number$i = 11 then
            result$c := 'ноябрь '||to_char(date$d, 'YYYY');
        elsif month_number$i = 12 then
            result$c := 'декабрь '||to_char(date$d, 'YYYY');
        end if;
    end if;
    if dl$i = 7 then -- Недели
        result$c := to_char(date$d, 'WW')||' неделя '||to_char(date$d, 'YYYY');
    end if;
    ---
    return result$c;
end;
$$ language plpgsql;

