create or replace function prepare_source_fill_table_time_dimensions(schema_name$c varchar(100)
                                                                       , data_table_name$c varchar(100) -- ������������ ������� � �������
                                                                       , show_debug$b boolean -- ���������� �� ���������� ���������
                                                                       , exec_scripts$b boolean -- ��������� �� DDL �������
                                                                       ) returns void as $$
declare
query_text$c text;
table_name$c text;
begin
end;
$$ language plpgsql;

