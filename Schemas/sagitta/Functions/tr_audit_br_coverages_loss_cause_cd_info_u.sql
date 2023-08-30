CREATE OR REPLACE FUNCTION sagitta.tr_audit_br_coverages_loss_cause_cd_info_u() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_br_coverages_loss_cause_cd_info (
		 sagitem 
		,lis 
		,old_loss_cause 
		,new_loss_cause 
		,old_loss_cause_sub_limit 
		,new_loss_cause_sub_limit 
		,old_loss_cause_deductible_amt 
		,new_loss_cause_deductible_amt 
		,audit_action 
	)
	SELECT 	 OLD.sagitem 
			,OLD.lis 
			,OLD.loss_cause 
			,NEW.loss_cause 
			,OLD.loss_cause_sub_limit 
			,NEW.loss_cause_sub_limit 
			,OLD.loss_cause_deductible_amt 
			,NEW.loss_cause_deductible_amt 
			,'U' ;
	RETURN OLD;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_br_coverages_loss_cause_cd_info_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_br_coverages_loss_cause_cd_info_u() TO rl_sagitta_x;
GO 
