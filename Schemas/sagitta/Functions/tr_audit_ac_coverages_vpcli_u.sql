CREATE OR REPLACE FUNCTION sagitta.tr_audit_ac_coverages_vpcli_u() 
RETURNS TRIGGER  
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_ac_coverages_vpcli (
		 sagitem 
		,lis 
		,old_val_papers_location_id 
		,new_val_papers_location_id 
		,old_val_papers_sub 
		,new_val_papers_sub 
		,old_val_papers_your_premises_amt 
		,new_val_papers_your_premises_amt 
		,audit_action 
	)
	SELECT 	 OLD.sagitem 
			,OLD.lis 
			,OLD.val_papers_location_id 
			,NEW.val_papers_location_id 
			,OLD.val_papers_sub 
			,NEW.val_papers_sub 
			,OLD.val_papers_your_premises_amt 
			,NEW.val_papers_your_premises_amt 
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_ac_coverages_vpcli_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_ac_coverages_vpcli_u() TO rl_sagitta_x;
GO 
