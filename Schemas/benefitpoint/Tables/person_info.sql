CREATE TABLE benefitpoint.person_info (
	 person_source 		TEXT 							NOT NULL 
	,source_type 		TEXT 							NOT NULL 
	,source_key 		int 							NOT NULL
	,first_name 		varchar(100) 					NOT NULL 
	,middle_name 		varchar(100)					NULL 
	,last_name 			varchar(100) 					NOT NULL 
	,salutation 		benefitpoint.salutation 		NULL 
	,date_of_birth 		date 							NULL 
	,gender 			benefitpoint.gender 			NULL 
	,ssn 				varchar(11) 					NULL 
	,marital_status 	benefitpoint.marital_status 	NULL  
	,CONSTRAINT person_pkey PRIMARY KEY (person_source, source_type, source_key)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.person_info OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.person_info TO rl_benefitpoint_r;
GO 

GRANT INSERT ON TABLE benefitpoint.person_info TO rl_benefitpoint_a;
GO 

GRANT UPDATE ON TABLE benefitpoint.person_info TO rl_benefitpoint_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON benefitpoint.person_info FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_person_info_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON benefitpoint.person_info FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_person_info_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON benefitpoint.person_info FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION benefitpoint.tr_audit_person_info_u();
GO 
