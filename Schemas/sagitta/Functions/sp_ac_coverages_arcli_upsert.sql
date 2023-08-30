CREATE OR REPLACE FUNCTION sagitta.sp_ac_coverages_arcli_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.ac_coverages_arcli(
		 sagitem
		,lis 
		,accts_rec_location_id 
		,accts_rec_sub 
		,accts_rec_cov_sub 
		,accts_rec_your_premises_limit 
	) 
	SELECT 	 sagitem
			,lis 
			,accts_rec_location_id 
			,accts_rec_sub 
			,accts_rec_cov_sub 
			,accts_rec_your_premises_limit 
	FROM 	sagitta.stg_ac_coverages_arcli 
	ON CONFLICT (sagitem,lis) DO UPDATE 
	SET 	 accts_rec_location_id 			= excluded.accts_rec_location_id 
			,accts_rec_sub 					= excluded.accts_rec_sub 
			,accts_rec_cov_sub 				= excluded.accts_rec_cov_sub 
			,accts_rec_your_premises_limit 	= excluded.accts_rec_your_premises_limit 
	WHERE 	(ac_coverages_arcli.accts_rec_location_id,ac_coverages_arcli.accts_rec_sub,ac_coverages_arcli.accts_rec_cov_sub,ac_coverages_arcli.accts_rec_your_premises_limit) 
		IS DISTINCT FROM 	(excluded.accts_rec_location_id,excluded.accts_rec_sub,excluded.accts_rec_cov_sub,excluded.accts_rec_your_premises_limit);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_ac_coverages_arcli_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_ac_coverages_arcli_upsert() TO rl_sagitta_x;
GO 
