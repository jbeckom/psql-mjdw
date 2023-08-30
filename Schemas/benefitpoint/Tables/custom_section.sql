CREATE TABLE IF NOT EXISTS benefitpoint.custom_section (
	 customization_area 					benefitpoint.customization_area 	NOT NULL 
	,"label" 								TEXT 	NOT NULL 
	,sort_order 							int 	NOT NULL 
	,active 								bool 	NULL 
	,CONSTRAINT custom_section_pkey PRIMARY KEY ("label")
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.custom_section OWNER TO mj_admin;
GO 

GRANT SELECT ON benefitpoint.custom_section TO rl_benefitpoint_r;
GO 

GRANT INSERT ON benefitpoint.custom_section TO rl_benefitpoint_a;
GO 

GRANT UPDATE ON benefitpoint.custom_section TO rl_benefitpoint_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d BEFORE DELETE ON benefitpoint.custom_section FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_custom_section_d();
GO 

CREATE TRIGGER audit_i BEFORE INSERT ON benefitpoint.custom_section FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_custom_section_i();
GO 

CREATE TRIGGER audit_u BEFORE UPDATE ON benefitpoint.custom_section FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION benefitpoint.tr_audit_custom_section_u();
GO 
