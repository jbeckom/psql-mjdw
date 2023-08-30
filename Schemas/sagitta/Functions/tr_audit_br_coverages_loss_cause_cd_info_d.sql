CREATE OR REPLACE FUNCTION sagitta.tr_audit_br_coverages_loss_cause_cd_info_d() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_br_coverages_loss_cause_cd_info (
		 sagitem 
		,lis 
		,old_loss_cause 
		,old_loss_cause_sub_limit 
		,old_loss_cause_deductible_amt 
		,audit_action 
	)
	SELECT 	 OLD.sagitem 
			,OLD.lis 
			,OLD.loss_cause 
			,OLD.loss_cause_sub_limit 
			,OLD.loss_cause_deductible_amt 
			,'D' ;
	RETURN OLD;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_br_coverages_loss_cause_cd_info_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_br_coverages_loss_cause_cd_info_d() TO rl_sagitta_x;
GO 
