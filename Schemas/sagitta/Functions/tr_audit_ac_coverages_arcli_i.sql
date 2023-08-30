CREATE OR REPLACE FUNCTION sagitta.tr_audit_ac_coverages_arcli_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_ac_coverages_arcli (
		 sagitem 
		,lis 
		,new_accts_rec_location_id 
		,new_accts_rec_sub 
		,new_accts_rec_cov_sub 
		,new_accts_rec_your_premises_limit 
		,audit_action 
	)
	SELECT 	 NEW.sagitem 
			,NEW.lis 
			,NEW.accts_rec_location_id 
			,NEW.accts_rec_sub 
			,NEW.accts_rec_cov_sub 
			,NEW.accts_rec_your_premises_limit
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_ac_coverages_arcli_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_ac_coverages_arcli_i() TO rl_sagitta_x;
GO 
