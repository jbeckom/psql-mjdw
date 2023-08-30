/********************/
/*** DEPENDENCIES ***/
/********************/
ALTER TABLE IF EXISTS benefitpoint.aca_measurement_period DROP CONSTRAINT account_fkey;
GO 

ALTER TABLE IF EXISTS benefitpoint.account_class DROP CONSTRAINT account_fkey;
GO 

ALTER TABLE IF EXISTS benefitpoint.account_division DROP CONSTRAINT account_fkey;
GO 

ALTER TABLE IF EXISTS benefitpoint.account_integration_info DROP CONSTRAINT account_fkey;
GO 

ALTER TABLE IF EXISTS benefitpoint.account_location DROP CONSTRAINT account_fkey;
GO 

ALTER TABLE IF EXISTS benefitpoint.ams360_account_business_type DROP CONSTRAINT account_fkey;
GO 

ALTER TABLE IF EXISTS benefitpoint.brokerage_account_info DROP CONSTRAINT account_fkey;
GO 

ALTER TABLE IF EXISTS benefitpoint.common_group_account_info DROP CONSTRAINT account_fkey;
GO 

ALTER TABLE IF EXISTS benefitpoint.dependent DROP CONSTRAINT account_fkey;
GO 

ALTER TABLE IF EXISTS benefitpoint.employee_type DROP CONSTRAINT account_key;
GO 

ALTER TABLE IF EXISTS benefitpoint.group_account_info DROP CONSTRAINT account_fkey;
GO 

ALTER TABLE IF EXISTS benefitpoint.individual_account_info DROP CONSTRAINT account_fkey;
GO 

ALTER TABLE IF EXISTS benefitpoint.tam_customer DROP CONSTRAINT account_fkey;
GO 

ALTER TABLE IF EXISTS benefitpoint.license DROP CONSTRAINT account_fkey;
GO 

ALTER TABLE IF EXISTS benefitpoint.carrier_appointment DROP CONSTRAINT account_fkey;
GO 

ALTER TABLE IF EXISTS benefitpoint.agent_account_info DROP CONSTRAINT account_fkey;
GO 

ALTER TABLE IF EXISTS benefitpoint.agent_account_associated_accounts DROP CONSTRAINT account_fkey;
GO 

ALTER TABLE IF EXISTS benefitpoint.agent_info DROP CONSTRAINT account_fkey;
GO 

ALTER TABLE IF EXISTS benefitpoint.agency_account_info DROP CONSTRAINT account_fkey;
GO 

ALTER TABLE IF EXISTS benefitpoint.agency_info DROP CONSTRAINT account_fkey;
GO 

ALTER TABLE IF EXISTS benefitpoint.agency_account_associated_agent_accounts DROP CONSTRAINT account_fkey;
GO 

ALTER TABLE IF EXISTS benefitpoint.agency_account_associated_accounts  DROP CONSTRAINT agency_account_fkey;
GO 

ALTER TABLE IF EXISTS benefitpoint.account_team_member DROP CONSTRAINT account_fkey;
GO 

ALTER TABLE IF EXISTS benefitpoint.marketing_group_account_info DROP CONSTRAINT account_fkey;
GO 

ALTER TABLE IF EXISTS benefitpoint.marketing_group_account_associated_accounts DROP CONSTRAINT marketing_group_account_fkey;
GO 

DROP VIEW IF EXISTS benefitpoint.vw_account_ids;
GO 

/**************/
/*** TABLES ***/
/**************/
DROP TABLE IF EXISTS benefitpoint.account;

