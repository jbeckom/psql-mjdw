CREATE TABLE IF NOT EXISTS benefitpoint.custom_section_account_customization_categories (
	 custom_section 				TEXT 	NOT NULL 
	,account_classification_type 	benefitpoint.account_classification_type  	NOT NULL 
	,CONSTRAINT custom_section_account_customization_categories_pkey PRIMARY KEY (custom_section, account_classification_type)
	,CONSTRAINT custom_section_fkey FOREIGN KEY (custom_section) REFERENCES benefitpoint.custom_section ("label") ON DELETE CASCADE  
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.custom_section_account_customization_categories OWNER TO mj_admin;
GO 

GRANT SELECT ON benefitpoint.custom_section_account_customization_categories TO rl_benefitpoint_r;
GO 

GRANT INSERT ON benefitpoint.custom_section_account_customization_categories TO rl_benefitpoint_a;
GO 

GRANT UPDATE ON benefitpoint.custom_section_account_customization_categories TO rl_benefitpoint_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER prevent_u BEFORE UPDATE ON benefitpoint.custom_section_account_customization_categories FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_prevent_modify();
GO 