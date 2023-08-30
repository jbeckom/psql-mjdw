CREATE OR REPLACE FUNCTION sagitta.tr_audit_acord_legal_entity_codes_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_acord_legal_entity_codes (
		 sagitem
		,new_uc
		,new_description
		,new_date_off
		,new_date_off_remarks
		,audit_action
	)
	SELECT 	 NEW.sagitem
			,NEW.uc
			,NEW.description
			,NEW.date_off
			,NEW.date_off_remarks
			,'I'
	;
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_acord_legal_entity_codes_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_acord_legal_entity_codes_i() TO rl_sagitta_x;
GO 
