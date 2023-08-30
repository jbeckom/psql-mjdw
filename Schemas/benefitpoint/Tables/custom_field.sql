CREATE TABLE IF NOT EXISTS benefitpoint.custom_field (
	 custom_section 			TEXT 	NULL 
	,custom_field_id 			int 	NOT NULL  	
	,field_type 				TEXT 	NOT NULL 
	,field_value_type 			TEXT 	NULL 
	,"length" 					int 	NULL 
	,"label" 					TEXT 	NOT NULL 
	,required 					bool 	NULL 
	,active 					bool 	NULL 
	,sort_order 				int 	NOT NULL 
	,phi 						bool 	NULL 
	,sagitta 					bool 	NULL 
	,sagitta_category			TEXT 	NULL 
	,dependent_trigger_id 		int 	NULL 
	,CONSTRAINT custom_field_pkey PRIMARY KEY (custom_field_id)
	,CONSTRAINT custom_section_fkey FOREIGN KEY (custom_section) REFERENCES benefitpoint.custom_section ("label")
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.custom_field OWNER TO mj_admin;
GO 

GRANT INSERT ON benefitpoint.custom_field TO rl_benefitpoint_a;
GO 

GRANT SELECT ON benefitpoint.custom_field TO rl_benefitpoint_r;
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
