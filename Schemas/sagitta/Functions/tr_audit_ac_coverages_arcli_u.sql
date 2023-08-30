CREATE OR REPLACE FUNCTION sagitta.tr_audit_ac_coverages_arcli_u() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_ac_coverages_arcli (
		 sagitem 
		,lis 
		,old_accts_rec_location_id 
		,new_accts_rec_location_id 
		,old_accts_rec_sub 
		,new_accts_rec_sub 
		,old_accts_rec_cov_sub 
		,new_accts_rec_cov_sub 
		,old_accts_rec_your_premises_limit 
		,new_accts_rec_your_premises_limit 
		,audit_action 
	)
	SELECT 	 OLD.sagitem 
			,OLD.lis 
			,OLD.accts_rec_location_id 
			,NEW.accts_rec_location_id 
			,OLD.accts_rec_sub 
			,NEW.accts_rec_sub 
			,OLD.accts_rec_cov_sub 
			,NEW.accts_rec_cov_sub 
			,OLD.accts_rec_your_premises_limit 
			,NEW.accts_rec_your_premises_limit
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_ac_coverages_arcli_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_ac_coverages_arcli_u() TO rl_sagitta_x;
GO 
