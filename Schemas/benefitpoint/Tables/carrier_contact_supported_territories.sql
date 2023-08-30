CREATE TABLE benefitpoint.carrier_contact_supported_territories (
	 carrier_id 		int 		NOT NULL 
	,contact_id 		int 		NOT NULL 
	,supported_territory 	benefitpoint.state 	NOT NULL 
	,CONSTRAINT carrier_contact_supported_territories_pkey PRIMARY KEY (carrier_id, contact_id, supported_territory)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.carrier_contact_supported_territories OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.carrier_contact_supported_territories TO rl_benefitpoint_r;
GO 

GRANT INSERT ON TABLE benefitpoint.carrier_contact_supported_territories TO rl_benefitpoint_a;
GO 

GRANT DELETE ON TABLE benefitpoint.carrier_contact_supported_territories TO rl_benefitpoint_d;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER prevent_u BEFORE UPDATE ON benefitpoint.carrier_contact_supported_territories FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_prevent_modify();
GO 