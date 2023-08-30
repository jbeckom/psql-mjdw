CREATE OR REPLACE FUNCTION sagitta.tr_audit_cp_blankets_detailed_rating_information_info_u() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_cp_blankets_detailed_rating_information_info (
		 sagitem 
		,lis 
		,old_detailed_cause 
        ,new_detailed_cause 
		,old_coinsurance_pct 
        ,new_coinsurance_pct 
		,old_detailed_rate 
        ,new_detailed_rate 
		,old_detailed_ded_symbol 
        ,new_detailed_ded_symbol 
		,old_detailed_ded_amt 
        ,new_detailed_ded_amt 
		,old_detailed_premium 
        ,new_detailed_premium 
	    ,audit_action 
	)
	SELECT 	 OLD.sagitem 
			,OLD.lis 
			,OLD.detailed_cause 
            ,NEW.detailed_cause 
			,OLD.coinsurance_pct 
            ,NEW.coinsurance_pct 
			,OLD.detailed_rate 
            ,NEW.detailed_rate 
			,OLD.detailed_ded_symbol 
            ,NEW.detailed_ded_symbol 
			,OLD.detailed_ded_amt 
            ,NEW.detailed_ded_amt 
			,OLD.detailed_premium 
            ,NEW.detailed_premium 
		    ,'U' ;
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_cp_blankets_detailed_rating_information_info_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_cp_blankets_detailed_rating_information_info_u() TO rl_sagitta_x;
GO 
