DROP FUNCTION IF EXISTS benefitpoint.sp_account_upsert(int, text);

CREATE OR REPLACE FUNCTION benefitpoint.sp_account_upsert()
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO benefitpoint.account (
		 account_id
		,active
		,inactive_as_of
		,inactive_reason
		,account_classification
		,account_type
		,office_id
		,department_id
		,administrator_user_id
		,primary_contact_user_id
		,primary_sales_lead_user_id
		,primary_service_lead_user_id
		,notes
		,last_reviewed_by_user_id
		,last_reviewed_on
		,created_on
		,last_modified_on
		,agency_account_id
		,excluded_purge
	)
	SELECT 	 account_id
			,active
			,inactive_as_of
			,inactive_reason
			,account_classification
			,account_type
			,office_id
			,department_id
			,administrator_user_id
			,primary_contact_user_id
			,primary_sales_lead_user_id
			,primary_service_lead_user_id
			,notes
			,last_reviewed_by_user_id::int
			,last_reviewed_on::timestamptz
			,created_on
			,last_modified_on
			,agency_account_id
			,excluded_purge::bool
	FROM 	benefitpoint.stg_account 
	ON CONFLICT (account_id) DO UPDATE 
	SET 	 active 						= excluded.active
			,inactive_as_of 				= excluded.inactive_as_of
			,inactive_reason 				= excluded.inactive_reason
			,account_classification 		= excluded.account_classification
			,account_type 					= excluded.account_type
			,office_id 						= excluded.office_id
			,department_id 					= excluded.department_id
			,administrator_user_id 			= excluded.administrator_user_id
			,primary_contact_user_id 		= excluded.primary_contact_user_id
			,primary_sales_lead_user_id 	= excluded.primary_sales_lead_user_id
			,primary_service_lead_user_id 	= excluded.primary_service_lead_user_id
			,notes 							= excluded.notes
			,last_reviewed_by_user_id 		= excluded.last_reviewed_by_user_id
			,last_reviewed_on 				= excluded.last_reviewed_on
			,created_on 					= excluded.created_on
			,last_modified_on 				= excluded.last_modified_on
			,agency_account_id 				= excluded.agency_account_id
			,excluded_purge 				= excluded.excluded_purge
	WHERE 	(account.active,account.inactive_as_of,account.inactive_reason,account.account_classification,account.account_type,account.office_id,account.department_id,account.administrator_user_id,account.primary_contact_user_id,account.primary_sales_lead_user_id,account.primary_service_lead_user_id,account.notes,account.last_reviewed_by_user_id,account.last_reviewed_on,account.created_on,account.last_modified_on,account.agency_account_id,account.excluded_purge) 
		IS DISTINCT FROM 	(excluded.active,excluded.inactive_as_of,excluded.inactive_reason,excluded.account_classification,excluded.account_type,excluded.office_id,excluded.department_id,excluded.administrator_user_id,excluded.primary_contact_user_id,excluded.primary_sales_lead_user_id,excluded.primary_service_lead_user_id,excluded.notes,excluded.last_reviewed_by_user_id,excluded.last_reviewed_on,excluded.created_on,excluded.last_modified_on,excluded.agency_account_id,excluded.excluded_purge);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_account_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_account_upsert() TO rl_benefitpoint_x;
GO 
