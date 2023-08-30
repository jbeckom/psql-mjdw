/*** DROP EXISTING STRUCTURE ***/
DROP TABLE IF EXISTS benefitpoint.custom_field CASCADE;
GO 

DROP TABLE IF EXISTS benefitpoint.custom_field_option_values CASCADE;
GO 

DROP TABLE IF EXISTS benefitpoint.custom_field_option_value CASCADE;
GO 

DROP TABLE IF EXISTS benefitpoint.custom_field_custom_field_option_values CASCADE;
GO 

DROP TABLE IF EXISTS benefitpoint.custom_field_dependent_fields CASCADE;
GO 

/*** NEW CUSTOM FIELD STRUCTURE ***/
CREATE TABLE benefitpoint.custom_field (
	 custom_section 	TEXT 	NOT NULL 
	,custom_field_id 	int 	NOT NULL 
	,field_type 		TEXT 	NOT NULL 
	,field_value_type 	TEXT 	NULL 
	,"length" 			int 	NULL 
	,"label" 			TEXT 	NOT NULL 
	,required 			bool 	NULL 
	,active 			bool 	NULL 
	,sort_order 		int 	NOT NULL 
	,phi 				bool 	NULL 
	,sagitta 			bool 	NULL 
	,sagitta_category 	TEXT 	NULL 
	,dependent_field_parent_id 	int 	NULL 
	,CONSTRAINT custom_field_pkey PRIMARY KEY (custom_field_id)
);
GO 

/*** PERMISSIONS ***/
GRANT SELECT ON benefitpoint.custom_field TO rl_benefitpoint_r;
GO 

GRANT INSERT ON benefitpoint.custom_field TO rl_benefitpoint_a;
GO 

GRANT UPDATE ON benefitpoint.custom_field TO rl_benefitpoint_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON benefitpoint.custom_field FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_custom_field_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON benefitpoint.custom_field FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_custom_field_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON benefitpoint.custom_field FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION benefitpoint.tr_audit_custom_field_u();
GO 

/*** NEW CUSTOM FIELD OPTION VALUE STRUCTURE ***/
CREATE TABLE benefitpoint.custom_field_option_value (
	 custom_field_id 				int 	NOT NULL 
	,custom_field_option_value_id 	int 	NOT NULL 
	,description 					TEXT 	NOT NULL 
	,active 						bool 	NULL 
	,sort_order 					int 	NOT NULL 
	,default_option_value 			bool 	NULL 
	,code 							TEXT 	NULL 
	,dependent_trigger 				bool 	NOT NULL 
	,CONSTRAINT custom_field_option_value_pkey PRIMARY KEY (custom_field_option_value_id)
);
GO 

/*** PERMISSIONS ***/
GRANT SELECT ON benefitpoint.custom_field_option_value TO rl_benefitpoint_r;
GO 

GRANT INSERT ON benefitpoint.custom_field_option_value TO rl_benefitpoint_a;
GO 

GRANT UPDATE ON benefitpoint.custom_field_option_value TO rl_benefitpoint_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON benefitpoint.custom_field_option_value FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_custom_field_option_value_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON benefitpoint.custom_field_option_value FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_custom_field_option_value_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON benefitpoint.custom_field_option_value FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION benefitpoint.tr_audit_custom_field_option_value_u();
GO 