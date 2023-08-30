CREATE OR REPLACE FUNCTION sagitta.tr_audit_sic_codes_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_sic_codes (
		 sagitem
		,new_uc
		,new_description
		,new_category
		,audit_action
	)
	SELECT 	 NEW.sagitem
			,NEW.uc
			,NEW.description
			,NEW.category
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_sic_codes_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_sic_codes_i() TO rl_sagitta_x;
GO 
