CREATE OR REPLACE FUNCTION sagitta.sp_ac_coverages_vpcli_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.ac_coverages_vpcli (
		 sagitem
		,lis 
		,val_papers_location_id 
		,val_papers_sub 
		,val_papers_your_premises_amt 
	)
	SELECT 	 sagitem
			,lis 
			,val_papers_location_id 
			,val_papers_sub 
			,val_papers_your_premises_amt 
	FROM 	sagitta.stg_ac_coverages_vpcli 
	ON CONFLICT (sagitem, lis) DO UPDATE 
	SET 	 val_papers_location_id 		= excluded.val_papers_location_id 
			,val_papers_sub 				= excluded.val_papers_sub 
			,val_papers_your_premises_amt 	= excluded.val_papers_your_premises_amt 
	WHERE 	(ac_coverages_vpcli.val_papers_location_id,ac_coverages_vpcli.val_papers_sub,ac_coverages_vpcli.val_papers_your_premises_amt) 
		IS DISTINCT FROM 	(excluded.val_papers_location_id,excluded.val_papers_sub,excluded.val_papers_your_premises_amt);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_ac_coverages_vpcli_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_ac_coverages_vpcli_upsert() TO rl_sagitta_x;
GO 
