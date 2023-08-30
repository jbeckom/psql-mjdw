CREATE TABLE powerapps.audit_social_media (
	 old_social_media_source 	TEXT 			NULL 
	,new_social_media_source 	TEXT 			NULL 
	,old_source_key 			TEXT 			NULL 
	,new_source_key 			TEXT 			NULL 
	,old_social_media_type 		TEXT 			NULL  
	,new_social_media_type 		TEXT 			NULL  
	,old_url 					varchar(8000) 	NULL 
	,new_url 					varchar(8000) 	NULL 
	,old_modify_dt 				timestamp 		NULL 
	,new_modify_dt 				timestamp 		NULL 
	,old_is_dirty 				bool 			NULL 
	,new_is_dirty 				bool 			NULL 
	,guid 					    uuid 			NOT NULL 
	,audit_action 				char(1) 		NOT NULL 
	,audit_user 				TEXT 			NOT NULL 	DEFAULT current_user
	,audit_timestamp 			timestamp 		NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 					bigint 			NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE powerapps.audit_social_media OWNER TO mj_admin;
GO 
GRANT SELECT ON TABLE powerapps.audit_social_media TO rl_powerapps_r;
GO 
GRANT INSERT ON TABLE powerapps.audit_social_media TO rl_powerapps_a;
GO 