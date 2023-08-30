CREATE OR REPLACE FUNCTION sagitta.tr_audit_sic_codes_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_sic_codes (
		 sagitem
		,old_uc
		,new_uc
		,old_description
		,new_description
		,old_category
		,new_category
		,audit_action
	)
	SELECT 	 OLD.sagitem
			,OLD.uc
			,NEW.uc
			,OLD.description
			,NEW.description
			,OLD.category
			,NEW.category
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_sic_codes_u () OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_sic_codes_u() TO rl_sagitta_x;
GO 
