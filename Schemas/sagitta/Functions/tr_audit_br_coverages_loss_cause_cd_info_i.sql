CREATE OR REPLACE FUNCTION sagitta.tr_audit_br_coverages_loss_cause_cd_info_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_br_coverages_loss_cause_cd_info (
		 sagitem 
		,lis 
		,new_loss_cause 
		,new_loss_cause_sub_limit 
		,new_loss_cause_deductible_amt 
		,audit_action 
	)
	SELECT 	 NEW.sagitem 
			,NEW.lis 
			,NEW.loss_cause 
			,NEW.loss_cause_sub_limit 
			,NEW.loss_cause_deductible_amt 
			,'I' ;
	RETURN NEW;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_br_coverages_loss_cause_cd_info_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_br_coverages_loss_cause_cd_info_i() TO rl_sagitta_x;
GO 
