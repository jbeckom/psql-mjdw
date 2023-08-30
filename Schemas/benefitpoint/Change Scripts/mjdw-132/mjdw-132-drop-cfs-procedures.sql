DROP FUNCTION IF EXISTS benefitpoint.sp_custom_field_dependent_fields_link(int, int);
GO 

DROP FUNCTION IF EXISTS benefitpoint.sp_custom_field_dependent_fields_upsert(int, text);
GO 

DROP FUNCTION IF EXISTS benefitpoint.sp_custom_field_dependent_trigger_upsert(int, text);
GO 

DROP FUNCTION IF EXISTS benefitpoint.sp_custom_field_option_value_upsert(TEXT, int, int, text);
GO 

DROP FUNCTION IF EXISTS benefitpoint.sp_custom_field_option_values_link(int, int);
GO 

DROP FUNCTION IF EXISTS benefitpoint.sp_custom_field_value_upsert(TEXT, int, text);
GO 

DROP FUNCTION IF EXISTS benefitpoint.sp_custom_fields_upsert(TEXT, int, text);
GO 

DROP FUNCTION IF EXISTS benefitpoint.sp_custom_section_upsert(TEXT, TEXT, text);
GO 

DROP FUNCTION IF EXISTS benefitpoint.sp_custom_section_account_customization_categories_link(TEXT, text);
GO 
