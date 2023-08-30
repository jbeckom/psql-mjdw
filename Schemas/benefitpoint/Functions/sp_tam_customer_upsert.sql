CREATE OR REPLACE FUNCTION benefitpoint.sp_tam_customer_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO benefitpoint.tam_customer (
		 account_id
		,customer_code
		,customer_class_code
		,branch_code
		,agency_code
		,branch_name
		,agency_name
		,office_id
	)
	SELECT 	 account_id::int
			,customer_code
			,customer_class_code
			,branch_code
			,agency_code
			,branch_name
			,agency_name
			,office_id::int
	FROM 	benefitpoint.stg_tam_customer
	ON CONFLICT (account_id, customer_code) DO UPDATE 
	SET 	 customer_class_code 	= excluded.customer_class_code
			,branch_code 			= excluded.branch_code
			,agency_code 			= excluded.agency_code
			,branch_name 			= excluded.branch_name
			,agency_name 			= excluded.agency_name
			,office_id 				= excluded.office_id
	WHERE 	(tam_customer.customer_class_code,tam_customer.branch_code,tam_customer.agency_code,tam_customer.branch_name,tam_customer.agency_name,tam_customer.office_id) 
		IS DISTINCT FROM 	(excluded.customer_class_code,excluded.branch_code,excluded.agency_code,excluded.branch_name,excluded.agency_name,excluded.office_id);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_tam_customer_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_tam_customer_upsert() TO rl_benefitpoint_x;
GO 
