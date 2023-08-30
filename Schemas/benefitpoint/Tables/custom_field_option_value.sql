CREATE TABLE IF NOT EXISTS benefitpoint.custom_field_option_value (
	 cfov_source 					TEXT 	NOT NULL 
	,source_key 					int 	NOT NULL 
	,custom_field_option_value_id 	int 	NOT NULL 
	,description 					TEXT 	NOT NULL 
	,active 						bool 	NULL 
	,sort_order 					int 	NOT NULL 
	,default_option_value 			bool 	NULL 
	,code 							TEXT 	NULL 
	,CONSTRAINT custom_field_option_value_pkey PRIMARY KEY (cfov_source, source_key, custom_field_option_value_id)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.custom_field_option_value OWNER TO mj_admin;
GO 

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

