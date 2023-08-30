CREATE OR REPLACE FUNCTION sagitta.tr_audit_ac_coverages_vpcli_i() 
RETURNS TRIGGER  
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_ac_coverages_vpcli (
		 sagitem 
		,lis 
		,new_val_papers_location_id 
		,new_val_papers_sub 
		,new_val_papers_your_premises_amt 
		,audit_action 
	)
	SELECT 	 NEW.sagitem 
			,NEW.lis 
			,NEW.val_papers_location_id 
			,NEW.val_papers_sub 
			,NEW.val_papers_your_premises_amt 
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_ac_coverages_vpcli_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_ac_coverages_vpcli_i() TO rl_sagitta_x;
GO 
