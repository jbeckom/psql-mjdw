CREATE TABLE sagitta.audit_contacts_category_group (
 	 sagitem 			int 		NOT NULL 
 	,lis 				int 		NOT NULL 
 	,old_category_cd 	TEXT 		NULL 
 	,new_category_cd 	TEXT 		NULL 
 	,old_category_desc 	TEXT 		NULL 
 	,new_category_desc 	TEXT 		NULL 
 	,audit_action 		char(1) 	NOT NULL 
 	,audit_user 		TEXT 		NOT NULL 	DEFAULT current_user 
 	,audit_timestamp 	timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
 	,audit_id 			bigint 		NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_contacts_category_group OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE sagitta.audit_contacts_category_group TO rl_sagitta_a;
GO 
