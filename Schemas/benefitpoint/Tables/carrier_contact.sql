CREATE TABLE benefitpoint.carrier_contact (
 	 carrier_id 			int 			NOT NULL 
 	,all_contact 			bool 			NULL 
 	,title 					varchar(100) 	NULL 
 	,assistant_first_name 	varchar(100) 	NULL 
 	,assistant_last_name 	varchar(100) 	NULL 
 	,assistant_email 		varchar(100) 	NULL 
 	,market_size 			benefitpoint.market_size 	NULL 
 	,notes 					varchar(500) 	NULL 
 	,last_modified_on 		timestamptz 	NULL 
 	,CONSTRAINT carrier_contact_pkey PRIMARY KEY (carrier_id)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.carrier_contact OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.carrier_contact TO rl_benefitpoint_r;
GO 

GRANT INSERT ON TABLE benefitpoint.carrier_contact TO rl_benefitpoint_a;
GO 

GRANT UPDATE ON TABLE benefitpoint.carrier_contact TO rl_benefitpoint_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON benefitpoint.carrier_contact FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_carrier_contact_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON benefitpoint.carrier_contact FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_carrier_contact_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON benefitpoint.carrier_contact FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION benefitpoint.tr_audit_carrier_contact_u();
GO 
