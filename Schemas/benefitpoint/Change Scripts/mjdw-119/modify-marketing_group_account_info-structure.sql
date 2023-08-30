/******************/	
/*** DATA TYPES ***/
/******************/
ALTER TABLE benefitpoint.audit_marketing_group_account_info 
	 ALTER COLUMN old_marketing_group_type SET DATA TYPE TEXT USING old_marketing_group_type::TEXT 
	,ALTER COLUMN new_marketing_group_type SET DATA TYPE TEXT USING new_marketing_group_type::TEXT;
GO 

ALTER TABLE benefitpoint.marketing_group_account_info
	ALTER COLUMN marketing_group_type SET DATA TYPE TEXT USING marketing_group_type::TEXT;
GO 

DROP TYPE IF EXISTS benefitpoint.marketing_group_type;
GO 

/*******************/
/*** CONSTRAINTS ***/
/*******************/
ALTER TABLE benefitpoint.marketing_group_account_info
	DROP CONSTRAINT account_fkey;
GO 

/*****************/
/*** FUNCTIONS ***/
/*****************/
DROP FUNCTION IF EXISTS benefitpoint.sp_marketing_group_account_associated_accounts_delete(int);
GO 

DROP FUNCTION IF EXISTS benefitpoint.sp_marketing_group_account_associated_accounts_insert(int, int);
GO 

DROP FUNCTION IF EXISTS benefitpoint.sp_marketing_group_account_info_upsert(int, text);
GO 

CREATE OR REPLACE FUNCTION benefitpoint.sp_marketing_group_account_info_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO benefitpoint.marketing_group_account_info (
		 account_id
		,marketing_group_name
		,marketing_group_type
		,number_of_ftes
		,number_of_ftes_as_of
		,number_of_full_time_equivalents
		,number_of_full_time_equivalents_as_of_date
		,coverage_subject_to_employer_mandate
		,associated_account_ids
	)
	SELECT 	 account_id
			,marketing_group_name
			,marketing_group_type
			,number_of_ftes::int
			,number_of_ftes_as_of::timestamptz
			,number_of_full_time_equivalents::int
			,number_of_full_time_equivalents_as_of_date::timestamptz
			,coverage_subject_to_employer_mandate::bool
			,associated_account_ids
	FROM 	benefitpoint.stg_marketing_group_account_info 
	ON CONFLICT (account_id) DO UPDATE 
	SET 	 marketing_group_name 							= excluded.marketing_group_name
			,marketing_group_type 							= excluded.marketing_group_type
			,number_of_ftes 								= excluded.number_of_ftes
			,number_of_ftes_as_of 							= excluded.number_of_ftes_as_of
			,number_of_full_time_equivalents 				= excluded.number_of_full_time_equivalents
			,number_of_full_time_equivalents_as_of_date 	= excluded.number_of_full_time_equivalents_as_of_date
			,coverage_subject_to_employer_mandate 			= excluded.coverage_subject_to_employer_mandate
			,associated_account_ids 						= excluded.associated_account_ids
	WHERE 	(marketing_group_account_info.marketing_group_name,marketing_group_account_info.marketing_group_type,marketing_group_account_info.number_of_ftes,marketing_group_account_info.number_of_ftes_as_of,marketing_group_account_info.number_of_full_time_equivalents,marketing_group_account_info.number_of_full_time_equivalents_as_of_date,marketing_group_account_info.coverage_subject_to_employer_mandate,marketing_group_account_info.associated_account_ids) 
		IS DISTINCT FROM 	(excluded.marketing_group_name,excluded.marketing_group_type,excluded.number_of_ftes,excluded.number_of_ftes_as_of,excluded.number_of_full_time_equivalents,excluded.number_of_full_time_equivalents_as_of_date,excluded.coverage_subject_to_employer_mandate,excluded.associated_account_ids);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_marketing_group_account_info_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_marketing_group_account_info_upsert() TO rl_benefitpoint_x;
GO 
