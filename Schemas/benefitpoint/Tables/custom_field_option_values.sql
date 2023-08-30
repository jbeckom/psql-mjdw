CREATE TABLE IF NOT EXISTS benefitpoint.custom_field_option_values (
	 custom_field_id 				int 	NOT NULL 
	,custom_field_option_value_id 	int 	NOT NULL 
	,CONSTRAINT custom_field_option_values_pkey PRIMARY KEY (custom_field_id, custom_field_option_value_id)
	,CONSTRAINT custom_field_fkey FOREIGN KEY (custom_field_id) REFERENCES benefitpoint.custom_field (custom_field_id) ON DELETE CASCADE 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.custom_field_option_values OWNER TO mj_admin;
GO 

GRANT SELECT ON benefitpoint.custom_field_option_values TO rl_benefitpoint_r;
GO 

GRANT INSERT ON benefitpoint.custom_field_option_values TO rl_benefitpoint_a;
GO 

GRANT UPDATE ON benefitpoint.custom_field_option_values TO rl_benefitpoint_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER prevent_u BEFORE UPDATE ON benefitpoint.custom_field_option_values FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_prevent_modify();
GO 