CREATE TABLE powerapps.audit_tag_detail(
	 old_tag_name 		TEXT 		NULL 
	,new_tag_name 		TEXT 		NULL 
	,old_tag_type 		TEXT 		NULL 
	,new_tag_type 		TEXT 		NULL 
	,old_tag_owner 		TEXT 		NULL 
	,new_tag_owner 		TEXT 		NULL 
	,old_status 		TEXT 		NULL 
	,new_status 		TEXT 		NULL 
	,old_modify_dt 		timestamp 	NULL 
	,new_modify_dt 		timestamp 	NULL 
	,guid 				uuid 		NOT NULL 
	,old_is_dirty 		bool 		NULL 
	,new_is_dirty 		bool 		NULL 
	,audit_action 		char(1) 	NOT NULL 
	,audit_user 		TEXT 		NOT NULL 	DEFAULT current_user 
	,audit_timestamp 	timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 			bigint 		NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE powerapps.audit_tag_detail OWNER TO mj_admin;
GO 
GRANT SELECT ON TABLE powerapps.audit_tag_detail TO rl_powerapps_r;
GO 
GRANT INSERT ON TABLE powerapps.audit_tag_detail TO rl_powerapps_a;
GO 
GRANT UPDATE ON TABLE powerapps.audit_tag_detail TO rl_powerapps_w;
GO 