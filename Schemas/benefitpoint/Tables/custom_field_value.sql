CREATE TABLE benefitpoint.custom_field_value (
	 custom_field_value_id 	int 	NULL 
	,custom_field_id 		int 	NOT NULL 
	,option_value_id 		int 	NULL 
	,value_text 			TEXT 	NULL 
	,cfv_source 			TEXT 	NOT NULL 
	,source_key 			int 	NOT NULL 
	,CONSTRAINT custom_field_value_pkey PRIMARY KEY (cfv_source, source_key, custom_field_id)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.custom_field_value OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.custom_field_value TO rl_benefitpoint_r;
GO 

GRANT INSERT ON TABLE benefitpoint.custom_field_value TO rl_benefitpoint_a;
GO 

GRANT UPDATE ON TABLE benefitpoint.custom_field_value TO rl_benefitpoint_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON benefitpoint.custom_field_value FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_custom_field_value_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON benefitpoint.custom_field_value FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_custom_field_value_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON benefitpoint.custom_field_value FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION benefitpoint.tr_audit_custom_field_value_u();
GO 
