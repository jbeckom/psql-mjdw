DROP TABLE IF EXISTS benefitpoint.agent_info;
GO 

DROP TABLE IF EXISTS benefitpoint.agency_info;
GO 

CREATE TABLE benefitpoint.agency_info (
	 account_id 	int 			NOT NULL 
	,info_source 	TEXT 			NOT NULL 
	,email 			varchar(100) 	NULL 
	,taxpayer_id 	varchar(9) 		NULL 
	,budgeted_total_annual_premium 	double PRECISION 	NULL 
	,budgeted_total_annual_revenue 	double PRECISION 	NULL 
	,associated_account_ids 		TEXT 				NULL 
	,CONSTRAINT account_fkey FOREIGN KEY (account_id) REFERENCES benefitpoint.account (account_id) ON DELETE CASCADE 
	,CONSTRAINT agency_info_pkey PRIMARY KEY (account_id)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.agency_info OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.agency_info TO rl_benefitpoint_r;
GO 

GRANT INSERT ON TABLE benefitpoint.agency_info TO rl_benefitpoint_a;
GO 

GRANT UPDATE ON TABLE benefitpoint.agency_info TO rl_benefitpoint_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON benefitpoint.agency_info FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_agency_info_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON benefitpoint.agency_info FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_agency_info_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON benefitpoint.agency_info FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION benefitpoint.tr_audit_agency_info_u();
GO 


/*******************/
/*** AUDIT TABLE ***/
/*******************/
DROP TABLE IF EXISTS benefitpoint.audit_agent_info;
GO 

DROP TABLE IF EXISTS benefitpoint.audit_agency_info;
GO 

CREATE TABLE benefitpoint.audit_agency_info (
	 account_id 						int 				NOT NULL 
	,old_info_source 					TEXT 				NULL 
	,new_info_source 					TEXT 				NULL 
	,old_email 							varchar(100) 		NULL 
	,new_email 							varchar(100) 		NULL 
	,old_taxpayer_id 					varchar(9) 			NULL 
	,new_taxpayer_id 					varchar(9) 			NULL 
	,old_budgeted_total_annual_premium 	double PRECISION 	NULL 
	,new_budgeted_total_annual_premium 	double PRECISION 	NULL 
	,old_budgeted_total_annual_revenue 	double PRECISION 	NULL 
	,new_budgeted_total_annual_revenue 	double PRECISION 	NULL 
	,old_associated_account_ids 		TEXT 				NULL 
	,new_associated_account_ids 		TEXT 				NULL 
	,audit_action 						char(1) 			NOT NULL 
	,audit_user 						TEXT 				NOT NULL 	DEFAULT current_user 
	,audit_timestamp 					timestamp 			NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 							bigint 				NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.audit_agency_info OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE benefitpoint.audit_agency_info TO rl_benefitpoint_a;
GO 

/*****************/
/*** FUNCTIONS ***/
/*****************/
DROP FUNCTION IF EXISTS benefitpoint.tr_audit_agent_info_d();
GO 

DROP FUNCTION IF EXISTS benefitpoint.tr_audit_agent_info_i();
GO 

DROP FUNCTION IF EXISTS benefitpoint.tr_audit_agent_info_u();
GO 

CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_agency_info_d() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_agency_info (
		 account_id 
		,old_info_source
		,old_email 
		,old_taxpayer_id 
		,old_budgeted_total_annual_premium 
		,old_budgeted_total_annual_revenue 
		,old_associated_account_ids 
		,audit_action
	)
	SELECT 	 OLD.account_id 
			,OLD.info_source
			,OLD.email 
			,OLD.taxpayer_id 
			,OLD.budgeted_total_annual_premium 
			,OLD.budgeted_total_annual_revenue 
			,OLD.associated_account_ids 
			,'D';
	RETURN OLD;
END;
$$;
GO 

CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_agency_info_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_agency_info (
		 account_id 
		,new_info_source 
		,new_email 
		,new_taxpayer_id 
		,new_budgeted_total_annual_premium 
		,new_budgeted_total_annual_revenue 
		,new_associated_account_ids 
		,audit_action
	)
	SELECT 	 NEW.account_id 
			,NEW.info_source 
			,NEW.email 
			,NEW.taxpayer_id 
			,NEW.budgeted_total_annual_premium 
			,NEW.budgeted_total_annual_revenue 
			,NEW.associated_account_ids 
			,'I';
	RETURN NEW;
END;
$$;
GO 

CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_agency_info_u() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_agency_info (
		 account_id 
		,old_info_source 
		,new_info_source 
		,old_email 
		,new_email 
		,old_taxpayer_id 
		,new_taxpayer_id 
		,old_budgeted_total_annual_premium 
		,new_budgeted_total_annual_premium 
		,old_budgeted_total_annual_revenue 
		,new_budgeted_total_annual_revenue 
		,old_associated_account_ids 
		,new_associated_account_ids 
		,audit_action
	)
	SELECT 	 OLD.account_id 
			,OLD.info_source 
			,NEW.info_source 
			,OLD.email 
			,NEW.email 
			,OLD.taxpayer_id 
			,NEW.taxpayer_id 
			,OLD.budgeted_total_annual_premium 
			,NEW.budgeted_total_annual_premium 
			,OLD.budgeted_total_annual_revenue 
			,NEW.budgeted_total_annual_revenue 
			,OLD.associated_account_ids 
			,NEW.associated_account_ids 
			,'U';
	RETURN OLD;
END;
$$;
GO 