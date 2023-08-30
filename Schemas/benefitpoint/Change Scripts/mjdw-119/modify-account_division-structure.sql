/****************/
/*** FUNCTION ***/
/****************/
DROP FUNCTION IF EXISTS benefitpoint.sp_account_division_upsert(int, int, text);
GO 

CREATE OR REPLACE FUNCTION benefitpoint.sp_account_division_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO benefitpoint.account_division(
		 account_id
		,division_id
		,code
		,name
		,payroll_cycle
	)
	SELECT 	 account_id
			,division_id
			,code
			,name
			,payroll_cycle
	FROM 	benefitpoint.stg_account_division 
	ON CONFLICT (account_id, division_id) DO UPDATE 
	SET 	 code 			= excluded.code
			,name 			= excluded.name
			,payroll_cycle 	= excluded.payroll_cycle 
	WHERE 	(account_division.code,account_division.name,account_division.payroll_cycle) 
		IS DISTINCT FROM 	(excluded.code,excluded.name,excluded.payroll_cycle);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_account_division_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_account_division_upsert() TO rl_benefitpoint_x;
GO 
