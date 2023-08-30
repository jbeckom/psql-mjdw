CREATE OR REPLACE FUNCTION sagitta.tr_audit_cp_blankets_detailed_rating_information_info_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_cp_blankets_detailed_rating_information_info (
		 sagitem 
		,lis 
		,new_detailed_cause 
		,new_coinsurance_pct 
		,new_detailed_rate 
		,new_detailed_ded_symbol 
		,new_detailed_ded_amt 
		,new_detailed_premium 
	    ,audit_action 
	)
	SELECT 	 NEW.sagitem 
			,NEW.lis 
			,NEW.detailed_cause 
			,NEW.coinsurance_pct 
			,NEW.detailed_rate 
			,NEW.detailed_ded_symbol 
			,NEW.detailed_ded_amt 
			,NEW.detailed_premium 
		    ,'D' ;
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_cp_blankets_detailed_rating_information_info_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_cp_blankets_detailed_rating_information_info_i() TO rl_sagitta_x;
GO 
