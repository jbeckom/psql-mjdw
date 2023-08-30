CREATE OR REPLACE FUNCTION sagitta.sp_br_coverages_loss_cause_cd_info_upsert ()
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.br_coverages_loss_cause_cd_info (
		 sagitem 
		,lis 
		,loss_cause 
		,loss_cause_sub_limit 
		,loss_cause_deductible_amt 
	)
	SELECT 	 sagitem 
			,lis 
			,loss_cause 
			,loss_cause_sub_limit 
			,loss_cause_deductible_amt 
	FROM 	sagitta.stg_br_coverages_loss_cause_cd_info 
	ON CONFLICT (sagitem,lis) DO UPDATE 
	SET 	 loss_cause 				= excluded.loss_cause 
			,loss_cause_sub_limit 		= excluded.loss_cause_sub_limit 
			,loss_cause_deductible_amt 	= excluded.loss_cause_deductible_amt 
	WHERE 	(br_coverages_loss_cause_cd_info.loss_cause,br_coverages_loss_cause_cd_info.loss_cause_sub_limit,br_coverages_loss_cause_cd_info.loss_cause_deductible_amt) 
		IS DISTINCT FROM 	(excluded.loss_cause,excluded.loss_cause_sub_limit,excluded.loss_cause_deductible_amt); 
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_br_coverages_loss_cause_cd_info_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_br_coverages_loss_cause_cd_info_upsert() TO rl_sagitta_x;
GO 
