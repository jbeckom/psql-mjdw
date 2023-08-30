CREATE OR REPLACE FUNCTION benefitpoint.sp_account_class_upsert (_account_id int, _class_id int, _xmldata TEXT)
RETURNS INT 
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;
	
BEGIN 
	WITH xmldata AS (SELECT _xmldata::XML AS exemel)
	
	INSERT INTO benefitpoint.account_class (
		 account_id 
		,class_id 
		,code 
		,name 
		,payroll_cycle 
	)
	
	SELECT 	 _account_id 	AS account_id
			,_class_id 		AS class_id
			,REPLACE(regexp_replace(UNNEST(xpath('/accountClasses/code/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&') 			AS code
			,REPLACE(regexp_replace(UNNEST(xpath('/accountClasses/name/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&') 			AS name 
			,REPLACE(regexp_replace(UNNEST(xpath('/accountClasses/payrollCycle/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&') 	AS payroll_cycle
	FROM 	xmldata 
	ON CONFLICT (account_id, class_id) DO UPDATE 
	SET 	 code 			= excluded.code 
			,name 			= excluded.name 
			,payroll_cycle 	= excluded.payroll_cycle 
	WHERE 	(account_class.code, account_class.name, account_class.payroll_cycle)
		IS DISTINCT FROM 	(excluded.code, excluded.name, excluded.payroll_cycle);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_account_class_upsert (int, int, TEXT) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_account_class_upsert (int, int, TEXT) TO rl_benefitpoint_x;
GO 
