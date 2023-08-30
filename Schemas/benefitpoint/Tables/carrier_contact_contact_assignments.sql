CREATE TABLE benefitpoint.carrier_contact_contact_assignments (
	 carrier_id 			int 									NOT NULL 
	,contact_id 			int 									NOT NULL 
	,contact_assignment 	benefitpoint.contact_assignment_type 	NOT NULL 
	,CONSTRAINT carrier_contact_contact_assignments_pkey PRIMARY KEY (carrier_id, contact_id, contact_assignment)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.carrier_contact_contact_assignments OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.carrier_contact_contact_assignments TO rl_benefitpoint_r;
GO 

GRANT INSERT ON TABLE benefitpoint.carrier_contact_contact_assignments TO rl_benefitpoint_a;
GO 

GRANT DELETE ON TABLE benefitpoint.carrier_contact_contact_assignments TO rl_benefitpoint_d;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER prevent_u BEFORE UPDATE ON benefitpoint.carrier_contact_contact_assignments FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_prevent_modify();
GO 
