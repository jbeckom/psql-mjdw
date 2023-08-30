/******************/
/*** DATA TYPES ***/
/******************/
ALTER TABLE benefitpoint.audit_employee_type 
	 ALTER COLUMN old_status SET DATA TYPE TEXT USING old_status::TEXT 
	,ALTER COLUMN new_status SET DATA TYPE TEXT USING new_status::TEXT 
	,ALTER COLUMN old_type SET DATA TYPE TEXT USING old_type::TEXT 
	,ALTER COLUMN new_type SET DATA TYPE TEXT USING new_type::TEXT 
	,ALTER COLUMN old_unit_of_measure SET DATA TYPE TEXT USING old_unit_of_measure::TEXT 
	,ALTER COLUMN new_unit_of_measure SET DATA TYPE TEXT USING new_unit_of_measure::TEXT
	,ALTER COLUMN old_frequency SET DATA TYPE TEXT USING old_frequency::TEXT 
	,ALTER COLUMN new_frequency SET DATA TYPE TEXT USING new_frequency::TEXT;
GO 

ALTER TABLE benefitpoint.employee_type 
	 ALTER COLUMN status SET DATA TYPE TEXT USING status::TEXT 
	,ALTER COLUMN "type" SET DATA TYPE TEXT USING "type"::TEXT 
	,ALTER COLUMN unit_of_measure SET DATA TYPE TEXT USING unit_of_measure::TEXT
	,ALTER COLUMN frequency SET DATA TYPE TEXT USING frequency::TEXT;
GO 

DROP TYPE IF EXISTS benefitpoint.employment_status;
GO 

DROP TYPE IF EXISTS benefitpoint.employment_type;
GO 

DROP TYPE IF EXISTS benefitpoint.employment_unit_of_measure;
GO 

DROP TYPE IF EXISTS benefitpoint.employment_frequency;
GO 

/*****************/
/*** FUNCTIONS ***/
/*****************/
DROP FUNCTION IF EXISTS benefitpoint.sp_employee_type_upsert(int, text);
GO 

CREATE OR REPLACE FUNCTION benefitpoint.sp_employee_type_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO benefitpoint.employee_type (
		 account_id
		,employee_type_id
		,status
		,type
		,value
		,unit_of_measure
		,frequency
	)
	SELECT 	account_id
			,employee_type_id
			,status
			,type
			,value
			,unit_of_measure
			,frequency
	FROM 	benefitpoint.stg_employee_type 
	ON CONFLICT (account_id, employee_type_id) DO UPDATE 
	SET 	 status 			= excluded.status
			,"type" 			= excluded."type"
			,value 				= excluded.value
			,unit_of_measure 	= excluded.unit_of_measure
			,frequency 			= excluded.frequency
	WHERE 	(employee_type.status,employee_type."type",employee_type.value,employee_type.unit_of_measure,employee_type.frequency) 
		IS DISTINCT FROM 	(excluded.status,excluded."type",excluded.value,excluded.unit_of_measure,excluded.frequency);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_employee_type_upsert() OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION benefitpoint.sp_employee_type_upsert() TO rl_benefitpoint_x;
GO 
