DROP TABLE IF EXISTS powerapps.audit_phone;
GO 

CREATE TABLE powerapps.audit_phone (
	 phone_source 	    TEXT 			NOT NULL 
	,source_type 	    TEXT 			NOT NULL 
	,source_key 	    TEXT 			NOT NULL 
	,source_phone_type 	TEXT 			NOT NULL 
	,old_phone_type 	TEXT 			NULL 
	,new_phone_type 	TEXT 			NULL 
	,old_phone 			varchar(200) 	NULL 
	,new_phone 			varchar(200) 	NULL 
	,old_phone_owner 	TEXT 			NULL 
	,new_phone_owner 	TEXT 			NULL 
	,old_status 		TEXT 			NULL 
	,new_status 		TEXT 			NULL 
	,old_status_reason 	TEXT 			NULL 
	,new_status_reason 	TEXT 			NULL 
	,guid 			    uuid 			NOT NULL
	,audit_action 		char(1) 		NOT NULL 
	,audit_user 		TEXT 			NOT NULL 	DEFAULT current_user
	,audit_timestamp 	timestamp 		NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 			bigint 			NOT NULL 	GENERATED BY DEFAULT AS IDENTITY 	PRIMARY KEY 
);
GO

/*** PERMISSIONS ***/
ALTER TABLE powerapps.audit_phone OWNER TO mj_admin;
GO

GRANT SELECT ON TABLE powerapps.audit_phone TO rl_powerapps_r;
GO

GRANT INSERT ON powerapps.audit_phone TO rl_powerapps_a;
GO