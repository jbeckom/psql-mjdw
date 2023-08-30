CREATE TABLE powerapps.audit_account_social_media(
	 old_account_guid 					uuid 		NULL 
    ,new_account_guid 					uuid 		NULL 
	,old_social_media_guid 				uuid 		NULL 
    ,new_social_media_guid 				uuid 		NULL 
	,old_account_social_media_owner 	TEXT 		NULL 
    ,new_account_social_media_owner 	TEXT 		NULL 
	,old_status 						TEXT 		NULL 
    ,new_status 						TEXT 		NULL 
	,old_status_reason 					TEXT 		NULL 
    ,new_status_reason 					TEXT 		NULL 
	,guid 							    uuid 		NOT NULL 
	,old_modify_dt 						timestamp 	NULL 
    ,new_modify_dt 						timestamp 	NULL 
	,old_is_dirty 						bool 		NULL 
    ,new_is_dirty 						bool 		NULL 
    ,audit_action 						char(1) 	NOT NULL 
    ,audit_user 						TEXT 		NOT NULL 	DEFAULT current_user
    ,audit_timestamp 					timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
    ,audit_id 							bigint 		NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE powerapps.audit_account_social_media OWNER TO mj_admin;
GO 
GRANT SELECT ON TABLE powerapps.audit_account_social_media TO rl_powerapps_r;
GO 
GRANT INSERT ON TABLE powerapps.audit_account_social_media TO rl_powerapps_a;
GO 