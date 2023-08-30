DROP TABLE IF EXISTS powerapps.contact;
GO 

CREATE TABLE IF NOT EXISTS powerapps.contact (
	 contact_source 		TEXT 			NOT NULL
	,source_key 			TEXT 			NOT NULL 
	,master_contact 		text 			NOT NULL 
	,first_name 			TEXT 			NULL 
	,last_name 				TEXT 			NULL
	,contact_type 			TEXT 			NULL
	,parent_account_guid 	uuid 			NULL 
	,job_title 				varchar(100) 	NULL 
	,preferred_contact 		bool 			NULL 
	,gender 				TEXT 			NULL 
	,family_status 			TEXT 			NULL 
	,spouse_name 			TEXT 			NULL 
	,dob 					date 			NULL 
	,anniversary 			date 			NULL 
	,allow_email 			bool 			NULL 
	,follow_email 			bool 			NULL 
	,allow_bulk_email 		bool 			NULL 
	,allow_phone 			bool 			NULL 
	,allow_fax 				bool 			NULL 
	,allow_mail 			bool 			NULL 
	,description 			varchar(2000) 	NULL 
	,contact_owner 			TEXT 			NULL 
	,status 				TEXT 			NULL 
	,status_reason 			TEXT 			NULL 
	,guid 					uuid 			NOT NULL 	DEFAULT public.uuid_generate_v4()
	,modify_dt 				timestamp 		NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,is_dirty 				bool 			NOT NULL 	DEFAULT TRUE
	,CONSTRAINT contact_pkey 	PRIMARY KEY (contact_source, source_key)
	,CONSTRAINT contact_guid_uid UNIQUE (guid)
);
GO

/*** PERMISSIONS ***/
ALTER TABLE powerapps.contact OWNER TO mj_admin;
GO

GRANT INSERT ON powerapps.contact TO rl_powerapps_a;
GO

GRANT SELECT ON powerapps.contact TO rl_powerapps_r;
GO

GRANT UPDATE ON powerapps.contact TO rl_powerapps_w;
GO

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON powerapps.contact FOR EACH ROW EXECUTE FUNCTION powerapps.tr_audit_contact_d();
GO

CREATE TRIGGER audit_i AFTER INSERT ON powerapps.contact FOR EACH ROW EXECUTE FUNCTION powerapps.tr_audit_contact_i();
GO

CREATE TRIGGER audit_u AFTER UPDATE ON powerapps.contact FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION powerapps.tr_audit_contact_u();
GO