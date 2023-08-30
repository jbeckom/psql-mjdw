CREATE TABLE IF NOT EXISTS powerapps.account (
	 account_source 			varchar(50) 	NOT NULL 
	,source_key 				varchar(50) 	NOT NULL 
	,account_name 				varchar(200)	NULL 
	,client_code 				varchar(20) 	NULL 
	,client_category 			TEXT 			NULL 
	,pc_client_category 		TEXT 			NULL 
	,medical_funding_type 		TEXT 			NULL 
	,enrolled_employees 		int 			NULL 
	,bor_dt 					date 			NULL 
	,erisa_info					TEXT 			NULL 
	,stop_loss_renew_dt 		date 			NULL 
	,industry 					TEXT 			NULL 
	,dba 						varchar(350) 	NULL 
	,eb_primary_sic 			TEXT 			NULL 
	,pc_primary_sic 			text			NULL 
	,pc_second_sic 				text		 	NULL 
	,pc_tertiary_sic 			text	 		NULL 
	,other_subsidiaries 		varchar(500) 	NULL 
	,pc_client_profile 			bool 			NULL 
	,eb_client_profile 			bool 			NULL 
	,eb_account_classification 	TEXT 			NULL 
	,client_rev_25k 			bool 			NULL 
	,revenue_range 				TEXT 			NULL 
	,ein 						TEXT 			NULL 
	,naics_description 			TEXT 			NULL 
	,web_url 					varchar(2048) 	NULL 
	,parent_account 			TEXT 			NULL 
	,primary_contact 			TEXT 			NULL 
	,account_owner 				TEXT 			NULL 
	,status_code 				TEXT 			NULL 
	,status_reason 				TEXT 			NULL 
	,guid						uuid 			NOT NULL 	DEFAULT public.uuid_generate_v4()
	,modify_dt 					timestamp 		NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,is_dirty 					bool 			NOT NULL 	DEFAULT TRUE 
	,CONSTRAINT account_pkey PRIMARY KEY (account_source, source_key)
	,CONSTRAINT account_guid_uid UNIQUE (guid)
);
GO

/*** PERMISSIONS ***/
ALTER TABLE powerapps.account OWNER TO mj_admin;
GO

GRANT INSERT ON powerapps.account TO rl_powerapps_a;
GO

GRANT SELECT ON powerapps.account TO rl_powerapps_r;
GO

GRANT UPDATE ON powerapps.account TO rl_powerapps_w;
GO

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON powerapps.account FOR EACH ROW EXECUTE FUNCTION powerapps.tr_audit_account_d();
GO

CREATE TRIGGER audit_i AFTER INSERT ON powerapps.account FOR EACH ROW EXECUTE FUNCTION powerapps.tr_audit_account_i();
GO

CREATE TRIGGER audit_u AFTER UPDATE ON powerapps.account FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION powerapps.tr_audit_account_u();
GO