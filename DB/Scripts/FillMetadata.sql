do language plpgsql $$
declare
source_id$i integer;
dimension_id$i integer;
begin
Set schema 'metadata';
------------------------
select register_datasource('aeb_producers' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'АЕБ — Статистика продаж легковых автомобилей и легкового коммерческого транспорта по маркам' --description$c text
											   , 'aeb_producers' --schema$c varchar(100)
											   , 'aeb_producers_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'aeb_producers' --schema$c varchar(100)
											   , 'aeb_producers_dict_aeb_indicator' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'aeb_indicator' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'aeb_producers' --schema$c varchar(100)
											   , 'aeb_producers_dict_aeb_producers' --table_name$c varchar(100)
											   , 'Производитель' --description$c text
											   , 'aeb_producers' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'aeb_producers' --schema$c varchar(100)
											   , 'aeb_producers_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('aijk_data' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'АИЖК — Аналитика и статистика по ипотечному жилищному кредитованию' --description$c text
											   , 'aijk_data' --schema$c varchar(100)
											   , 'aijk_data_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'aijk_data' --schema$c varchar(100)
											   , 'aijk_data_dict_aijk_ind' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'aijk_ind' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'aijk_data' --schema$c varchar(100)
											   , 'aijk_data_dict_rf_region' --table_name$c varchar(100)
											   , 'Субъект РФ' --description$c text
											   , 'rf_region' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'aijk_data' --schema$c varchar(100)
											   , 'aijk_data_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('auto_data_model' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'АЕБ — Статистика продаж легковых автомобилей и легкового коммерческого транспорта по моделям ' --description$c text
											   , 'auto_data_model' --schema$c varchar(100)
											   , 'auto_data_model_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'auto_data_model' --schema$c varchar(100)
											   , 'auto_data_model_dict_obj' --table_name$c varchar(100)
											   , 'Модель' --description$c text
											   , 'obj' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'auto_data_model' --schema$c varchar(100)
											   , 'auto_data_model_dict_obj_1' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'obj_1' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'auto_data_model' --schema$c varchar(100)
											   , 'auto_data_model_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('bp_statistical_review_of_world_energy' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'Компания BP — Статистический обзор мировой энергетики' --description$c text
											   , 'bp_statistical_review_of_world_energy' --schema$c varchar(100)
											   , 'bp_statistical_review_of_world_energy_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'bp_statistical_review_of_world_energy' --schema$c varchar(100)
											   , 'bp_statistical_review_of_world_energy_dict_energytype' --table_name$c varchar(100)
											   , 'Тип энергии' --description$c text
											   , 'energytype' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'bp_statistical_review_of_world_energy' --schema$c varchar(100)
											   , 'bp_statistical_review_of_world_energy_dict_indicator' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'indicator' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'bp_statistical_review_of_world_energy' --schema$c varchar(100)
											   , 'bp_statistical_review_of_world_energy_dict_country' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'country' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'bp_statistical_review_of_world_energy' --schema$c varchar(100)
											   , 'bp_statistical_review_of_world_energy_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('cbr' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'ЦБ РФ — Статистика банковской системы' --description$c text
											   , 'cbr' --schema$c varchar(100)
											   , 'cbr_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'cbr' --schema$c varchar(100)
											   , 'cbr_dict_indicator' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'indicator' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'cbr' --schema$c varchar(100)
											   , 'cbr_dict_region' --table_name$c varchar(100)
											   , 'Регион' --description$c text
											   , 'region' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'cbr' --schema$c varchar(100)
											   , 'cbr_dict_detailed' --table_name$c varchar(100)
											   , 'Детализация показателя' --description$c text
											   , 'detailed' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'cbr' --schema$c varchar(100)
											   , 'cbr_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'cbr' --schema$c varchar(100)
											   , 'cbr_dict_source' --table_name$c varchar(100)
											   , 'Источник' --description$c text
											   , 'source' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('cbr_region' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'ЦБ РФ — Статистика банковской системы (Региональный раздел)' --description$c text
											   , 'cbr_region' --schema$c varchar(100)
											   , 'cbr_region_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'cbr_region' --schema$c varchar(100)
											   , 'cbr_region_dict_indicators_region' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'indicators_region' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'cbr_region' --schema$c varchar(100)
											   , 'cbr_region_dict_rf_regions' --table_name$c varchar(100)
											   , 'Субъект РФ' --description$c text
											   , 'rf_regions' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'cbr_region' --schema$c varchar(100)
											   , 'cbr_region_dict_det_region' --table_name$c varchar(100)
											   , 'Детализация показателя' --description$c text
											   , 'det_region' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'cbr_region' --schema$c varchar(100)
											   , 'cbr_region_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('cbrf_balance_of_payments' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'ЦБ РФ — Платёжный баланс (Аналитическое представление)' --description$c text
											   , 'cbrf_balance_of_payments' --schema$c varchar(100)
											   , 'cbrf_balance_of_payments_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'cbrf_balance_of_payments' --schema$c varchar(100)
											   , 'cbrf_balance_of_payments_dict_indicator' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'indicator' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'cbrf_balance_of_payments' --schema$c varchar(100)
											   , 'cbrf_balance_of_payments_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('cbrf_external_debt' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'ЦБ РФ — Внешний долг Российской Федерации' --description$c text
											   , 'cbrf_external_debt' --schema$c varchar(100)
											   , 'cbrf_external_debt_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'cbrf_external_debt' --schema$c varchar(100)
											   , 'cbrf_external_debt_dict_indicator' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'indicator' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'cbrf_external_debt' --schema$c varchar(100)
											   , 'cbrf_external_debt_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('cbrf_investments' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'ЦБ РФ — Международная инвестиционная позиция Российской Федерации' --description$c text
											   , 'cbrf_investments' --schema$c varchar(100)
											   , 'cbrf_investments_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'cbrf_investments' --schema$c varchar(100)
											   , 'cbrf_investments_dict_indicator' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'indicator' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'cbrf_investments' --schema$c varchar(100)
											   , 'cbrf_investments_dict_source' --table_name$c varchar(100)
											   , 'Источник' --description$c text
											   , 'source' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'cbrf_investments' --schema$c varchar(100)
											   , 'cbrf_investments_dict_detailed' --table_name$c varchar(100)
											   , 'Детализация показателя' --description$c text
											   , 'detailed' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'cbrf_investments' --schema$c varchar(100)
											   , 'cbrf_investments_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('cdw_auction_repo' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'ЦБ РФ — Итоги аукциона прямого РЕПО' --description$c text
											   , 'cdw_auction_repo' --schema$c varchar(100)
											   , 'cdw_auction_repo_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'cdw_auction_repo' --schema$c varchar(100)
											   , 'cdw_auction_repo_dict_cdw_indicators_repo' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'cdw_indicators_repo' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'cdw_auction_repo' --schema$c varchar(100)
											   , 'cdw_auction_repo_dict_cdw_terms_repo' --table_name$c varchar(100)
											   , 'Срок РЕПО' --description$c text
											   , 'cdw_terms_repo' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'cdw_auction_repo' --schema$c varchar(100)
											   , 'cdw_auction_repo_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('cdw_indicators_cbrf' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'ЦБ РФ — Оперативные показатели' --description$c text
											   , 'cdw_indicators_cbrf' --schema$c varchar(100)
											   , 'cdw_indicators_cbrf_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'cdw_indicators_cbrf' --schema$c varchar(100)
											   , 'cdw_indicators_cbrf_dict_cdw_indicators' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'cdw_indicators' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'cdw_indicators_cbrf' --schema$c varchar(100)
											   , 'cdw_indicators_cbrf_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('cdw_rates_credits' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'ЦБ РФ — Показатели ставок межбанковского рынка' --description$c text
											   , 'cdw_rates_credits' --schema$c varchar(100)
											   , 'cdw_rates_credits_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'cdw_rates_credits' --schema$c varchar(100)
											   , 'cdw_rates_credits_dict_cdw_rates_credits' --table_name$c varchar(100)
											   , 'Тип ставки по кредитам' --description$c text
											   , 'cdw_rates_credits' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'cdw_rates_credits' --schema$c varchar(100)
											   , 'cdw_rates_credits_dict_cdw_terms_credits' --table_name$c varchar(100)
											   , 'Срок кредита' --description$c text
											   , 'cdw_terms_credits' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'cdw_rates_credits' --schema$c varchar(100)
											   , 'cdw_rates_credits_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('cdw_rates_currencies' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'ЦБ РФ — Курсы иностранных валют к рублю Российской Федерации' --description$c text
											   , 'cdw_rates_currencies' --schema$c varchar(100)
											   , 'cdw_rates_currencies_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'cdw_rates_currencies' --schema$c varchar(100)
											   , 'cdw_rates_currencies_dict_cdw_currencies' --table_name$c varchar(100)
											   , 'Валюта' --description$c text
											   , 'cdw_currencies' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'cdw_rates_currencies' --schema$c varchar(100)
											   , 'cdw_rates_currencies_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'cdw_rates_currencies' --schema$c varchar(100)
											   , 'cdw_rates_currencies_dict_cdw_currencies_units' --table_name$c varchar(100)
											   , 'Масштаб единицы измерения' --description$c text
											   , 'cdw_currencies_units' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('cis_macroindicators' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'Статкомитет СНГ — Основные показатели стран СНГ' --description$c text
											   , 'cis_macroindicators' --schema$c varchar(100)
											   , 'cis_macroindicators_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'cis_macroindicators' --schema$c varchar(100)
											   , 'cis_macroindicators_dict_macro_ind' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'macro_ind' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'cis_macroindicators' --schema$c varchar(100)
											   , 'cis_macroindicators_dict_sng' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'sng' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'cis_macroindicators' --schema$c varchar(100)
											   , 'cis_macroindicators_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('clean_development_mechanism_cdm_statistics' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'UNFCCC — Статистика механизма развития очистки' --description$c text
											   , 'clean_development_mechanism_cdm_statistics' --schema$c varchar(100)
											   , 'clean_development_mechanism_cdm_statistics_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'clean_development_mechanism_cdm_statistics' --schema$c varchar(100)
											   , 'clean_development_mechanism_cdm_statistics_dict_indicator' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'indicator' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'clean_development_mechanism_cdm_statistics' --schema$c varchar(100)
											   , 'clean_development_mechanism_cdm_statistics_dict_country' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'country' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'clean_development_mechanism_cdm_statistics' --schema$c varchar(100)
											   , 'clean_development_mechanism_cdm_statistics_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('cnews_larg_rus_comp' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'CNEWS — Рейтинги крупнейших ИТ компаний' --description$c text
											   , 'cnews_larg_rus_comp' --schema$c varchar(100)
											   , 'cnews_larg_rus_comp_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'cnews_larg_rus_comp' --schema$c varchar(100)
											   , 'cnews_larg_rus_comp_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'cnews_larg_rus_comp' --schema$c varchar(100)
											   , 'cnews_larg_rus_comp_dict_cnews_larg_rus_comp_ind' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'cnews_larg_rus_comp_ind' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'cnews_larg_rus_comp' --schema$c varchar(100)
											   , 'cnews_larg_rus_comp_dict_cnews_larg_rus_comp_comp' --table_name$c varchar(100)
											   , 'Компания' --description$c text
											   , 'cnews_larg_rus_comp_comp' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('crude_oil' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'EIA — Сырая нефть' --description$c text
											   , 'crude_oil' --schema$c varchar(100)
											   , 'crude_oil_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'crude_oil' --schema$c varchar(100)
											   , 'crude_oil_dict_obj' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'obj' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'crude_oil' --schema$c varchar(100)
											   , 'crude_oil_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('dj_agri_prices' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'Европейская комиссия — Цены на сельскохозяйственную продукцию' --description$c text
											   , 'dj_agri_prices' --schema$c varchar(100)
											   , 'dj_agri_prices_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'dj_agri_prices' --schema$c varchar(100)
											   , 'dj_agri_prices_dict_obj_copy' --table_name$c varchar(100)
											   , 'Продукция' --description$c text
											   , 'obj_copy' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'dj_agri_prices' --schema$c varchar(100)
											   , 'dj_agri_prices_dict_countries' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'countries' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'dj_agri_prices' --schema$c varchar(100)
											   , 'dj_agri_prices_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('doing_business' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'WB — Ведение бизнеса' --description$c text
											   , 'doing_business' --schema$c varchar(100)
											   , 'doing_business_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'doing_business' --schema$c varchar(100)
											   , 'doing_business_dict_obj_1' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'obj_1' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'doing_business' --schema$c varchar(100)
											   , 'doing_business_dict_obj' --table_name$c varchar(100)
											   , 'Тип' --description$c text
											   , 'obj' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'doing_business' --schema$c varchar(100)
											   , 'doing_business_dict_countries' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'countries' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'doing_business' --schema$c varchar(100)
											   , 'doing_business_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('eia__international_energy_outlook' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'EIA — Перспективы международной энергетики' --description$c text
											   , 'eia__international_energy_outlook' --schema$c varchar(100)
											   , 'eia__international_energy_outlook_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'eia__international_energy_outlook' --schema$c varchar(100)
											   , 'eia__international_energy_outlook_dict_indicator' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'indicator' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'eia__international_energy_outlook' --schema$c varchar(100)
											   , 'eia__international_energy_outlook_dict_product' --table_name$c varchar(100)
											   , 'Продукция' --description$c text
											   , 'product' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'eia__international_energy_outlook' --schema$c varchar(100)
											   , 'eia__international_energy_outlook_dict_scenario' --table_name$c varchar(100)
											   , 'Сценарий' --description$c text
											   , 'scenario' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'eia__international_energy_outlook' --schema$c varchar(100)
											   , 'eia__international_energy_outlook_dict_country' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'country' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'eia__international_energy_outlook' --schema$c varchar(100)
											   , 'eia__international_energy_outlook_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('eia_aeo_data_2013' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'EIA — Ежегодный прогноз энергетики (версия 2013 г.)' --description$c text
											   , 'eia_aeo_data_2013' --schema$c varchar(100)
											   , 'eia_aeo_data_2013_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'eia_aeo_data_2013' --schema$c varchar(100)
											   , 'eia_aeo_data_2013_dict_unit' --table_name$c varchar(100)
											   , 'Unit' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'eia_aeo_data_2013' --schema$c varchar(100)
											   , 'eia_aeo_data_2013_dict_eia_aeo_indicators_' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'eia_aeo_indicators_' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'eia_aeo_data_2013' --schema$c varchar(100)
											   , 'eia_aeo_data_2013_dict_eia_aeo_region_' --table_name$c varchar(100)
											   , 'Регион' --description$c text
											   , 'eia_aeo_region_' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('eia_steo' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'EIA — Краткосрочный прогноз энергетики' --description$c text
											   , 'eia_steo' --schema$c varchar(100)
											   , 'eia_steo_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'eia_steo' --schema$c varchar(100)
											   , 'eia_steo_dict_eia_steo_indicators' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'eia_steo_indicators' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'eia_steo' --schema$c varchar(100)
											   , 'eia_steo_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('ext_bel_com' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'ГТК РБ — Внешняя торговля Республики Беларусь, по товарам' --description$c text
											   , 'ext_bel_com' --schema$c varchar(100)
											   , 'ext_bel_com_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'ext_bel_com' --schema$c varchar(100)
											   , 'ext_bel_com_dict_regions' --table_name$c varchar(100)
											   , 'Регион' --description$c text
											   , 'regions' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'ext_bel_com' --schema$c varchar(100)
											   , 'ext_bel_com_dict_commodity_bel' --table_name$c varchar(100)
											   , 'Товар' --description$c text
											   , 'commodity_bel' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'ext_bel_com' --schema$c varchar(100)
											   , 'ext_bel_com_dict_napravlenie_tovarooborota' --table_name$c varchar(100)
											   , 'Направление' --description$c text
											   , 'napravlenie_tovarooborota' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'ext_bel_com' --schema$c varchar(100)
											   , 'ext_bel_com_dict_type' --table_name$c varchar(100)
											   , 'Тип данных' --description$c text
											   , 'type' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'ext_bel_com' --schema$c varchar(100)
											   , 'ext_bel_com_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('external_trade_bel' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'ГТК РБ — Внешняя торговля Республики Беларусь, по странам' --description$c text
											   , 'external_trade_bel' --schema$c varchar(100)
											   , 'external_trade_bel_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'external_trade_bel' --schema$c varchar(100)
											   , 'external_trade_bel_dict_napravlenie_tovarooborota' --table_name$c varchar(100)
											   , 'Направление' --description$c text
											   , 'napravlenie_tovarooborota' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'external_trade_bel' --schema$c varchar(100)
											   , 'external_trade_bel_dict_fcountry' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'fcountry' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'external_trade_bel' --schema$c varchar(100)
											   , 'external_trade_bel_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('external_trade_kazahstan' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'КТК МФ РК — Внешняя торговля Республики Казахстан' --description$c text
											   , 'external_trade_kazahstan' --schema$c varchar(100)
											   , 'external_trade_kazahstan_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'external_trade_kazahstan' --schema$c varchar(100)
											   , 'external_trade_kazahstan_dict_country_kaz' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'country_kaz' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'external_trade_kazahstan' --schema$c varchar(100)
											   , 'external_trade_kazahstan_dict_ext_kaz_flow' --table_name$c varchar(100)
											   , 'Направление' --description$c text
											   , 'ext_kaz_flow' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'external_trade_kazahstan' --schema$c varchar(100)
											   , 'external_trade_kazahstan_dict_ext_kaz_com' --table_name$c varchar(100)
											   , 'Товар' --description$c text
											   , 'ext_kaz_com' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'external_trade_kazahstan' --schema$c varchar(100)
											   , 'external_trade_kazahstan_dict_cdw_kazah_type' --table_name$c varchar(100)
											   , 'Тип данных' --description$c text
											   , 'cdw_kazah_type' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'external_trade_kazahstan' --schema$c varchar(100)
											   , 'external_trade_kazahstan_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('fao__prodstat' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'FAO — Статистика производства продукции сельского хозяйства' --description$c text
											   , 'fao__prodstat' --schema$c varchar(100)
											   , 'fao__prodstat_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fao__prodstat' --schema$c varchar(100)
											   , 'fao__prodstat_dict_indicator' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'indicator' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fao__prodstat' --schema$c varchar(100)
											   , 'fao__prodstat_dict_item' --table_name$c varchar(100)
											   , 'Элемент' --description$c text
											   , 'item' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fao__prodstat' --schema$c varchar(100)
											   , 'fao__prodstat_dict_country' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'country' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fao__prodstat' --schema$c varchar(100)
											   , 'fao__prodstat_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('fao_dtm' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'FAO — Детализированная матрица торговли' --description$c text
											   , 'fao_dtm' --schema$c varchar(100)
											   , 'fao_dtm_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fao_dtm' --schema$c varchar(100)
											   , 'fao_dtm_dict_countries' --table_name$c varchar(100)
											   , 'Страна-производитель' --description$c text
											   , 'countries' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fao_dtm' --schema$c varchar(100)
											   , 'fao_dtm_dict_fao_dtm_part_ctr' --table_name$c varchar(100)
											   , 'Страна-партнер' --description$c text
											   , 'fao_dtm_part_ctr' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fao_dtm' --schema$c varchar(100)
											   , 'fao_dtm_dict_fao_items_trade' --table_name$c varchar(100)
											   , 'Товар' --description$c text
											   , 'fao_items_trade' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fao_dtm' --schema$c varchar(100)
											   , 'fao_dtm_dict_fao_subjects_trade' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'fao_subjects_trade' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fao_dtm' --schema$c varchar(100)
											   , 'fao_dtm_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('fao_fbs' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'FAO — Баланс продовольствия' --description$c text
											   , 'fao_fbs' --schema$c varchar(100)
											   , 'fao_fbs_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fao_fbs' --schema$c varchar(100)
											   , 'fao_fbs_dict_fao_subjects_fbs' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'fao_subjects_fbs' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fao_fbs' --schema$c varchar(100)
											   , 'fao_fbs_dict_fao_items_fbs' --table_name$c varchar(100)
											   , 'Элемент' --description$c text
											   , 'fao_items_fbs' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fao_fbs' --schema$c varchar(100)
											   , 'fao_fbs_dict_countries' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'countries' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fao_fbs' --schema$c varchar(100)
											   , 'fao_fbs_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('fao_giews_data' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'FAO — Глобальная система информации и раннего предупреждения' --description$c text
											   , 'fao_giews_data' --schema$c varchar(100)
											   , 'fao_giews_data_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fao_giews_data' --schema$c varchar(100)
											   , 'fao_giews_data_dict_fao_giews_coun_loc' --table_name$c varchar(100)
											   , 'Страна/место расположения' --description$c text
											   , 'fao_giews_coun_loc' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fao_giews_data' --schema$c varchar(100)
											   , 'fao_giews_data_dict_fao_giews_commodity' --table_name$c varchar(100)
											   , 'Товар' --description$c text
											   , 'fao_giews_commodity' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fao_giews_data' --schema$c varchar(100)
											   , 'fao_giews_data_dict_fao_giews_pt' --table_name$c varchar(100)
											   , 'Тип цены' --description$c text
											   , 'fao_giews_pt' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fao_giews_data' --schema$c varchar(100)
											   , 'fao_giews_data_dict_fao_giews_cur_mea' --table_name$c varchar(100)
											   , 'Валюта/единица измерения' --description$c text
											   , 'fao_giews_cur_mea' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fao_giews_data' --schema$c varchar(100)
											   , 'fao_giews_data_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('fao_icp' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'FAO — Мировые продовольственные цены' --description$c text
											   , 'fao_icp' --schema$c varchar(100)
											   , 'fao_icp_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fao_icp' --schema$c varchar(100)
											   , 'fao_icp_dict_fao_indicators_icp' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'fao_indicators_icp' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fao_icp' --schema$c varchar(100)
											   , 'fao_icp_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('fao_pricestat' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'FAO — Статистика по ценам' --description$c text
											   , 'fao_pricestat' --schema$c varchar(100)
											   , 'fao_pricestat_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fao_pricestat' --schema$c varchar(100)
											   , 'fao_pricestat_dict_fao_items_price' --table_name$c varchar(100)
											   , 'Элемент' --description$c text
											   , 'fao_items_price' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fao_pricestat' --schema$c varchar(100)
											   , 'fao_pricestat_dict_fao_price_elements' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'fao_price_elements' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fao_pricestat' --schema$c varchar(100)
											   , 'fao_pricestat_dict_countries' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'countries' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fao_pricestat' --schema$c varchar(100)
											   , 'fao_pricestat_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('fao_resource' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'FAO — Статистика по ресурсам' --description$c text
											   , 'fao_resource' --schema$c varchar(100)
											   , 'fao_resource_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fao_resource' --schema$c varchar(100)
											   , 'fao_resource_dict_fao_items_resource' --table_name$c varchar(100)
											   , 'Элемент' --description$c text
											   , 'fao_items_resource' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fao_resource' --schema$c varchar(100)
											   , 'fao_resource_dict_fao_subjects_resource' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'fao_subjects_resource' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fao_resource' --schema$c varchar(100)
											   , 'fao_resource_dict_countries' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'countries' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fao_resource' --schema$c varchar(100)
											   , 'fao_resource_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('fao_trade_fas' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'FAO — Поставки продовольственной помощи (Мировая Продовольственная Программа)' --description$c text
											   , 'fao_trade_fas' --schema$c varchar(100)
											   , 'fao_trade_fas_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fao_trade_fas' --schema$c varchar(100)
											   , 'fao_trade_fas_dict_fao_fas_donor' --table_name$c varchar(100)
											   , 'Страна-донор' --description$c text
											   , 'fao_fas_donor' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fao_trade_fas' --schema$c varchar(100)
											   , 'fao_trade_fas_dict_countries' --table_name$c varchar(100)
											   , 'Страна-получатель' --description$c text
											   , 'countries' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fao_trade_fas' --schema$c varchar(100)
											   , 'fao_trade_fas_dict_fao_fas_items' --table_name$c varchar(100)
											   , 'Товар' --description$c text
											   , 'fao_fas_items' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fao_trade_fas' --schema$c varchar(100)
											   , 'fao_trade_fas_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('fao_tradestat' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'FAO — Статистика торговли' --description$c text
											   , 'fao_tradestat' --schema$c varchar(100)
											   , 'fao_tradestat_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fao_tradestat' --schema$c varchar(100)
											   , 'fao_tradestat_dict_fao_subjects_trade' --table_name$c varchar(100)
											   , 'Тема' --description$c text
											   , 'fao_subjects_trade' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fao_tradestat' --schema$c varchar(100)
											   , 'fao_tradestat_dict_fao_items_trade' --table_name$c varchar(100)
											   , 'Элемент' --description$c text
											   , 'fao_items_trade' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fao_tradestat' --schema$c varchar(100)
											   , 'fao_tradestat_dict_countries' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'countries' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fao_tradestat' --schema$c varchar(100)
											   , 'fao_tradestat_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('fapri_wao' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'FAPRI — Перспективы мирового сельского хозяйства' --description$c text
											   , 'fapri_wao' --schema$c varchar(100)
											   , 'fapri_wao_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fapri_wao' --schema$c varchar(100)
											   , 'fapri_wao_dict_fapri_commodity' --table_name$c varchar(100)
											   , 'Товар' --description$c text
											   , 'fapri_commodity' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fapri_wao' --schema$c varchar(100)
											   , 'fapri_wao_dict_fapri_indicators' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'fapri_indicators' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fapri_wao' --schema$c varchar(100)
											   , 'fapri_wao_dict_countries' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'countries' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fapri_wao' --schema$c varchar(100)
											   , 'fapri_wao_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('fcs_import_export_of_countries' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'ФТС — Импорт / Экспорт по странам и группам стран' --description$c text
											   , 'fcs_import_export_of_countries' --schema$c varchar(100)
											   , 'fcs_import_export_of_countries_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fcs_import_export_of_countries' --schema$c varchar(100)
											   , 'fcs_import_export_of_countries_dict_obj' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'obj' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fcs_import_export_of_countries' --schema$c varchar(100)
											   , 'fcs_import_export_of_countries_dict_countries' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'countries' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fcs_import_export_of_countries' --schema$c varchar(100)
											   , 'fcs_import_export_of_countries_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('fcs_structure_import_export' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'ФТС — Товарная структура Импорта / Экспорта РФ со всеми странами' --description$c text
											   , 'fcs_structure_import_export' --schema$c varchar(100)
											   , 'fcs_structure_import_export_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fcs_structure_import_export' --schema$c varchar(100)
											   , 'fcs_structure_import_export_dict_basicgroups_of_goods' --table_name$c varchar(100)
											   , 'Основные группы товаров в импорте/экспорте' --description$c text
											   , 'basicgroups_of_goods' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fcs_structure_import_export' --schema$c varchar(100)
											   , 'fcs_structure_import_export_dict_type_action' --table_name$c varchar(100)
											   , 'Тип ВЭД' --description$c text
											   , 'type_action' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fcs_structure_import_export' --schema$c varchar(100)
											   , 'fcs_structure_import_export_dict_area' --table_name$c varchar(100)
											   , 'Направление' --description$c text
											   , 'area' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fcs_structure_import_export' --schema$c varchar(100)
											   , 'fcs_structure_import_export_dict_obj' --table_name$c varchar(100)
											   , 'Тип данных' --description$c text
											   , 'obj' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fcs_structure_import_export' --schema$c varchar(100)
											   , 'fcs_structure_import_export_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('fed_budget_rf_main_adm' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'Федеральное казначейство РФ — Показатели исполнения федерального бюджета РФ по главным администраторам' --description$c text
											   , 'fed_budget_rf_main_adm' --schema$c varchar(100)
											   , 'fed_budget_rf_main_adm_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fed_budget_rf_main_adm' --schema$c varchar(100)
											   , 'fed_budget_rf_main_adm_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fed_budget_rf_main_adm' --schema$c varchar(100)
											   , 'fed_budget_rf_main_adm_dict_fed_budget_rf_main_adm_ind' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'fed_budget_rf_main_adm_ind' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fed_budget_rf_main_adm' --schema$c varchar(100)
											   , 'fed_budget_rf_main_adm_dict_fed_budget_rf_main_adm_main_adm' --table_name$c varchar(100)
											   , 'Главный администратор' --description$c text
											   , 'fed_budget_rf_main_adm_main_adm' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fed_budget_rf_main_adm' --schema$c varchar(100)
											   , 'fed_budget_rf_main_adm_dict_fed_budget_rf_main_adm_type' --table_name$c varchar(100)
											   , 'Тип данных' --description$c text
											   , 'fed_budget_rf_main_adm_type' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('finam_mtr' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'Финам — Мировые товарные рынки' --description$c text
											   , 'finam_mtr' --schema$c varchar(100)
											   , 'finam_mtr_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'finam_mtr' --schema$c varchar(100)
											   , 'finam_mtr_dict_ticker' --table_name$c varchar(100)
											   , 'Тикер' --description$c text
											   , 'ticker' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'finam_mtr' --schema$c varchar(100)
											   , 'finam_mtr_dict_indicator' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'indicator' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'finam_mtr' --schema$c varchar(100)
											   , 'finam_mtr_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('fns_form_1nm' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'ФНС — Отчет (форма 1-НМ) о начислении и поступлении налогов, сборов и иных обязательных платежей в бюджетную систему Российской Федерации' --description$c text
											   , 'fns_form_1nm' --schema$c varchar(100)
											   , 'fns_form_1nm_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_1nm' --schema$c varchar(100)
											   , 'fns_form_1nm_dict_fns_indicators' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'fns_indicators' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_1nm' --schema$c varchar(100)
											   , 'fns_form_1nm_dict_fns_columns' --table_name$c varchar(100)
											   , 'Графа' --description$c text
											   , 'fns_columns' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_1nm' --schema$c varchar(100)
											   , 'fns_form_1nm_dict_rf_regions' --table_name$c varchar(100)
											   , 'Субъект РФ' --description$c text
											   , 'rf_regions' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_1nm' --schema$c varchar(100)
											   , 'fns_form_1nm_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('fns_form_1nom' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'ФНС — Отчет (форма 1-НОМ) о поступлении налоговых платежей в бюджетную систему Российской Федерации по основным видам экономической деятельности' --description$c text
											   , 'fns_form_1nom' --schema$c varchar(100)
											   , 'fns_form_1nom_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_1nom' --schema$c varchar(100)
											   , 'fns_form_1nom_dict_fns_indicators' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'fns_indicators' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_1nom' --schema$c varchar(100)
											   , 'fns_form_1nom_dict_fns_columns' --table_name$c varchar(100)
											   , 'Графа' --description$c text
											   , 'fns_columns' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_1nom' --schema$c varchar(100)
											   , 'fns_form_1nom_dict_rf_regions' --table_name$c varchar(100)
											   , 'Субъект РФ' --description$c text
											   , 'rf_regions' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_1nom' --schema$c varchar(100)
											   , 'fns_form_1nom_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('fns_form_4nm' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'ФНС — Отчет (форма 4-НМ) о задолженности по налогам и сборам, пеням и налоговым санкциям в бюджетную систему Российской Федерации' --description$c text
											   , 'fns_form_4nm' --schema$c varchar(100)
											   , 'fns_form_4nm_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_4nm' --schema$c varchar(100)
											   , 'fns_form_4nm_dict_fns_indicators' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'fns_indicators' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_4nm' --schema$c varchar(100)
											   , 'fns_form_4nm_dict_fns_columns' --table_name$c varchar(100)
											   , 'Графа' --description$c text
											   , 'fns_columns' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_4nm' --schema$c varchar(100)
											   , 'fns_form_4nm_dict_rf_regions' --table_name$c varchar(100)
											   , 'Субъект РФ' --description$c text
											   , 'rf_regions' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_4nm' --schema$c varchar(100)
											   , 'fns_form_4nm_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('fns_form_4nom' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'ФНС — Отчет (форма 4-НОМ) о задолженности по налогам и сборам, пеням и налоговым санкциям в бюджетную систему Российской Федерации по основным видам экономической деятельности' --description$c text
											   , 'fns_form_4nom' --schema$c varchar(100)
											   , 'fns_form_4nom_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_4nom' --schema$c varchar(100)
											   , 'fns_form_4nom_dict_fns_indicators' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'fns_indicators' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_4nom' --schema$c varchar(100)
											   , 'fns_form_4nom_dict_fns_columns' --table_name$c varchar(100)
											   , 'Графа' --description$c text
											   , 'fns_columns' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_4nom' --schema$c varchar(100)
											   , 'fns_form_4nom_dict_rf_regions' --table_name$c varchar(100)
											   , 'Субъект РФ' --description$c text
											   , 'rf_regions' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_4nom' --schema$c varchar(100)
											   , 'fns_form_4nom_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('fns_form_5envd' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'ФНС — Отчет (форма 5-ЕНВД) о налоговой базе и структуре начислений по единому налогу на вмененный доход для отдельных видов деятельности' --description$c text
											   , 'fns_form_5envd' --schema$c varchar(100)
											   , 'fns_form_5envd_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_5envd' --schema$c varchar(100)
											   , 'fns_form_5envd_dict_fns_indicators' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'fns_indicators' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_5envd' --schema$c varchar(100)
											   , 'fns_form_5envd_dict_fns_columns' --table_name$c varchar(100)
											   , 'Графа' --description$c text
											   , 'fns_columns' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_5envd' --schema$c varchar(100)
											   , 'fns_form_5envd_dict_rf_regions' --table_name$c varchar(100)
											   , 'Субъект РФ' --description$c text
											   , 'rf_regions' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_5envd' --schema$c varchar(100)
											   , 'fns_form_5envd_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('fns_form_5mn' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'ФНС — Отчет (форма 5-МН) о налоговой базе и структуре начислений по местным налогам' --description$c text
											   , 'fns_form_5mn' --schema$c varchar(100)
											   , 'fns_form_5mn_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_5mn' --schema$c varchar(100)
											   , 'fns_form_5mn_dict_fns_indicators' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'fns_indicators' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_5mn' --schema$c varchar(100)
											   , 'fns_form_5mn_dict_fns_columns' --table_name$c varchar(100)
											   , 'Графа' --description$c text
											   , 'fns_columns' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_5mn' --schema$c varchar(100)
											   , 'fns_form_5mn_dict_rf_regions' --table_name$c varchar(100)
											   , 'Субъект РФ' --description$c text
											   , 'rf_regions' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_5mn' --schema$c varchar(100)
											   , 'fns_form_5mn_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('fns_form_5nio' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'ФНС — Отчет (форма 5-НИО) о налоговой базе и структуре начислений по налогу на имущество организаций' --description$c text
											   , 'fns_form_5nio' --schema$c varchar(100)
											   , 'fns_form_5nio_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_5nio' --schema$c varchar(100)
											   , 'fns_form_5nio_dict_fns_indicators' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'fns_indicators' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_5nio' --schema$c varchar(100)
											   , 'fns_form_5nio_dict_fns_columns' --table_name$c varchar(100)
											   , 'Графа' --description$c text
											   , 'fns_columns' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_5nio' --schema$c varchar(100)
											   , 'fns_form_5nio_dict_rf_regions' --table_name$c varchar(100)
											   , 'Субъект РФ' --description$c text
											   , 'rf_regions' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_5nio' --schema$c varchar(100)
											   , 'fns_form_5nio_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('fns_form_5pm' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'ФНС — Отчет (форма 5-ПМ) о налоговой базе и структуре начислений по налогу на прибыль организаций, зачисляемому в бюджет субъекта Российской Федерации' --description$c text
											   , 'fns_form_5pm' --schema$c varchar(100)
											   , 'fns_form_5pm_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_5pm' --schema$c varchar(100)
											   , 'fns_form_5pm_dict_fns_indicators' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'fns_indicators' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_5pm' --schema$c varchar(100)
											   , 'fns_form_5pm_dict_fns_columns' --table_name$c varchar(100)
											   , 'Графа' --description$c text
											   , 'fns_columns' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_5pm' --schema$c varchar(100)
											   , 'fns_form_5pm_dict_rf_regions' --table_name$c varchar(100)
											   , 'Субъект РФ' --description$c text
											   , 'rf_regions' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_5pm' --schema$c varchar(100)
											   , 'fns_form_5pm_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('fns_form_5tn' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'ФНС — Отчет (форма 5-ТН) о структуре начислений по транспортному налогу' --description$c text
											   , 'fns_form_5tn' --schema$c varchar(100)
											   , 'fns_form_5tn_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_5tn' --schema$c varchar(100)
											   , 'fns_form_5tn_dict_fns_indicators' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'fns_indicators' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_5tn' --schema$c varchar(100)
											   , 'fns_form_5tn_dict_fns_columns' --table_name$c varchar(100)
											   , 'Графа' --description$c text
											   , 'fns_columns' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_5tn' --schema$c varchar(100)
											   , 'fns_form_5tn_dict_rf_regions' --table_name$c varchar(100)
											   , 'Субъект РФ' --description$c text
											   , 'rf_regions' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_5tn' --schema$c varchar(100)
											   , 'fns_form_5tn_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('fns_form_5usn' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'ФНС — Отчет (форма 5-УСН) о налоговой базе и структуре начислений по налогу, уплачиваемому в связи с применением упрощенной системы налогообложения' --description$c text
											   , 'fns_form_5usn' --schema$c varchar(100)
											   , 'fns_form_5usn_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_5usn' --schema$c varchar(100)
											   , 'fns_form_5usn_dict_fns_indicators' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'fns_indicators' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_5usn' --schema$c varchar(100)
											   , 'fns_form_5usn_dict_fns_columns' --table_name$c varchar(100)
											   , 'Графа' --description$c text
											   , 'fns_columns' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_5usn' --schema$c varchar(100)
											   , 'fns_form_5usn_dict_rf_regions' --table_name$c varchar(100)
											   , 'Субъект РФ' --description$c text
											   , 'rf_regions' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fns_form_5usn' --schema$c varchar(100)
											   , 'fns_form_5usn_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('fso_reg_switzerland' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'FSO — Региональная статистика Швейцарии' --description$c text
											   , 'fso_reg_switzerland' --schema$c varchar(100)
											   , 'fso_reg_switzerland_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fso_reg_switzerland' --schema$c varchar(100)
											   , 'fso_reg_switzerland_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fso_reg_switzerland' --schema$c varchar(100)
											   , 'fso_reg_switzerland_dict_indicator' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'indicator' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fso_reg_switzerland' --schema$c varchar(100)
											   , 'fso_reg_switzerland_dict_region' --table_name$c varchar(100)
											   , 'Административное деление Швейцарии' --description$c text
											   , 'region' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('fst_sgr' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'ФСТ — Актуальные тарифы по сферам госрегулирования' --description$c text
											   , 'fst_sgr' --schema$c varchar(100)
											   , 'fst_sgr_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fst_sgr' --schema$c varchar(100)
											   , 'fst_sgr_dict_fst_indicators' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'fst_indicators' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fst_sgr' --schema$c varchar(100)
											   , 'fst_sgr_dict_rf_regions' --table_name$c varchar(100)
											   , 'Регион' --description$c text
											   , 'rf_regions' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fst_sgr' --schema$c varchar(100)
											   , 'fst_sgr_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('fst_telecom' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'ФСТ — Сфера услуг общедоступной электросвязи и общедоступной почтовой связи' --description$c text
											   , 'fst_telecom' --schema$c varchar(100)
											   , 'fst_telecom_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fst_telecom' --schema$c varchar(100)
											   , 'fst_telecom_dict_telecom_indicators' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'telecom_indicators' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fst_telecom' --schema$c varchar(100)
											   , 'fst_telecom_dict_telecom_type' --table_name$c varchar(100)
											   , 'Тип сети' --description$c text
											   , 'telecom_type' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fst_telecom' --schema$c varchar(100)
											   , 'fst_telecom_dict_telecom_operators' --table_name$c varchar(100)
											   , 'Оператор' --description$c text
											   , 'telecom_operators' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fst_telecom' --schema$c varchar(100)
											   , 'fst_telecom_dict_rf_regions' --table_name$c varchar(100)
											   , 'Субъект РФ' --description$c text
											   , 'rf_regions' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'fst_telecom' --schema$c varchar(100)
											   , 'fst_telecom_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('gfp_data' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'GFP — Военная мощность стран мира' --description$c text
											   , 'gfp_data' --schema$c varchar(100)
											   , 'gfp_data_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'gfp_data' --schema$c varchar(100)
											   , 'gfp_data_dict_unit' --table_name$c varchar(100)
											   , 'Unit' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'gfp_data' --schema$c varchar(100)
											   , 'gfp_data_dict_military_mark' --table_name$c varchar(100)
											   , 'Показатели' --description$c text
											   , 'military_mark' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'gfp_data' --schema$c varchar(100)
											   , 'gfp_data_dict_military_country' --table_name$c varchar(100)
											   , 'Страны' --description$c text
											   , 'military_country' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('gho' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'WHO — Глобальная обсерватория здоровья' --description$c text
											   , 'gho' --schema$c varchar(100)
											   , 'gho_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'gho' --schema$c varchar(100)
											   , 'gho_dict_obj' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'obj' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'gho' --schema$c varchar(100)
											   , 'gho_dict_countries' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'countries' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'gho' --schema$c varchar(100)
											   , 'gho_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('iaea__power_reactor_information_system' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'IAEA — Информационная система энергетических реакторов' --description$c text
											   , 'iaea__power_reactor_information_system' --schema$c varchar(100)
											   , 'iaea__power_reactor_information_system_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'iaea__power_reactor_information_system' --schema$c varchar(100)
											   , 'iaea__power_reactor_information_system_dict_indicators' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'indicators' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'iaea__power_reactor_information_system' --schema$c varchar(100)
											   , 'iaea__power_reactor_information_system_dict_countries' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'countries' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'iaea__power_reactor_information_system' --schema$c varchar(100)
											   , 'iaea__power_reactor_information_system_dict_reactors' --table_name$c varchar(100)
											   , 'Наименование реактора' --description$c text
											   , 'reactors' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'iaea__power_reactor_information_system' --schema$c varchar(100)
											   , 'iaea__power_reactor_information_system_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('iai' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'IAI — Статистика алюминиевой отрасли' --description$c text
											   , 'iai' --schema$c varchar(100)
											   , 'iai_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'iai' --schema$c varchar(100)
											   , 'iai_dict_iai_ind' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'iai_ind' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'iai' --schema$c varchar(100)
											   , 'iai_dict_countries' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'countries' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'iai' --schema$c varchar(100)
											   , 'iai_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('ilo__main_indicators' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'ILO — Оценки и прогноз численности экономически активного населения' --description$c text
											   , 'ilo__main_indicators' --schema$c varchar(100)
											   , 'ilo__main_indicators_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'ilo__main_indicators' --schema$c varchar(100)
											   , 'ilo__main_indicators_dict_indicator' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'indicator' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'ilo__main_indicators' --schema$c varchar(100)
											   , 'ilo__main_indicators_dict_country' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'country' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'ilo__main_indicators' --schema$c varchar(100)
											   , 'ilo__main_indicators_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('imf_pcp_data' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'IMF — Цены на основные товары' --description$c text
											   , 'imf_pcp_data' --schema$c varchar(100)
											   , 'imf_pcp_data_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'imf_pcp_data' --schema$c varchar(100)
											   , 'imf_pcp_data_dict_indicator' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'indicator' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'imf_pcp_data' --schema$c varchar(100)
											   , 'imf_pcp_data_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('import_export_country_rus_goods' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'ФТС — База данных таможенной статистики внешней торговли' --description$c text
											   , 'import_export_country_rus_goods' --schema$c varchar(100)
											   , 'import_export_country_rus_goods_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'import_export_country_rus_goods' --schema$c varchar(100)
											   , 'import_export_country_rus_goods_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'import_export_country_rus_goods' --schema$c varchar(100)
											   , 'import_export_country_rus_goods_dict_indicator' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'indicator' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'import_export_country_rus_goods' --schema$c varchar(100)
											   , 'import_export_country_rus_goods_dict_rf_region' --table_name$c varchar(100)
											   , 'Субъект РФ' --description$c text
											   , 'rf_region' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'import_export_country_rus_goods' --schema$c varchar(100)
											   , 'import_export_country_rus_goods_dict_country' --table_name$c varchar(100)
											   , 'Страна партнёр' --description$c text
											   , 'country' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'import_export_country_rus_goods' --schema$c varchar(100)
											   , 'import_export_country_rus_goods_dict_type_action' --table_name$c varchar(100)
											   , 'Тип ВЭД' --description$c text
											   , 'type_action' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'import_export_country_rus_goods' --schema$c varchar(100)
											   , 'import_export_country_rus_goods_dict_tnved' --table_name$c varchar(100)
											   , 'ТНВЭД' --description$c text
											   , 'tnved' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('import_export_of_russia_goods' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'ФТС — Импорт / Экспорт Российской Федерации по важнейшим видам товаров' --description$c text
											   , 'import_export_of_russia_goods' --schema$c varchar(100)
											   , 'import_export_of_russia_goods_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'import_export_of_russia_goods' --schema$c varchar(100)
											   , 'import_export_of_russia_goods_dict_goods' --table_name$c varchar(100)
											   , 'Группа основных товаров' --description$c text
											   , 'goods' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'import_export_of_russia_goods' --schema$c varchar(100)
											   , 'import_export_of_russia_goods_dict_type_action' --table_name$c varchar(100)
											   , 'Тип ВЭД' --description$c text
											   , 'type_action' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'import_export_of_russia_goods' --schema$c varchar(100)
											   , 'import_export_of_russia_goods_dict_area' --table_name$c varchar(100)
											   , 'Направление(область) импорта/экспорта' --description$c text
											   , 'area' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'import_export_of_russia_goods' --schema$c varchar(100)
											   , 'import_export_of_russia_goods_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('kz_stat_db' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'КазахСтат — Макроэкономическая и банковская статистика Казахстана' --description$c text
											   , 'kz_stat_db' --schema$c varchar(100)
											   , 'kz_stat_db_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'kz_stat_db' --schema$c varchar(100)
											   , 'kz_stat_db_dict_kz_indicators' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'kz_indicators' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'kz_stat_db' --schema$c varchar(100)
											   , 'kz_stat_db_dict_kz_regions' --table_name$c varchar(100)
											   , 'Субъект республики' --description$c text
											   , 'kz_regions' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'kz_stat_db' --schema$c varchar(100)
											   , 'kz_stat_db_dict_type_of_values' --table_name$c varchar(100)
											   , 'Тип данных' --description$c text
											   , 'type_of_values' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'kz_stat_db' --schema$c varchar(100)
											   , 'kz_stat_db_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('kz_stat_population' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'КазахСтат — Показатели рынка труда Республики Казахстан' --description$c text
											   , 'kz_stat_population' --schema$c varchar(100)
											   , 'kz_stat_population_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'kz_stat_population' --schema$c varchar(100)
											   , 'kz_stat_population_dict_kz_regions' --table_name$c varchar(100)
											   , 'Регион' --description$c text
											   , 'kz_regions' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'kz_stat_population' --schema$c varchar(100)
											   , 'kz_stat_population_dict_kz_stat_population_ind' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'kz_stat_population_ind' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'kz_stat_population' --schema$c varchar(100)
											   , 'kz_stat_population_dict_kz_stat_population_data_type' --table_name$c varchar(100)
											   , 'Тип данных' --description$c text
											   , 'kz_stat_population_data_type' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'kz_stat_population' --schema$c varchar(100)
											   , 'kz_stat_population_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('mer_socio_economic_development' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'Минэкономразвития России — Долгосрочное социально-экономическое развитие Российской Федерации до 2020 года' --description$c text
											   , 'mer_socio_economic_development' --schema$c varchar(100)
											   , 'mer_socio_economic_development_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'mer_socio_economic_development' --schema$c varchar(100)
											   , 'mer_socio_economic_development_dict_indicator' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'indicator' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'mer_socio_economic_development' --schema$c varchar(100)
											   , 'mer_socio_economic_development_dict_data_type' --table_name$c varchar(100)
											   , 'Тип данных' --description$c text
											   , 'data_type' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'mer_socio_economic_development' --schema$c varchar(100)
											   , 'mer_socio_economic_development_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('meteo_data' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'Погода и климат — Температура воздуха и осадки в населенных пунктах РФ' --description$c text
											   , 'meteo_data' --schema$c varchar(100)
											   , 'meteo_data_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'meteo_data' --schema$c varchar(100)
											   , 'meteo_data_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'meteo_data' --schema$c varchar(100)
											   , 'meteo_data_dict_meteo_indicators' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'meteo_indicators' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'meteo_data' --schema$c varchar(100)
											   , 'meteo_data_dict_meteo_city' --table_name$c varchar(100)
											   , 'Населенный пункт' --description$c text
											   , 'meteo_city' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'meteo_data' --schema$c varchar(100)
											   , 'meteo_data_dict_meteo_stations' --table_name$c varchar(100)
											   , 'Станция' --description$c text
											   , 'meteo_stations' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('micex_index_gov_bonds_rgbi' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'ММВБ — Индекс государственных облигаций RGBI' --description$c text
											   , 'micex_index_gov_bonds_rgbi' --schema$c varchar(100)
											   , 'micex_index_gov_bonds_rgbi_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'micex_index_gov_bonds_rgbi' --schema$c varchar(100)
											   , 'micex_index_gov_bonds_rgbi_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'micex_index_gov_bonds_rgbi' --schema$c varchar(100)
											   , 'micex_index_gov_bonds_rgbi_dict_micex_index_gov_bonds_rgbi_ind' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'micex_index_gov_bonds_rgbi_ind' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('minfin_budget' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'Федеральное казначейство РФ — Показатели исполнения бюджетов РФ' --description$c text
											   , 'minfin_budget' --schema$c varchar(100)
											   , 'minfin_budget_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'minfin_budget' --schema$c varchar(100)
											   , 'minfin_budget_dict_indicator' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'indicator' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'minfin_budget' --schema$c varchar(100)
											   , 'minfin_budget_dict_operations_sg' --table_name$c varchar(100)
											   , 'Предметная статья' --description$c text
											   , 'operations_sg' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'minfin_budget' --schema$c varchar(100)
											   , 'minfin_budget_dict_budget_level' --table_name$c varchar(100)
											   , 'Уровень бюджета' --description$c text
											   , 'budget_level' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'minfin_budget' --schema$c varchar(100)
											   , 'minfin_budget_dict_type_data' --table_name$c varchar(100)
											   , 'Тип данных' --description$c text
											   , 'type_data' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'minfin_budget' --schema$c varchar(100)
											   , 'minfin_budget_dict_rf_regions' --table_name$c varchar(100)
											   , 'Субъект РФ' --description$c text
											   , 'rf_regions' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'minfin_budget' --schema$c varchar(100)
											   , 'minfin_budget_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('minfin_project_budget_strategy' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'Минфин России — Проект бюджетной стратегии РФ на период до 2023 года' --description$c text
											   , 'minfin_project_budget_strategy' --schema$c varchar(100)
											   , 'minfin_project_budget_strategy_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'minfin_project_budget_strategy' --schema$c varchar(100)
											   , 'minfin_project_budget_strategy_dict_obj' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'obj' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'minfin_project_budget_strategy' --schema$c varchar(100)
											   , 'minfin_project_budget_strategy_dict_obj_1' --table_name$c varchar(100)
											   , 'Уровень бюджета' --description$c text
											   , 'obj_1' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'minfin_project_budget_strategy' --schema$c varchar(100)
											   , 'minfin_project_budget_strategy_dict_obj_2' --table_name$c varchar(100)
											   , 'Тип данных' --description$c text
											   , 'obj_2' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'minfin_project_budget_strategy' --schema$c varchar(100)
											   , 'minfin_project_budget_strategy_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('minfin_rfg_bd_new' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'Минфин России — Фонды и государственный долг субъектов РФ' --description$c text
											   , 'minfin_rfg_bd_new' --schema$c varchar(100)
											   , 'minfin_rfg_bd_new_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'minfin_rfg_bd_new' --schema$c varchar(100)
											   , 'minfin_rfg_bd_new_dict_min_fin_rfg' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'min_fin_rfg' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'minfin_rfg_bd_new' --schema$c varchar(100)
											   , 'minfin_rfg_bd_new_dict_rf_regions' --table_name$c varchar(100)
											   , 'Регион' --description$c text
											   , 'rf_regions' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'minfin_rfg_bd_new' --schema$c varchar(100)
											   , 'minfin_rfg_bd_new_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('np_sovet_potr_elect' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'НП Совет рынка — Объем потребления электроэнергии' --description$c text
											   , 'np_sovet_potr_elect' --schema$c varchar(100)
											   , 'np_sovet_potr_elect_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'np_sovet_potr_elect' --schema$c varchar(100)
											   , 'np_sovet_potr_elect_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'np_sovet_potr_elect' --schema$c varchar(100)
											   , 'np_sovet_potr_elect_dict_territory' --table_name$c varchar(100)
											   , 'Территория' --description$c text
											   , 'territory' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'np_sovet_potr_elect' --schema$c varchar(100)
											   , 'np_sovet_potr_elect_dict_indicators_sovet' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'indicators_sovet' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('ns_ukr' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'УкрСтат — Макроэкономическая статистика Украины' --description$c text
											   , 'ns_ukr' --schema$c varchar(100)
											   , 'ns_ukr_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'ns_ukr' --schema$c varchar(100)
											   , 'ns_ukr_dict_indicators_ukr_ns' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'indicators_ukr_ns' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'ns_ukr' --schema$c varchar(100)
											   , 'ns_ukr_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'ns_ukr' --schema$c varchar(100)
											   , 'ns_ukr_dict_region' --table_name$c varchar(100)
											   , 'Регион' --description$c text
											   , 'region' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('nuclear_power_reactors_in_the_world' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'IAEA — Реакторы ядерной энергии в мире' --description$c text
											   , 'nuclear_power_reactors_in_the_world' --schema$c varchar(100)
											   , 'nuclear_power_reactors_in_the_world_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'nuclear_power_reactors_in_the_world' --schema$c varchar(100)
											   , 'nuclear_power_reactors_in_the_world_dict_indicator' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'indicator' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'nuclear_power_reactors_in_the_world' --schema$c varchar(100)
											   , 'nuclear_power_reactors_in_the_world_dict_country' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'country' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'nuclear_power_reactors_in_the_world' --schema$c varchar(100)
											   , 'nuclear_power_reactors_in_the_world_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('nuclear_share_figures_1' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'WNA — База данных ядерных реакторов' --description$c text
											   , 'nuclear_share_figures_1' --schema$c varchar(100)
											   , 'nuclear_share_figures_1_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'nuclear_share_figures_1' --schema$c varchar(100)
											   , 'nuclear_share_figures_1_dict_indicator' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'indicator' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'nuclear_share_figures_1' --schema$c varchar(100)
											   , 'nuclear_share_figures_1_dict_country' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'country' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'nuclear_share_figures_1' --schema$c varchar(100)
											   , 'nuclear_share_figures_1_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('obj40542651' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'Росстат — Малое и среднее предпринимательство' --description$c text
											   , 'obj40542651' --schema$c varchar(100)
											   , 'obj40542651_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'obj40542651' --schema$c varchar(100)
											   , 'obj40542651_dict_rf_regions' --table_name$c varchar(100)
											   , 'Субъект РФ' --description$c text
											   , 'rf_regions' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'obj40542651' --schema$c varchar(100)
											   , 'obj40542651_dict_obj_1' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'obj_1' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'obj40542651' --schema$c varchar(100)
											   , 'obj40542651_dict_obj_2' --table_name$c varchar(100)
											   , 'Тип собственности' --description$c text
											   , 'obj_2' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'obj40542651' --schema$c varchar(100)
											   , 'obj40542651_dict_obj' --table_name$c varchar(100)
											   , 'Тип предприятия' --description$c text
											   , 'obj' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'obj40542651' --schema$c varchar(100)
											   , 'obj40542651_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('obj40564031' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'Компания BP — Энергетический прогноз' --description$c text
											   , 'obj40564031' --schema$c varchar(100)
											   , 'obj40564031_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'obj40564031' --schema$c varchar(100)
											   , 'obj40564031_dict_obj' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'obj' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'obj40564031' --schema$c varchar(100)
											   , 'obj40564031_dict_countries' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'countries' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'obj40564031' --schema$c varchar(100)
											   , 'obj40564031_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('obj41067055' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'Росстат — Отдельные статистические показатели по Республике Крым и г. Севастополю' --description$c text
											   , 'obj41067055' --schema$c varchar(100)
											   , 'obj41067055_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'obj41067055' --schema$c varchar(100)
											   , 'obj41067055_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'obj41067055' --schema$c varchar(100)
											   , 'obj41067055_dict_obj' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'obj' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'obj41067055' --schema$c varchar(100)
											   , 'obj41067055_dict_rf_regions' --table_name$c varchar(100)
											   , 'Субъект РФ' --description$c text
											   , 'rf_regions' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'obj41067055' --schema$c varchar(100)
											   , 'obj41067055_dict_obj_1' --table_name$c varchar(100)
											   , 'Тип данных' --description$c text
											   , 'obj_1' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('obj41121431' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'Росстат — Электробаланс' --description$c text
											   , 'obj41121431' --schema$c varchar(100)
											   , 'obj41121431_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'obj41121431' --schema$c varchar(100)
											   , 'obj41121431_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'obj41121431' --schema$c varchar(100)
											   , 'obj41121431_dict_obj' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'obj' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'obj41121431' --schema$c varchar(100)
											   , 'obj41121431_dict_rf_regions' --table_name$c varchar(100)
											   , 'Субъект РФ' --description$c text
											   , 'rf_regions' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('odyssee_data_kee' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'ODYSSEE — Ключевые показатели энергоэффективности' --description$c text
											   , 'odyssee_data_kee' --schema$c varchar(100)
											   , 'odyssee_data_kee_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'odyssee_data_kee' --schema$c varchar(100)
											   , 'odyssee_data_kee_dict_unit' --table_name$c varchar(100)
											   , 'Unit' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'odyssee_data_kee' --schema$c varchar(100)
											   , 'odyssee_data_kee_dict_odyssee_indicator' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'odyssee_indicator' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'odyssee_data_kee' --schema$c varchar(100)
											   , 'odyssee_data_kee_dict_territories_tabl_odyssee' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'territories_tabl_odyssee' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('oecd_ao' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'OECD-FAO — Перспективы сельского хозяйства' --description$c text
											   , 'oecd_ao' --schema$c varchar(100)
											   , 'oecd_ao_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'oecd_ao' --schema$c varchar(100)
											   , 'oecd_ao_dict_oecd_ao_indicators' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'oecd_ao_indicators' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'oecd_ao' --schema$c varchar(100)
											   , 'oecd_ao_dict_oecd_ao_commodities' --table_name$c varchar(100)
											   , 'Товар' --description$c text
											   , 'oecd_ao_commodities' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'oecd_ao' --schema$c varchar(100)
											   , 'oecd_ao_dict_countries' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'countries' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'oecd_ao' --schema$c varchar(100)
											   , 'oecd_ao_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('oecd_factbook_2011' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'OECD — Сборник статистики (версия 2014 г.)' --description$c text
											   , 'oecd_factbook_2011' --schema$c varchar(100)
											   , 'oecd_factbook_2011_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'oecd_factbook_2011' --schema$c varchar(100)
											   , 'oecd_factbook_2011_dict_indicators_factbook_' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'indicators_factbook_' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'oecd_factbook_2011' --schema$c varchar(100)
											   , 'oecd_factbook_2011_dict_countries' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'countries' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'oecd_factbook_2011' --schema$c varchar(100)
											   , 'oecd_factbook_2011_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('opecnew' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'OPEC — Ежемесячный обзор нефтяного рынка' --description$c text
											   , 'opecnew' --schema$c varchar(100)
											   , 'opecnew_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'opecnew' --schema$c varchar(100)
											   , 'opecnew_dict_obj_1' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'obj_1' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'opecnew' --schema$c varchar(100)
											   , 'opecnew_dict_obj' --table_name$c varchar(100)
											   , 'Товар' --description$c text
											   , 'obj' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'opecnew' --schema$c varchar(100)
											   , 'opecnew_dict_countries' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'countries' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'opecnew' --schema$c varchar(100)
											   , 'opecnew_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('pay_bal_bel' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'НБРБ — Платёжный баланс' --description$c text
											   , 'pay_bal_bel' --schema$c varchar(100)
											   , 'pay_bal_bel_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'pay_bal_bel' --schema$c varchar(100)
											   , 'pay_bal_bel_dict_pay_bal_bel' --table_name$c varchar(100)
											   , 'Статья платежного баланса' --description$c text
											   , 'pay_bal_bel' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'pay_bal_bel' --schema$c varchar(100)
											   , 'pay_bal_bel_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('pay_bal_kaz_data' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'НБК — Платежный баланс республики Казахстан' --description$c text
											   , 'pay_bal_kaz_data' --schema$c varchar(100)
											   , 'pay_bal_kaz_data_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'pay_bal_kaz_data' --schema$c varchar(100)
											   , 'pay_bal_kaz_data_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'pay_bal_kaz_data' --schema$c varchar(100)
											   , 'pay_bal_kaz_data_dict_pay_bal_kaz' --table_name$c varchar(100)
											   , 'Статьи платежого баланса' --description$c text
											   , 'pay_bal_kaz' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('posstat_ipc' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'Росстат — Индекс потребительских цен в России и зарубежных странах' --description$c text
											   , 'posstat_ipc' --schema$c varchar(100)
											   , 'posstat_ipc_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'posstat_ipc' --schema$c varchar(100)
											   , 'posstat_ipc_dict_countries' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'countries' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'posstat_ipc' --schema$c varchar(100)
											   , 'posstat_ipc_dict_pokazateli_ipc' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'pokazateli_ipc' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'posstat_ipc' --schema$c varchar(100)
											   , 'posstat_ipc_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('rbc_mfi' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'РБК — Мировые фондовые индексы' --description$c text
											   , 'rbc_mfi' --schema$c varchar(100)
											   , 'rbc_mfi_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'rbc_mfi' --schema$c varchar(100)
											   , 'rbc_mfi_dict_ticker' --table_name$c varchar(100)
											   , 'Тикер' --description$c text
											   , 'ticker' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'rbc_mfi' --schema$c varchar(100)
											   , 'rbc_mfi_dict_indicator' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'indicator' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'rbc_mfi' --schema$c varchar(100)
											   , 'rbc_mfi_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('rosstat_city' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'Росстат — Основные социально-экономические показатели городов' --description$c text
											   , 'rosstat_city' --schema$c varchar(100)
											   , 'rosstat_city_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'rosstat_city' --schema$c varchar(100)
											   , 'rosstat_city_dict_city_indicator' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'city_indicator' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'rosstat_city' --schema$c varchar(100)
											   , 'rosstat_city_dict_city' --table_name$c varchar(100)
											   , 'Город' --description$c text
											   , 'city' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'rosstat_city' --schema$c varchar(100)
											   , 'rosstat_city_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('rosstat_finasi_rf' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'Росстат — Финансы России' --description$c text
											   , 'rosstat_finasi_rf' --schema$c varchar(100)
											   , 'rosstat_finasi_rf_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'rosstat_finasi_rf' --schema$c varchar(100)
											   , 'rosstat_finasi_rf_dict_rosstat_okved_statform_new' --table_name$c varchar(100)
											   , 'ОКВЭД' --description$c text
											   , 'rosstat_okved_statform_new' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'rosstat_finasi_rf' --schema$c varchar(100)
											   , 'rosstat_finasi_rf_dict_rosstat_finans' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'rosstat_finans' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'rosstat_finasi_rf' --schema$c varchar(100)
											   , 'rosstat_finasi_rf_dict_rf_regions' --table_name$c varchar(100)
											   , 'Субъект РФ' --description$c text
											   , 'rf_regions' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'rosstat_finasi_rf' --schema$c varchar(100)
											   , 'rosstat_finasi_rf_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('rosstat_level' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'Росстат — Уровень использования среднегодовой производственной мощности организаций' --description$c text
											   , 'rosstat_level' --schema$c varchar(100)
											   , 'rosstat_level_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'rosstat_level' --schema$c varchar(100)
											   , 'rosstat_level_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'rosstat_level' --schema$c varchar(100)
											   , 'rosstat_level_dict_rosstat_level_ind' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'rosstat_level_ind' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('rosstat_pka2' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'Росстат — Социально-экономические показатели субъектов РФ' --description$c text
											   , 'rosstat_pka2' --schema$c varchar(100)
											   , 'rosstat_pka2_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'rosstat_pka2' --schema$c varchar(100)
											   , 'rosstat_pka2_dict_pokazateli_pka' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'pokazateli_pka' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'rosstat_pka2' --schema$c varchar(100)
											   , 'rosstat_pka2_dict_rf_regions' --table_name$c varchar(100)
											   , 'Субъект РФ' --description$c text
											   , 'rf_regions' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'rosstat_pka2' --schema$c varchar(100)
											   , 'rosstat_pka2_dict_data_type' --table_name$c varchar(100)
											   , 'Тип данных' --description$c text
											   , 'data_type' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'rosstat_pka2' --schema$c varchar(100)
											   , 'rosstat_pka2_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'rosstat_pka2' --schema$c varchar(100)
											   , 'rosstat_pka2_dict_series_notes' --table_name$c varchar(100)
											   , 'Примечание' --description$c text
											   , 'series_notes' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('rosstat_tec_1' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'Росстат — Показатели по топливно-энергетическому комплексу РФ' --description$c text
											   , 'rosstat_tec_1' --schema$c varchar(100)
											   , 'rosstat_tec_1_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'rosstat_tec_1' --schema$c varchar(100)
											   , 'rosstat_tec_1_dict_indicator' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'indicator' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'rosstat_tec_1' --schema$c varchar(100)
											   , 'rosstat_tec_1_dict_product' --table_name$c varchar(100)
											   , 'Продукция' --description$c text
											   , 'product' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'rosstat_tec_1' --schema$c varchar(100)
											   , 'rosstat_tec_1_dict_type_data' --table_name$c varchar(100)
											   , 'Тип данных' --description$c text
											   , 'type_data' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'rosstat_tec_1' --schema$c varchar(100)
											   , 'rosstat_tec_1_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('rosstat_vaei' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'Росстат — Важнейшие экономические показатели России и отдельных зарубежных стран' --description$c text
											   , 'rosstat_vaei' --schema$c varchar(100)
											   , 'rosstat_vaei_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'rosstat_vaei' --schema$c varchar(100)
											   , 'rosstat_vaei_dict_countries' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'countries' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'rosstat_vaei' --schema$c varchar(100)
											   , 'rosstat_vaei_dict_type_of_values' --table_name$c varchar(100)
											   , 'Тип данных' --description$c text
											   , 'type_of_values' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'rosstat_vaei' --schema$c varchar(100)
											   , 'rosstat_vaei_dict_pokazateli_veroc' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'pokazateli_veroc' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'rosstat_vaei' --schema$c varchar(100)
											   , 'rosstat_vaei_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'rosstat_vaei' --schema$c varchar(100)
											   , 'rosstat_vaei_dict_series_notes' --table_name$c varchar(100)
											   , 'Примечание' --description$c text
											   , 'series_notes' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('rosstat_vvp_2010' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'Росстат — Производство важнейших видов промышленной продукции (по кодам ОКПД)' --description$c text
											   , 'rosstat_vvp_2010' --schema$c varchar(100)
											   , 'rosstat_vvp_2010_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'rosstat_vvp_2010' --schema$c varchar(100)
											   , 'rosstat_vvp_2010_dict_pokazatel_vvp_' --table_name$c varchar(100)
											   , 'ОКПД' --description$c text
											   , 'pokazatel_vvp_' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'rosstat_vvp_2010' --schema$c varchar(100)
											   , 'rosstat_vvp_2010_dict_rf_regions' --table_name$c varchar(100)
											   , 'Субъекты РФ' --description$c text
											   , 'rf_regions' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'rosstat_vvp_2010' --schema$c varchar(100)
											   , 'rosstat_vvp_2010_dict_data_type' --table_name$c varchar(100)
											   , 'Тип данных' --description$c text
											   , 'data_type' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'rosstat_vvp_2010' --schema$c varchar(100)
											   , 'rosstat_vvp_2010_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('rst_ei_data' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'Росстат — Энергоёмкость ВРП' --description$c text
											   , 'rst_ei_data' --schema$c varchar(100)
											   , 'rst_ei_data_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'rst_ei_data' --schema$c varchar(100)
											   , 'rst_ei_data_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'rst_ei_data' --schema$c varchar(100)
											   , 'rst_ei_data_dict_rst_ec_grp' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'rst_ec_grp' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'rst_ei_data' --schema$c varchar(100)
											   , 'rst_ei_data_dict_rf_regions' --table_name$c varchar(100)
											   , 'Регион' --description$c text
											   , 'rf_regions' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('rst_esb_data' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'Росстат — Баланс энергоресурсов' --description$c text
											   , 'rst_esb_data' --schema$c varchar(100)
											   , 'rst_esb_data_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'rst_esb_data' --schema$c varchar(100)
											   , 'rst_esb_data_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'rst_esb_data' --schema$c varchar(100)
											   , 'rst_esb_data_dict_rst_esb_ind' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'rst_esb_ind' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'rst_esb_data' --schema$c varchar(100)
											   , 'rst_esb_data_dict_rst_esb_es_ind' --table_name$c varchar(100)
											   , 'Энергоресурсы' --description$c text
											   , 'rst_esb_es_ind' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('sipri_military_exp' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'SIPRI — Военные расходы' --description$c text
											   , 'sipri_military_exp' --schema$c varchar(100)
											   , 'sipri_military_exp_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'sipri_military_exp' --schema$c varchar(100)
											   , 'sipri_military_exp_dict_unit' --table_name$c varchar(100)
											   , 'Unit' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'sipri_military_exp' --schema$c varchar(100)
											   , 'sipri_military_exp_dict_sipri_ind' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'sipri_ind' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'sipri_military_exp' --schema$c varchar(100)
											   , 'sipri_military_exp_dict_sipri_country' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'sipri_country' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'sipri_military_exp' --schema$c varchar(100)
											   , 'sipri_military_exp_dict_attribute' --table_name$c varchar(100)
											   , 'Notes line' --description$c text
											   , 'attribute' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('soceconrazvrf' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'Минэкономразвития России — Социально-экономическое развитие Российской Федерации' --description$c text
											   , 'soceconrazvrf' --schema$c varchar(100)
											   , 'soceconrazvrf_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'soceconrazvrf' --schema$c varchar(100)
											   , 'soceconrazvrf_dict_min_econom_razv_rf_indicator' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'min_econom_razv_rf_indicator' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'soceconrazvrf' --schema$c varchar(100)
											   , 'soceconrazvrf_dict_min_econom_razv_rf_var' --table_name$c varchar(100)
											   , 'Вариант' --description$c text
											   , 'min_econom_razv_rf_var' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'soceconrazvrf' --schema$c varchar(100)
											   , 'soceconrazvrf_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('suder_2030_2013' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'Минэкономразвития России — Прогноз долгосрочного социально-экономического развития Российской Федерации на период до 2030 года' --description$c text
											   , 'suder_2030_2013' --schema$c varchar(100)
											   , 'suder_2030_2013_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'suder_2030_2013' --schema$c varchar(100)
											   , 'suder_2030_2013_dict_ind_suder_' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'ind_suder_' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'suder_2030_2013' --schema$c varchar(100)
											   , 'suder_2030_2013_dict_variant_suder_' --table_name$c varchar(100)
											   , 'Вариант' --description$c text
											   , 'variant_suder_' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'suder_2030_2013' --schema$c varchar(100)
											   , 'suder_2030_2013_dict_rf_regions' --table_name$c varchar(100)
											   , 'Регион' --description$c text
											   , 'rf_regions' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'suder_2030_2013' --schema$c varchar(100)
											   , 'suder_2030_2013_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('transperancy_international_new' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'TI — Индекс восприятия коррупции' --description$c text
											   , 'transperancy_international_new' --schema$c varchar(100)
											   , 'transperancy_international_new_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'transperancy_international_new' --schema$c varchar(100)
											   , 'transperancy_international_new_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'transperancy_international_new' --schema$c varchar(100)
											   , 'transperancy_international_new_dict_indicator' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'indicator' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'transperancy_international_new' --schema$c varchar(100)
											   , 'transperancy_international_new_dict_country' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'country' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('turkmenstat_comm_data' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'Госкомстат Туркменистана — Средние рыночно-розничные цены на основные товары по Туркменистану и велаятам' --description$c text
											   , 'turkmenstat_comm_data' --schema$c varchar(100)
											   , 'turkmenstat_comm_data_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'turkmenstat_comm_data' --schema$c varchar(100)
											   , 'turkmenstat_comm_data_dict_turkmenstat_commodity' --table_name$c varchar(100)
											   , 'Товар' --description$c text
											   , 'turkmenstat_commodity' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'turkmenstat_comm_data' --schema$c varchar(100)
											   , 'turkmenstat_comm_data_dict_turkmenstat_regions' --table_name$c varchar(100)
											   , 'Территория' --description$c text
											   , 'turkmenstat_regions' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'turkmenstat_comm_data' --schema$c varchar(100)
											   , 'turkmenstat_comm_data_dict_turkmenstat_indicator' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'turkmenstat_indicator' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'turkmenstat_comm_data' --schema$c varchar(100)
											   , 'turkmenstat_comm_data_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('turkmenstat_macro' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'Госкомстат Туркменистана — Основные социально-экономические показатели Туркменистана' --description$c text
											   , 'turkmenstat_macro' --schema$c varchar(100)
											   , 'turkmenstat_macro_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'turkmenstat_macro' --schema$c varchar(100)
											   , 'turkmenstat_macro_dict_turkmenstat_indicators' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'turkmenstat_indicators' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'turkmenstat_macro' --schema$c varchar(100)
											   , 'turkmenstat_macro_dict_turkmenstat_regions' --table_name$c varchar(100)
											   , 'Территория' --description$c text
											   , 'turkmenstat_regions' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'turkmenstat_macro' --schema$c varchar(100)
											   , 'turkmenstat_macro_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('un_ics' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'UN — Статистика промышленной продукции' --description$c text
											   , 'un_ics' --schema$c varchar(100)
											   , 'un_ics_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'un_ics' --schema$c varchar(100)
											   , 'un_ics_dict_un_ics_commodity' --table_name$c varchar(100)
											   , 'Товар' --description$c text
											   , 'un_ics_commodity' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'un_ics' --schema$c varchar(100)
											   , 'un_ics_dict_countries' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'countries' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'un_ics' --schema$c varchar(100)
											   , 'un_ics_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('un_na_ocd' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'UN — Официальные данные по национальным счетам' --description$c text
											   , 'un_na_ocd' --schema$c varchar(100)
											   , 'un_na_ocd_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'un_na_ocd' --schema$c varchar(100)
											   , 'un_na_ocd_dict_un_sna_indicators' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'un_sna_indicators' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'un_na_ocd' --schema$c varchar(100)
											   , 'un_na_ocd_dict_un_sna_base_years' --table_name$c varchar(100)
											   , 'Базовый год' --description$c text
											   , 'un_sna_base_years' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'un_na_ocd' --schema$c varchar(100)
											   , 'un_na_ocd_dict_countries' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'countries' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'un_na_ocd' --schema$c varchar(100)
											   , 'un_na_ocd_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('un_snaama' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'UN — Сводные показатели национальных счетов' --description$c text
											   , 'un_snaama' --schema$c varchar(100)
											   , 'un_snaama_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'un_snaama' --schema$c varchar(100)
											   , 'un_snaama_dict_indicator' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'indicator' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'un_snaama' --schema$c varchar(100)
											   , 'un_snaama_dict_activity' --table_name$c varchar(100)
											   , 'Вид деятельности' --description$c text
											   , 'activity' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'un_snaama' --schema$c varchar(100)
											   , 'un_snaama_dict_country' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'country' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'un_snaama' --schema$c varchar(100)
											   , 'un_snaama_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('undp_hdi_data' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'UNDP — Индекс развития человеческого потенциала' --description$c text
											   , 'undp_hdi_data' --schema$c varchar(100)
											   , 'undp_hdi_data_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'undp_hdi_data' --schema$c varchar(100)
											   , 'undp_hdi_data_dict_countries' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'countries' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'undp_hdi_data' --schema$c varchar(100)
											   , 'undp_hdi_data_dict_undp_hdi_index' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'undp_hdi_index' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'undp_hdi_data' --schema$c varchar(100)
											   , 'undp_hdi_data_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('unm_data' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'Росстат — Обследование населения по проблемам занятости' --description$c text
											   , 'unm_data' --schema$c varchar(100)
											   , 'unm_data_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'unm_data' --schema$c varchar(100)
											   , 'unm_data_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'unm_data' --schema$c varchar(100)
											   , 'unm_data_dict_rf_regions' --table_name$c varchar(100)
											   , 'Регион' --description$c text
											   , 'rf_regions' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'unm_data' --schema$c varchar(100)
											   , 'unm_data_dict_unm_indicator' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'unm_indicator' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'unm_data' --schema$c varchar(100)
											   , 'unm_data_dict_family_type' --table_name$c varchar(100)
											   , 'Семейное положение' --description$c text
											   , 'family_type' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'unm_data' --schema$c varchar(100)
											   , 'unm_data_dict_education_type' --table_name$c varchar(100)
											   , 'Уровень образования' --description$c text
											   , 'education_type' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'unm_data' --schema$c varchar(100)
											   , 'unm_data_dict_settling_type' --table_name$c varchar(100)
											   , 'Тип поселения' --description$c text
											   , 'settling_type' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'unm_data' --schema$c varchar(100)
											   , 'unm_data_dict_age_type' --table_name$c varchar(100)
											   , 'Возраст' --description$c text
											   , 'age_type' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'unm_data' --schema$c varchar(100)
											   , 'unm_data_dict_gender_type' --table_name$c varchar(100)
											   , 'Пол' --description$c text
											   , 'gender_type' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('unodc_ccjs' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'UNODC — Статистика по преступности и уголовным правонарушениям' --description$c text
											   , 'unodc_ccjs' --schema$c varchar(100)
											   , 'unodc_ccjs_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'unodc_ccjs' --schema$c varchar(100)
											   , 'unodc_ccjs_dict_ccjs_cryme_type' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'ccjs_cryme_type' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'unodc_ccjs' --schema$c varchar(100)
											   , 'unodc_ccjs_dict_countries' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'countries' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'unodc_ccjs' --schema$c varchar(100)
											   , 'unodc_ccjs_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('unwto_tourism' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'WTO — Мировые данные по туризму' --description$c text
											   , 'unwto_tourism' --schema$c varchar(100)
											   , 'unwto_tourism_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'unwto_tourism' --schema$c varchar(100)
											   , 'unwto_tourism_dict_obj40019623' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'obj40019623' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'unwto_tourism' --schema$c varchar(100)
											   , 'unwto_tourism_dict_countries' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'countries' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'unwto_tourism' --schema$c varchar(100)
											   , 'unwto_tourism_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'unwto_tourism' --schema$c varchar(100)
											   , 'unwto_tourism_dict_attribute' --table_name$c varchar(100)
											   , 'Примечание' --description$c text
											   , 'attribute' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('us_patent' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'USPTO — Патентирование в США по географическим регионам' --description$c text
											   , 'us_patent' --schema$c varchar(100)
											   , 'us_patent_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'us_patent' --schema$c varchar(100)
											   , 'us_patent_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'us_patent' --schema$c varchar(100)
											   , 'us_patent_dict_countries' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'countries' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'us_patent' --schema$c varchar(100)
											   , 'us_patent_dict_us_patent_organisations' --table_name$c varchar(100)
											   , 'Организация' --description$c text
											   , 'us_patent_organisations' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('usda_cf' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'USDA — Долгосрочные сельскохозяйственные прогнозы США' --description$c text
											   , 'usda_cf' --schema$c varchar(100)
											   , 'usda_cf_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'usda_cf' --schema$c varchar(100)
											   , 'usda_cf_dict_indicators_cf' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'indicators_cf' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'usda_cf' --schema$c varchar(100)
											   , 'usda_cf_dict_commodities_cf' --table_name$c varchar(100)
											   , 'Товар' --description$c text
											   , 'commodities_cf' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'usda_cf' --schema$c varchar(100)
											   , 'usda_cf_dict_countries' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'countries' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'usda_cf' --schema$c varchar(100)
											   , 'usda_cf_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('usda_psd' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'USDA — Производство, предложение и распространение' --description$c text
											   , 'usda_psd' --schema$c varchar(100)
											   , 'usda_psd_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'usda_psd' --schema$c varchar(100)
											   , 'usda_psd_dict_indicators_psd' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'indicators_psd' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'usda_psd' --schema$c varchar(100)
											   , 'usda_psd_dict_commodities_psd' --table_name$c varchar(100)
											   , 'Товар' --description$c text
											   , 'commodities_psd' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'usda_psd' --schema$c varchar(100)
											   , 'usda_psd_dict_countries' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'countries' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'usda_psd' --schema$c varchar(100)
											   , 'usda_psd_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('usdaapdaily' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'USDA — Ежедневные цены на сельскохозяйственную продукцию' --description$c text
											   , 'usdaapdaily' --schema$c varchar(100)
											   , 'usdaapdaily_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'usdaapdaily' --schema$c varchar(100)
											   , 'usdaapdaily_dict_commodity' --table_name$c varchar(100)
											   , 'Товар' --description$c text
											   , 'commodity' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'usdaapdaily' --schema$c varchar(100)
											   , 'usdaapdaily_dict_area' --table_name$c varchar(100)
											   , 'Территория' --description$c text
											   , 'area' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'usdaapdaily' --schema$c varchar(100)
											   , 'usdaapdaily_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('wb_irai' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'WB — IDA Индекс распределения ресурсов' --description$c text
											   , 'wb_irai' --schema$c varchar(100)
											   , 'wb_irai_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'wb_irai' --schema$c varchar(100)
											   , 'wb_irai_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'wb_irai' --schema$c varchar(100)
											   , 'wb_irai_dict_indicator' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'indicator' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'wb_irai' --schema$c varchar(100)
											   , 'wb_irai_dict_country' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'country' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('wb_wdi' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'WB — Показатели мирового развития' --description$c text
											   , 'wb_wdi' --schema$c varchar(100)
											   , 'wb_wdi_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'wb_wdi' --schema$c varchar(100)
											   , 'wb_wdi_dict_indicator' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'indicator' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'wb_wdi' --schema$c varchar(100)
											   , 'wb_wdi_dict_country' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'country' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'wb_wdi' --schema$c varchar(100)
											   , 'wb_wdi_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('wbcp2' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'WB — Данные о ценах на товары' --description$c text
											   , 'wbcp2' --schema$c varchar(100)
											   , 'wbcp2_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'wbcp2' --schema$c varchar(100)
											   , 'wbcp2_dict_obj' --table_name$c varchar(100)
											   , 'Товар' --description$c text
											   , 'obj' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'wbcp2' --schema$c varchar(100)
											   , 'wbcp2_dict_itwbcp' --table_name$c varchar(100)
											   , 'Тип индекса' --description$c text
											   , 'itwbcp' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'wbcp2' --schema$c varchar(100)
											   , 'wbcp2_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('wbgep' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'WB — Глобальные экономические перспективы' --description$c text
											   , 'wbgep' --schema$c varchar(100)
											   , 'wbgep_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'wbgep' --schema$c varchar(100)
											   , 'wbgep_dict_obj' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'obj' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'wbgep' --schema$c varchar(100)
											   , 'wbgep_dict_countries' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'countries' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'wbgep' --schema$c varchar(100)
											   , 'wbgep_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('wbpf' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'WB — Прогнозы цен на товары' --description$c text
											   , 'wbpf' --schema$c varchar(100)
											   , 'wbpf_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'wbpf' --schema$c varchar(100)
											   , 'wbpf_dict_obj' --table_name$c varchar(100)
											   , 'Товар' --description$c text
											   , 'obj' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'wbpf' --schema$c varchar(100)
											   , 'wbpf_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('weo_imf' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'IMF — Перспективы развития мировой экономики' --description$c text
											   , 'weo_imf' --schema$c varchar(100)
											   , 'weo_imf_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'weo_imf' --schema$c varchar(100)
											   , 'weo_imf_dict_indicator' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'indicator' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'weo_imf' --schema$c varchar(100)
											   , 'weo_imf_dict_country' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'country' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'weo_imf' --schema$c varchar(100)
											   , 'weo_imf_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'weo_imf' --schema$c varchar(100)
											   , 'weo_imf_dict_notes' --table_name$c varchar(100)
											   , 'Дополнительная информация' --description$c text
											   , 'notes' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('wgi' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'WB — Всемирные показатели государственного управления' --description$c text
											   , 'wgi' --schema$c varchar(100)
											   , 'wgi_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'wgi' --schema$c varchar(100)
											   , 'wgi_dict_obj' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'obj' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'wgi' --schema$c varchar(100)
											   , 'wgi_dict_countries' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'countries' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'wgi' --schema$c varchar(100)
											   , 'wgi_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('world_steel_production' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'World Steel — Статистика производства стальной продукции' --description$c text
											   , 'world_steel_production' --schema$c varchar(100)
											   , 'world_steel_production_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'world_steel_production' --schema$c varchar(100)
											   , 'world_steel_production_dict_obj' --table_name$c varchar(100)
											   , 'Показатели' --description$c text
											   , 'obj' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'world_steel_production' --schema$c varchar(100)
											   , 'world_steel_production_dict_countries' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'countries' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'world_steel_production' --schema$c varchar(100)
											   , 'world_steel_production_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('wsj_cf_monthly' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'WSJ — Товарные фьючерсы по контрактам' --description$c text
											   , 'wsj_cf_monthly' --schema$c varchar(100)
											   , 'wsj_cf_monthly_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'wsj_cf_monthly' --schema$c varchar(100)
											   , 'wsj_cf_monthly_dict_wsj_commodity' --table_name$c varchar(100)
											   , 'Товар' --description$c text
											   , 'wsj_commodity' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'wsj_cf_monthly' --schema$c varchar(100)
											   , 'wsj_cf_monthly_dict_wsj_indicators' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'wsj_indicators' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'wsj_cf_monthly' --schema$c varchar(100)
											   , 'wsj_cf_monthly_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'wsj_cf_monthly' --schema$c varchar(100)
											   , 'wsj_cf_monthly_dict_wsj_exchanges' --table_name$c varchar(100)
											   , 'Обмен' --description$c text
											   , 'wsj_exchanges' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('wsj_commodity_futures' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'WSJ — Товарные фьючерсы' --description$c text
											   , 'wsj_commodity_futures' --schema$c varchar(100)
											   , 'wsj_commodity_futures_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'wsj_commodity_futures' --schema$c varchar(100)
											   , 'wsj_commodity_futures_dict_wsj_indicators' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'wsj_indicators' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'wsj_commodity_futures' --schema$c varchar(100)
											   , 'wsj_commodity_futures_dict_wsj_commodity' --table_name$c varchar(100)
											   , 'Товар' --description$c text
											   , 'wsj_commodity' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'wsj_commodity_futures' --schema$c varchar(100)
											   , 'wsj_commodity_futures_dict_wsj_contracts' --table_name$c varchar(100)
											   , 'Дата контракта' --description$c text
											   , 'wsj_contracts' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'wsj_commodity_futures' --schema$c varchar(100)
											   , 'wsj_commodity_futures_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'wsj_commodity_futures' --schema$c varchar(100)
											   , 'wsj_commodity_futures_dict_wsj_exchanges' --table_name$c varchar(100)
											   , 'Обмен' --description$c text
											   , 'wsj_exchanges' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
------------------------
select register_datasource('yale_university' --source_name$c varchar(100)
											   , 'jdbc:mondrian:Jdbc=jdbc:postgresql://144.76.45.85:5433/sources;JdbcUser=slemma_read_only_user;JdbcPassword=Qwerty1;' --connection_string$c varchar(100)
											   , 'Йельский университет — Индекс экологичности производства' --description$c text
											   , 'yale_university' --schema$c varchar(100)
											   , 'yale_university_data' --table_name$c varchar(100)
											   , 'dt' --time_dimention_column varchar(100)
											   , 'vl' --value_column varchar(100)
											   ) into source_id$i;
---
select register_dimension(source_id$i --integer
											   , 'yale_university' --schema$c varchar(100)
											   , 'yale_university_dict_dictt_ind_yale_university' --table_name$c varchar(100)
											   , 'Показатель' --description$c text
											   , 'dictt_ind_yale_university' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'yale_university' --schema$c varchar(100)
											   , 'yale_university_dict_countries' --table_name$c varchar(100)
											   , 'Страна' --description$c text
											   , 'countries' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
---
select register_dimension(source_id$i --integer
											   , 'yale_university' --schema$c varchar(100)
											   , 'yale_university_dict_unit' --table_name$c varchar(100)
											   , 'Единица измерения' --description$c text
											   , 'unit' --source_column$c varchar(100)
											   , 'key' --key_column$c varchar(100)
											   , 'name_ru' --name_column$c varchar(100)
											   , 'parent_key' --parent_column$c varchar(100)
											   ) into dimension_id$i;
end
$$;
