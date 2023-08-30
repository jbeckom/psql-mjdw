CREATE OR REPLACE FUNCTION sagitta.tr_audit_ac_coverages_arcli_d() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_ac_coverages_arcli (
		 sagitem 
		,lis 
		,old_accts_rec_location_id 
		,old_accts_rec_sub 
		,old_accts_rec_cov_sub 
		,old_accts_rec_your_premises_limit 
		,audit_action 
	)
	SELECT 	 OLD.sagitem 
			,OLD.lis 
			,OLD.accts_rec_location_id 
			,OLD.accts_rec_sub 
			,OLD.accts_rec_cov_sub 
			,OLD.accts_rec_your_premises_limit
			'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_ac_coverages_arcli_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_ac_coverages_arcli_d() TO rl_sagitta_x;
GO 
