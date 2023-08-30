CREATE TABLE sagitta.audit_contacts_website_group (
	 sagitem             int         NOT NULL 
	,lis                 int         NOT NULL 
	,old_type            TEXT        NULL 
	,new_type            TEXT        NULL 
	,old_website         TEXT        NULL 
	,new_website         TEXT        NULL 
	,old_primary         TEXT        NULL 
	,new_primary         TEXT        NULL 
	,old_preferred       TEXT        NULL 
	,new_preferred       TEXT        NULL 
	,audit_action        char(1)     NOT NULL 
	,audit_user          text        NOT NULL 	DEFAULT CURRENT_USER
	,audit_timestamp     timestamp   NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id            bigint      NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_contacts_website_group OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE sagitta.audit_contacts_website_group TO rl_sagitta_a;
GO 
