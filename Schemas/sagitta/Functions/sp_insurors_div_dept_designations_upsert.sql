CREATE OR REPLACE FUNCTION sagitta.sp_insurors_div_dept_designations_upsert ()
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.insurors_div_dept_designations (
		 sagitem 
		,lis 
		,valid_div 
		,valid_dept 
		,limit_new 
		,limit_new_date 
		,limit_renew 
		,limit_renew_date 
	)
	SELECT 	 sagitem 
			,lis 
			,valid_div 
			,valid_dept 
			,limit_new 
			,limit_new_date 
			,limit_renew 
			,limit_renew_date 
	FROM 	sagitta.stg_insurors_div_dept_designations 
	ON CONFLICT (sagitem, lis, valid_div, valid_dept) DO UPDATE 
	SET 	 limit_new			= excluded.limit_new 
			,limit_new_date 	= excluded.limit_new_date 
			,limit_renew 		= excluded.limit_renew 
			,limit_renew_date 	= excluded.limit_renew_date 
	WHERE 	(insurors_div_dept_designations.limit_new,insurors_div_dept_designations.limit_new_date,insurors_div_dept_designations.limit_renew,insurors_div_dept_designations.limit_renew_date) 
		IS DISTINCT FROM 	(excluded.limit_new,excluded.limit_new_date,excluded.limit_renew,excluded.limit_renew_date); 
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;	
END;
$$;
GO;

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_insurors_div_dept_designations_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_insurors_div_dept_designations_upsert() TO rl_sagitta_x;
GO 
