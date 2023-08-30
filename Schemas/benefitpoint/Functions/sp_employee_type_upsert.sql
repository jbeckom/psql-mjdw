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
	SELECT 	account_id::int 
			,employee_type_id::int 
			,status
			,type
			,value::int 
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
