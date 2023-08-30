CREATE OR REPLACE FUNCTION sagitta.sp_cp_blankets_detailed_rating_information_info_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.cp_blankets_detailed_rating_information_info (
		 sagitem 
		,lis 
		,detailed_cause 
		,coinsurance_pct 
		,detailed_rate 
		,detailed_ded_symbol 
		,detailed_ded_amt 
		,detailed_premium 
	)
	SELECT 	 sagitem 
			,lis 
			,detailed_cause 
			,coinsurance_pct 
			,detailed_rate 
			,detailed_ded_symbol 
			,detailed_ded_amt 
			,detailed_premium 
	FROM 	sagitta.stg_cp_blankets_detailed_rating_information_info 
	ON CONFLICT (sagitem,lis) DO UPDATE 
	SET  detailed_cause     	= excluded.detailed_cause 
		,coinsurance_pct    	= excluded.coinsurance_pct 
		,detailed_rate  		= excluded.detailed_rate 
		,detailed_ded_symbol    = excluded.detailed_ded_symbol 
		,detailed_ded_amt   	= excluded.detailed_ded_amt 
		,detailed_premium   	= excluded.detailed_premium
	WHERE 	(cp_blankets_detailed_rating_information_info.detailed_cause,cp_blankets_detailed_rating_information_info.coinsurance_pct,cp_blankets_detailed_rating_information_info.detailed_rate,cp_blankets_detailed_rating_information_info.detailed_ded_symbol,cp_blankets_detailed_rating_information_info.detailed_ded_amt,cp_blankets_detailed_rating_information_info.detailed_premium) 
		IS DISTINCT FROM 	(excluded.detailed_cause,excluded.coinsurance_pct,excluded.detailed_rate,excluded.detailed_ded_symbol,excluded.detailed_ded_amt,excluded.detailed_premium); 
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_cp_blankets_detailed_rating_information_info_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_cp_blankets_detailed_rating_information_info_upsert() TO rl_sagitta_x;
GO 
