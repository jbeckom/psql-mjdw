/***************************/
/*** DROP FK CONSTRAINTS ***/
/***************************/
ALTER TABLE powerapps.account_address
	DROP CONSTRAINT account_address_account_guid_fkey;
GO 

ALTER TABLE powerapps.account_email 
	DROP CONSTRAINT account_email_account_guid_fkey;
GO 

ALTER TABLE powerapps.account_fax 
	DROP CONSTRAINT account_fax_account_guid_fkey;
GO 

ALTER TABLE powerapps.account_phone 
	DROP CONSTRAINT account_phone_account_guid_fkey;
GO 

ALTER TABLE powerapps.account_social_media 
	DROP CONSTRAINT account_fkey;
GO 

ALTER TABLE powerapps.account_tags 
	DROP CONSTRAINT account_fkey;
GO 

/******************/
/*** BASE TABLE ***/
/******************/
DROP TABLE IF EXISTS powerapps.account;
GO 

CREATE TABLE powerapps.account (
	 account_source 						varchar(50) 	NOT NULL 
	,source_key 							varchar(50) 	NOT NULL 
	,account_name 							varchar(200)	NULL 
	,client_code 							varchar(20) 	NULL 
	,client_category 						TEXT 			NULL 
	,pc_client_category 					TEXT 			NULL 
	,medical_funding_type 					TEXT 			NULL 
	,enrolled_employees 					int 			NULL 
	,bor_dt 								date 			NULL 
	,erisa_info								TEXT 			NULL 
	,stop_loss_renew_dt 					date 			NULL 
	,benefit_plan_change_effective_date 	date 			NULL 
	,industry 								TEXT 			NULL 
	,dba 									varchar(350) 	NULL 
	,eb_primary_sic 						TEXT 			NULL 
	,pc_primary_sic 						text			NULL 
	,pc_second_sic 							text		 	NULL 
	,pc_tertiary_sic 						text	 		NULL 
	,other_subsidiaries 					varchar(500) 	NULL 
	,pc_client_profile 						bool 			NULL 
	,eb_client_profile 						bool 			NULL 
	,eb_account_classification 				TEXT 			NULL 
	,client_rev_25k 						bool 			NULL 
	,revenue_range 							TEXT 			NULL 
	,ein 									TEXT 			NULL 
	,naics_description 						TEXT 			NULL 
	,web_url 								varchar(2048) 	NULL 
	,parent_account 						TEXT 			NULL 
	,primary_contact 						TEXT 			NULL 
	,account_owner 							TEXT 			NULL 
	,status_code 							TEXT 			NULL 
	,status_reason 							TEXT 			NULL 
	,guid									uuid 			NOT NULL 	DEFAULT public.uuid_generate_v4()
	,modify_dt 								timestamp 		NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,is_dirty 								bool 			NOT NULL 	DEFAULT TRUE 
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

/*******************/
/*** AUDIT TABLE ***/
/*******************/
DROP TABLE IF EXISTS powerapps.audit_account;
GO 

CREATE TABLE powerapps.audit_account (
     account_source 			    			varchar(50) 	NOT NULL 
	,source_key 				    			varchar(50) 	NOT NULL 
	,old_account_name 							varchar(200)	NULL 
    ,new_account_name 							varchar(200)	NULL 
	,old_client_code 							varchar(20) 	NULL 
    ,new_client_code 							varchar(20) 	NULL 
	,old_client_category 						TEXT 			NULL 
    ,new_client_category 						TEXT 			NULL 
	,old_pc_client_category 					TEXT 			NULL 
    ,new_pc_client_category 					TEXT 			NULL 
	,old_medical_funding_type 					TEXT 			NULL 
    ,new_medical_funding_type 					TEXT 			NULL 
	,old_enrolled_employees 					int 			NULL 
    ,new_enrolled_employees 					int 			NULL 
	,old_bor_dt 								date 			NULL 
    ,new_bor_dt 								date 			NULL 
	,old_erisa_info								TEXT 			NULL 
    ,new_erisa_info								TEXT 			NULL 
	,old_stop_loss_renew_dt 					date 			NULL 
    ,new_stop_loss_renew_dt 					date 			NULL 
    ,old_benefit_plan_change_effective_date 	date 	NULL 
    ,new_benefit_plan_change_effective_date 	date 	NULL 
	,old_industry 								TEXT 			NULL 
    ,new_industry 								TEXT 			NULL 
	,old_dba 									varchar(350) 	NULL 
    ,new_dba 									varchar(350) 	NULL 
	,old_eb_primary_sic 						TEXT 			NULL 
    ,new_eb_primary_sic 						TEXT 			NULL 
	,old_pc_primary_sic 						text			NULL 
    ,new_pc_primary_sic 						text			NULL 
	,old_pc_second_sic 							text		 	NULL 
    ,new_pc_second_sic 							text		 	NULL 
	,old_pc_tertiary_sic 						text		 	NULL 
    ,new_pc_tertiary_sic 						text		 	NULL 
	,old_other_subsidiaries 					varchar(500) 	NULL 
    ,new_other_subsidiaries 					varchar(500) 	NULL 
	,old_pc_client_profile 						bool 			NULL 
    ,new_pc_client_profile 						bool 			NULL 
	,old_eb_client_profile 						bool 			NULL 
    ,new_eb_client_profile 						bool 			NULL 
	,old_eb_account_classification 				TEXT 			NULL 
    ,new_eb_account_classification 				TEXT 			NULL 
	,old_client_rev_25k 						bool 			NULL 
    ,new_client_rev_25k 						bool 			NULL 
	,old_revenue_range 							TEXT 			NULL 
    ,new_revenue_range 							TEXT 			NULL 
	,old_ein 									TEXT 			NULL 
    ,new_ein 									TEXT 			NULL 
	,old_naics_description 						TEXT 			NULL 
    ,new_naics_description 						TEXT 			NULL 
	,old_web_url 								varchar(2048) 	NULL 
    ,new_web_url 								varchar(2048) 	NULL 
	,old_parent_account 						TEXT 			NULL 
    ,new_parent_account 						TEXT 			NULL 
	,old_primary_contact 						TEXT 			NULL 
    ,new_primary_contact 						TEXT 			NULL 
	,old_account_owner 							TEXT 			NULL 
    ,new_account_owner 							TEXT 			NULL 
	,old_status_code 							TEXT 			NULL 
    ,new_status_code 							TEXT 			NULL 
	,old_status_reason 							TEXT 			NULL
    ,new_status_reason 							TEXT 			NULL
    ,guid 										uuid 			NOT NULL 
    ,audit_action 								char(1) 		NOT NULL 
    ,audit_user 								TEXT 			NOT NULL 	DEFAULT current_user
    ,audit_timestamp 							timestamp 		NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
    ,audit_id 									bigint 			NOT NULL 	GENERATED BY DEFAULT AS IDENTITY 	PRIMARY KEY 
);
GO

/*** PERMISSIONS ***/
ALTER TABLE powerapps.audit_account OWNER TO mj_admin;
GO

GRANT SELECT ON TABLE powerapps.audit_account TO rl_powerapps_r;
GO

GRANT INSERT ON powerapps.audit_account TO rl_powerapps_a;
GO

/*************************/
/*** TRIGGER FUNCTIONS ***/
/*************************/
CREATE OR REPLACE FUNCTION powerapps.tr_audit_account_d ()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO powerapps.audit_account (
		 account_source 
		,source_key 
		,old_account_name 
		,old_client_code 
		,old_client_category 
		,old_pc_client_category
		,old_medical_funding_type
		,old_enrolled_employees
		,old_bor_dt
		,old_erisa_info
		,old_stop_loss_renew_dt
		,old_benefit_plan_change_effective_date
		,old_industry
		,old_dba
		,old_eb_primary_sic
		,old_pc_primary_sic
		,old_pc_second_sic
		,old_pc_tertiary_sic
		,old_other_subsidiaries
		,old_pc_client_profile
		,old_eb_client_profile
		,old_eb_account_classification
		,old_client_rev_25k
		,old_revenue_range
		,old_ein
		,old_naics_description
		,old_web_url
		,old_parent_account
		,old_primary_contact
		,old_account_owner
		,old_status_code
		,old_status_reason
		,guid
		,audit_action
	)
	SELECT 	 OLD.account_source 
			,OLD.source_key 
			,OLD.account_name 
			,OLD.client_code 
			,OLD.client_category 
			,OLD.pc_client_category
			,OLD.medical_funding_type
			,OLD.enrolled_employees
			,OLD.bor_dt
			,OLD.erisa_info
			,OLD.stop_loss_renew_dt
			,OLD.benefit_plan_change_effective_date
			,OLD.industry
			,OLD.dba
			,OLD.eb_primary_sic
			,OLD.pc_primary_sic
			,OLD.pc_second_sic
			,OLD.pc_tertiary_sic
			,OLD.other_subsidiaries
			,OLD.pc_client_profile
			,OLD.eb_client_profile
			,OLD.eb_account_classification
			,OLD.client_rev_25k
			,OLD.revenue_range
			,OLD.ein
			,OLD.naics_description
			,OLD.web_url
			,OLD.parent_account
			,OLD.primary_contact
			,OLD.account_owner
			,OLD.status_code
			,OLD.status_reason
			,OLD.guid
			,'D';
	RETURN OLD;
END;
$$;
GO


CREATE OR REPLACE FUNCTION powerapps.tr_audit_account_i ()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO powerapps.audit_account (
		 account_source 
		,source_key 
		,new_account_name 
		,new_client_code 
		,new_client_category 
		,new_pc_client_category
		,new_medical_funding_type
		,new_enrolled_employees
		,new_bor_dt
		,new_erisa_info
		,new_stop_loss_renew_dt
		,new_benefit_plan_change_effective_date 
		,new_industry
		,new_dba
		,new_eb_primary_sic
		,new_pc_primary_sic
		,new_pc_second_sic
		,new_pc_tertiary_sic
		,new_other_subsidiaries
		,new_pc_client_profile
		,new_eb_client_profile
		,new_eb_account_classification
		,new_client_rev_25k
		,new_revenue_range
		,new_ein
		,new_naics_description
		,new_web_url
		,new_parent_account
		,new_primary_contact
		,new_account_owner
		,new_status_code
		,new_status_reason
		,guid
		,audit_action
	)
	SELECT 	 NEW.account_source 
			,NEW.source_key 
			,NEW.account_name 
			,NEW.client_code 
			,NEW.client_category 
			,NEW.pc_client_category
			,NEW.medical_funding_type
			,NEW.enrolled_employees
			,NEW.bor_dt
			,NEW.erisa_info
			,NEW.stop_loss_renew_dt 
			,NEW.benefit_plan_change_effective_date 
			,NEW.industry
			,NEW.dba
			,NEW.eb_primary_sic
			,NEW.pc_primary_sic
			,NEW.pc_second_sic
			,NEW.pc_tertiary_sic
			,NEW.other_subsidiaries
			,NEW.pc_client_profile
			,NEW.eb_client_profile
			,NEW.eb_account_classification
			,NEW.client_rev_25k
			,NEW.revenue_range
			,NEW.ein
			,NEW.naics_description
			,NEW.web_url
			,NEW.parent_account
			,NEW.primary_contact
			,NEW.account_owner
			,NEW.status_code
			,NEW.status_reason
			,NEW.guid
			,'I';
	RETURN NEW;
END;
$$;
GO


CREATE OR REPLACE FUNCTION powerapps.tr_audit_account_u ()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO powerapps.audit_account (
		 account_source
		,source_key
		,old_account_name
		,new_account_name
		,old_client_code
		,new_client_code
		,old_client_category
		,new_client_category
		,old_pc_client_category
		,new_pc_client_category
		,old_medical_funding_type
		,new_medical_funding_type
		,old_enrolled_employees
		,new_enrolled_employees
		,old_bor_dt
		,new_bor_dt
		,old_erisa_info
		,new_erisa_info
		,old_stop_loss_renew_dt
		,new_stop_loss_renew_dt 
		,old_benefit_plan_change_effective_date 
		,new_benefit_plan_change_effective_date 
		,old_industry
		,new_industry
		,old_dba
		,new_dba
		,old_eb_primary_sic
		,new_eb_primary_sic
		,old_pc_primary_sic
		,new_pc_primary_sic
		,old_pc_second_sic
		,new_pc_second_sic
		,old_pc_tertiary_sic
		,new_pc_tertiary_sic
		,old_other_subsidiaries
		,new_other_subsidiaries
		,old_pc_client_profile
		,new_pc_client_profile
		,old_eb_client_profile
		,new_eb_client_profile
		,old_eb_account_classification
		,new_eb_account_classification
		,old_client_rev_25k
		,new_client_rev_25k
		,old_revenue_range
		,new_revenue_range
		,old_ein
		,new_ein
		,old_naics_description
		,new_naics_description
		,old_web_url
		,new_web_url
		,old_parent_account
		,new_parent_account
		,old_primary_contact
		,new_primary_contact
		,old_account_owner
		,new_account_owner
		,old_status_code
		,new_status_code
		,old_status_reason
		,new_status_reason
		,guid
		,audit_action
	)
	SELECT 	 OLD.account_source
			,OLD.source_key
			,OLD.account_name
			,NEW.account_name
			,OLD.client_code
			,NEW.client_code
			,OLD.client_category
			,NEW.client_category
			,OLD.pc_client_category
			,NEW.pc_client_category
			,OLD.medical_funding_type
			,NEW.medical_funding_type
			,OLD.enrolled_employees
			,NEW.enrolled_employees
			,OLD.bor_dt
			,NEW.bor_dt
			,OLD.erisa_info
			,NEW.erisa_info
			,OLD.stop_loss_renew_dt
			,NEW.stop_loss_renew_dt 
			,OLD.benefit_plan_change_effective_date 
			,NEW.benefit_plan_change_effective_date 
			,OLD.industry
			,NEW.industry
			,OLD.dba
			,NEW.dba
			,OLD.eb_primary_sic
			,NEW.eb_primary_sic
			,OLD.pc_primary_sic
			,NEW.pc_primary_sic
			,OLD.pc_second_sic
			,NEW.pc_second_sic
			,OLD.pc_tertiary_sic
			,NEW.pc_tertiary_sic
			,OLD.other_subsidiaries
			,NEW.other_subsidiaries
			,OLD.pc_client_profile
			,NEW.pc_client_profile
			,OLD.eb_client_profile
			,NEW.eb_client_profile
			,OLD.eb_account_classification
			,NEW.eb_account_classification
			,OLD.client_rev_25k
			,NEW.client_rev_25k
			,OLD.revenue_range
			,NEW.revenue_range
			,OLD.ein
			,NEW.ein
			,OLD.naics_description
			,NEW.naics_description
			,OLD.web_url
			,NEW.web_url
			,OLD.parent_account
			,NEW.parent_account
			,OLD.primary_contact
			,NEW.primary_contact
			,OLD.account_owner
			,NEW.account_owner
			,OLD.status_code
			,NEW.status_code
			,OLD.status_reason
			,NEW.status_reason
			,OLD.guid
			,'U';
	RETURN OLD;
END;
$$;
GO