CREATE TABLE benefitpoint.account (
	 account_id 									int 				NOT NULL
	,active 										bool 				NOT NULL 	DEFAULT TRUE 
	,inactive_as_of 								timestamptz			NULL 
	,inactive_reason								benefitpoint.inactive_reason 				NULL 
	,account_classification 						benefitpoint.account_classification_type 	NOT NULL 
	,account_type 									benefitpoint.account_type 					NOT NULL 
	,office_id 										int 				NOT NULL 
	,department_id 									int 				NULL 
	,administrator_user_id 							int 				NOT NULL 
	,primary_contact_user_id 						int 				NOT NULL 
	,primary_sales_lead_user_id 					int 				NULL 
	,primary_service_lead_user_id 					int 				NULL 
	,notes 											varchar(1000) 		NULL 
	,last_reviewed_by_user_id 						int 				NULL 
	,last_reviewed_on 								timestamptz			NULL 
	,created_on 									timestamptz			NULL 
	,last_modified_on 								timestamptz			NULL 
	,agency_account_id 								TEXT 				NULL 
	,excluded_purge 								bool 				NULL 
	,CONSTRAINT account_pkey PRIMARY KEY (account_id) 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.account OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.account TO rl_benefitpoint_r; 
GO 

GRANT INSERT ON TABLE benefitpoint.account TO rl_benefitpoint_a;
GO 

GRANT UPDATE ON TABLE benefitpoint.account TO rl_benefitpoint_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON benefitpoint.account FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_account_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON benefitpoint.account FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_account_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON benefitpoint.account FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION benefitpoint.tr_audit_account_u();
GO 

/*************/
/*** AUDIT ***/
/*************/
DROP TABLE IF EXISTS benefitpoint.audit_account;
GO 

CREATE TABLE benefitpoint.audit_account (
	 account_id 		                int 		NOT NULL 
	,old_active 						bool 			NULL 
	,new_active 						bool 			NULL 
	,old_inactive_as_of 				timestamp 		NULL 
	,new_inactive_as_of 				timestamp 		NULL 
	,old_inactive_reason				TEXT 			NULL 
	,new_inactive_reason				TEXT 			NULL 
	,old_account_classification 		TEXT 			NULL 
	,new_account_classification 		TEXT 			NULL 
	,old_account_type 					TEXT 			NULL 
	,new_account_type 					TEXT 			NULL 
	,old_office_id 						int 			NULL 
	,new_office_id 						int 			NULL 
	,old_department_id 					int 			NULL 
	,new_department_id 					int 			NULL 
	,old_administrator_user_id 			int 			NULL 
	,new_administrator_user_id 			int 			NULL 
	,old_primary_contact_user_id 		int 			NULL 
	,new_primary_contact_user_id 		int 			NULL 
	,old_primary_sales_lead_user_id 	int 			NULL 
	,new_primary_sales_lead_user_id 	int 			NULL 
	,old_primary_service_lead_user_id 	int 			NULL 
	,new_primary_service_lead_user_id 	int 			NULL 
	,old_notes 							varchar(1000)   NULL 
	,new_notes 							varchar(1000) 	NULL 
	,old_last_reviewed_by_user_id 		int 			NULL 
	,new_last_reviewed_by_user_id 		int 			NULL 
	,old_last_reviewed_on 				timestamp 		NULL 
	,new_last_reviewed_on 				timestamp 		NULL 
	,old_created_on 					timestamp 		NULL 
	,new_created_on 					timestamp 		NULL 
	,old_last_modified_on 				timestamp 		NULL 
	,new_last_modified_on 				timestamp 		NULL 
	,old_agency_account_id 				TEXT 			NULL 
	,new_agency_account_id 				TEXT 			NULL 
	,old_excluded_purge 				bool 			NULL 
	,new_excluded_purge 				bool 			NULL 
	,audit_action 						char(1) 		NOT NULL 
	,audit_user 						TEXT 			NOT NULL 	DEFAULT current_user 
	,audit_timestamp 					timestamp 		NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 							bigint 			NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.audit_account OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE benefitpoint.audit_account TO rl_benefitpoint_a;
GO 


/**************************/
/*** FUNCTIONS/TRIGGERS ***/
/**************************/
CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_account_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_account (
		 account_id
		,old_active
		,old_inactive_as_of
		,old_inactive_reason
		,old_account_classification
		,old_account_type
		,old_office_id
		,old_department_id
		,old_administrator_user_id
		,old_primary_contact_user_id
		,old_primary_sales_lead_user_id
		,old_primary_service_lead_user_id
		,old_notes
		,old_last_reviewed_by_user_id
		,old_last_reviewed_on
		,old_created_on
		,old_last_modified_on
		,old_agency_account_id
		,old_excluded_purge
		,audit_action 
	)
	SELECT 	 OLD.account_id
			,OLD.active
			,OLD.inactive_as_of
			,OLD.inactive_reason
			,OLD.account_classification
			,OLD.account_type
			,OLD.office_id
			,OLD.department_id
			,OLD.administrator_user_id
			,OLD.primary_contact_user_id
			,OLD.primary_sales_lead_user_id
			,OLD.primary_service_lead_user_id
			,OLD.notes
			,OLD.last_reviewed_by_user_id
			,OLD.last_reviewed_on
			,OLD.created_on
			,OLD.last_modified_on 
			,OLD.agency_account_id 
			,OLD.excluded_purge
			,'D';
	RETURN OLD;
END;
$$;
GO 

CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_account_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_account (
		 account_id
		,new_active
		,new_inactive_as_of
		,new_inactive_reason
		,new_account_classification
		,new_account_type
		,new_office_id
		,new_department_id
		,new_administrator_user_id
		,new_primary_contact_user_id
		,new_primary_sales_lead_user_id
		,new_primary_service_lead_user_id
		,new_notes
		,new_last_reviewed_by_user_id
		,new_last_reviewed_on
		,new_created_on
		,new_last_modified_on 
		,new_agency_account_id 
		,new_excluded_purge
		,audit_action 
	)
	SELECT 	 NEW.account_id
			,NEW.active
			,NEW.inactive_as_of
			,NEW.inactive_reason
			,NEW.account_classification
			,NEW.account_type
			,NEW.office_id
			,NEW.department_id
			,NEW.administrator_user_id
			,NEW.primary_contact_user_id
			,NEW.primary_sales_lead_user_id
			,NEW.primary_service_lead_user_id
			,NEW.notes
			,NEW.last_reviewed_by_user_id
			,NEW.last_reviewed_on
			,NEW.created_on
			,NEW.last_modified_on 
			,NEW.agency_account_id 
			,NEW.excluded_purge
			,'I';
	RETURN NEW;
END;
$$;
GO 

CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_account_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_account (
		 account_id
		,old_active
		,new_active
		,old_inactive_as_of
		,new_inactive_as_of
		,old_inactive_reason
		,new_inactive_reason
		,old_account_classification
		,new_account_classification
		,old_account_type
		,new_account_type
		,old_office_id
		,new_office_id
		,old_department_id
		,new_department_id
		,old_administrator_user_id
		,new_administrator_user_id
		,old_primary_contact_user_id
		,new_primary_contact_user_id
		,old_primary_sales_lead_user_id
		,new_primary_sales_lead_user_id
		,old_primary_service_lead_user_id
		,new_primary_service_lead_user_id
		,old_notes
		,new_notes
		,old_last_reviewed_by_user_id
		,new_last_reviewed_by_user_id
		,old_last_reviewed_on
		,new_last_reviewed_on
		,old_created_on
		,new_created_on
		,old_last_modified_on 
		,new_last_modified_on 
		,old_agency_account_id 
		,new_agency_account_id 
		,old_excluded_purge
		,new_excluded_purge
		,audit_action
	)
	SELECT 	 OLD.account_id
			,OLD.active
			,NEW.active
			,OLD.inactive_as_of
			,NEW.inactive_as_of
			,OLD.inactive_reason
			,NEW.inactive_reason
			,OLD.account_classification
			,NEW.account_classification
			,OLD.account_type
			,NEW.account_type
			,OLD.office_id
			,NEW.office_id
			,OLD.department_id
			,NEW.department_id
			,OLD.administrator_user_id
			,NEW.administrator_user_id
			,OLD.primary_contact_user_id
			,NEW.primary_contact_user_id
			,OLD.primary_sales_lead_user_id
			,NEW.primary_sales_lead_user_id
			,OLD.primary_service_lead_user_id
			,NEW.primary_service_lead_user_id
			,OLD.notes
			,NEW.notes
			,OLD.last_reviewed_by_user_id
			,NEW.last_reviewed_by_user_id
			,OLD.last_reviewed_on
			,NEW.last_reviewed_on
			,OLD.created_on
			,NEW.created_on
			,OLD.last_modified_on 
			,NEW.last_modified_on 
			,OLD.agency_account_id 
			,NEW.agency_account_id 
			,OLD.excluded_purge
			,NEW.excluded_purge
			,'U';
	RETURN OLD;
END;
$$;
GO 