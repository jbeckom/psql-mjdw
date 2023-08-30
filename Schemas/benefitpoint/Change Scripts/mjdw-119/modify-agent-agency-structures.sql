/***********************/
/*** DATA STRUCTURES ***/
/***********************/
DROP TABLE IF EXISTS benefitpoint.agency_account_associated_accounts;
GO 

DROP TABLE IF EXISTS benefitpoint.agency_account_associated_agent_accounts;
GO 

DROP TABLE IF EXISTS benefitpoint.audit_agency_account_associated_agent_accounts;
GO 

ALTER TABLE benefitpoint.agency_info 
	DROP CONSTRAINT account_fkey;
GO 

/*****************/
/*** FUNCTIONS ***/
/*****************/
DROP FUNCTION IF EXISTS benefitpoint.sp_agency_account_associated_accounts_delete(int);
GO 

DROP FUNCTION IF EXISTS benefitpoint.sp_agency_account_associated_accounts_insert(int, int);
GO 

DROP FUNCTION IF EXISTS benefitpoint.sp_agency_account_associated_agent_accounts_delete(int);
GO 

DROP FUNCTION IF EXISTS benefitpoint.sp_agency_account_associated_agent_accounts_insert(int, int);
GO 

DROP FUNCTION IF EXISTS benefitpoint.sp_agent_account_associated_accounts_delete(int);
GO 

DROP FUNCTION IF EXISTS benefitpoint.sp_agent_account_associated_accounts_insert(int, int);
GO 

DROP FUNCTION IF EXISTS benefitpoint.sp_agent_info_upsert(int, text);
GO 

DROP FUNCTION IF EXISTS benefitpoint.tr_audit_agency_account_associated_agent_accounts_d();
GO 

DROP FUNCTION IF EXISTS benefitpoint.tr_audit_agency_account_associated_agent_accounts_i();
GO 

DROP FUNCTION IF EXISTS benefitpoint.tr_audit_agency_account_associated_agent_accounts_u();
GO 

DROP FUNCTION IF EXISTS benefitpoint.sp_agency_account_info_upsert(int, text);
GO 

DROP FUNCTION IF EXISTS benefitpoint.sp_agency_info_upsert(int, text);
GO 

DROP FUNCTION IF EXISTS benefitpoint.sp_agent_account_info_upsert(int, text);
GO 

/*** AGENT ACCOUNT INFO ***/
CREATE OR REPLACE FUNCTION benefitpoint.sp_agent_account_info_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO benefitpoint.agent_account_info(
		 agency_account_id 
		,account_id 
	) 
	SELECT 	 agency_account_id 
			,account_id 
	FROM 	benefitpoint.stg_agent_account_info 
	ON CONFLICT (account_id) DO UPDATE 
	SET 	agency_account_id 	= excluded.agency_account_id 
	WHERE 	(agent_account_info.agency_account_id) 
		IS DISTINCT FROM (excluded.agency_account_id); 
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_agent_account_info_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_agent_account_info_upsert() TO rl_benefitpoint_x;
GO 


/*** AGENCY ACCOUNT INFO ***/
CREATE OR REPLACE FUNCTION benefitpoint.sp_agency_account_info_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO benefitpoint.agency_account_info (
		 account_id 
		,agency_name 
	)
	SELECT 	 account_id
			,agency_name 
	FROM 	benefitpoint.stg_agency_account_info 
	ON CONFLICT (account_id) DO UPDATE 
	SET 	agnecy_name 	= excluded.agency_name 
	WHERE 	(agency_account_info.agency_name) 
		IS DISTINCT FROM (excluded.agency_name);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_agency_account_info_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_agency_account_info_upsert() TO rl_benefitpoint_x;
GO 


/*** AGENCY INFO ***/
CREATE OR REPLACE FUNCTION benefitpoint.sp_agency_info_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO benefitpoint.agency_info (
		 account_id
		,info_source
		,email
		,taxpayer_id
		,budgeted_total_annual_premium
		,budgeted_total_annual_revenue
		,associated_account_ids
	)
	SELECT 	 account_id
			,info_source
			,email
			,taxpayer_id
			,budgeted_total_annual_premium
			,budgeted_total_annual_revenue
			,associated_account_ids
	FROM 	benefitpoint.stg_agency_info 
	ON CONFLICT (account_id) DO UPDATE 
	SET 	 info_source 					= excluded.info_source
			,email 							= excluded.email
			,taxpayer_id 					= excluded.taxpayer_id
			,budgeted_total_annual_premium 	= excluded.budgeted_total_annual_premium
			,budgeted_total_annual_revenue 	= excluded.budgeted_total_annual_revenue
			,associated_account_ids 		= excluded.associated_account_ids
	WHERE 	(agency_info.info_source,agency_info.email,agency_info.taxpayer_id,agency_info.budgeted_total_annual_premium,agency_info.budgeted_total_annual_revenue,agency_info.associated_account_ids) 
		IS DISTINCT FROM 	(excluded.info_source,excluded.email,excluded.taxpayer_id,excluded.budgeted_total_annual_premium,excluded.budgeted_total_annual_revenue,excluded.associated_account_ids);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_agency_account_info_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_agency_account_info_upsert() TO rl_benefitpoint_x;
GO 
