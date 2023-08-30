/******************/
/*** DATA TYPES ***/
/******************/
ALTER TABLE benefitpoint.audit_person_info 
	 ALTER COLUMN old_salutation SET DATA TYPE TEXT USING old_salutation::TEXT 
	,ALTER COLUMN new_salutation SET DATA TYPE TEXT USING new_salutation::TEXT 
	,ALTER COLUMN old_gender SET DATA TYPE TEXT USING old_gender::TEXT 
	,ALTER COLUMN new_gender SET DATA TYPE TEXT USING new_gender::TEXT 
	,ALTER COLUMN old_marital_status SET DATA TYPE TEXT USING old_marital_status::TEXT 
	,ALTER COLUMN new_marital_status SET DATA TYPE TEXT USING new_marital_status::TEXT;
GO 

ALTER TABLE benefitpoint.person_info 
	 ALTER COLUMN salutation SET DATA TYPE TEXT USING salutation::TEXT
	,ALTER COLUMN gender SET DATA TYPE TEXT USING gender::TEXT 
	,ALTER COLUMN marital_status SET DATA TYPE TEXT USING marital_status::TEXT;
GO 

DROP TYPE IF EXISTS benefitpoint.salutation;
GO 

DROP TYPE IF EXISTS benefitpoint.gender;
GO 

DROP TYPE IF EXISTS benefitpoint.marital_status;
GO 

/*****************/
/*** FUNCTIONS ***/
/*****************/
DROP FUNCTION IF EXISTS benefitpoint.sp_person_info_upsert(TEXT, TEXT, int, text);
GO 

CREATE OR REPLACE FUNCTION benefitpoint.sp_person_info_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO benefitpoint.person_info (
		 person_source
		,source_type
		,source_key
		,first_name
		,middle_name
		,last_name
		,salutation
		,date_of_birth
		,gender
		,ssn
		,marital_status
	)
	SELECT 	 person_source
			,source_type
			,source_key
			,first_name
			,middle_name
			,last_name
			,salutation
			,date_of_birth
			,gender
			,ssn
			,marital_status
	FROM 	benefitpoint.stg_person_info 
	ON CONFLICT (person_source, source_type, source_key) DO UPDATE 
	SET 	 first_name 		= excluded.first_name
			,middle_name 		= excluded.middle_name
			,last_name 			= excluded.last_name
			,salutation 		= excluded.salutation
			,date_of_birth 		= excluded.date_of_birth
			,gender 			= excluded.gender
			,ssn 				= excluded.ssn
			,marital_status 	= excluded.marital_status
	WHERE 	(person_info.first_name,person_info.middle_name,person_info.last_name,person_info.salutation,person_info.date_of_birth,person_info.gender,person_info.ssn,person_info.marital_status) 
		IS DISTINCT FROM 	(excluded.first_name,excluded.middle_name,excluded.last_name,excluded.salutation,excluded.date_of_birth,excluded.gender,excluded.ssn,excluded.marital_status);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_person_info_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_person_info_upsert() TO rl_benefitpoint_x;
GO 
