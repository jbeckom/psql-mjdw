CREATE TABLE benefitpoint.account_contact_locations (
	 account_id 	int 	NOT NULL 
	,location_id 	int 	NOT NULL 
	,CONSTRAINT account_contact_fkey FOREIGN KEY (account_id) REFERENCES benefitpoint.account_contact (account_id) ON DELETE CASCADE 
	,CONSTRAINT account_contact_locations_pkey PRIMARY KEY (account_id, location_id)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.account_contact_locations OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.account_contact_locations TO rl_benefitpoint_r;
GO 

GRANT INSERT ON TABLE benefitpoint.account_contact_locations TO rl_benefitpoint_a;
GO 

GRANT DELETE ON TABLE benefitpoint.account_contact_locations TO rl_benefitpoint_d;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER prevent_u BEFORE UPDATE ON benefitpoint.account_contact_locations FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_prevent_modify();
GO 
