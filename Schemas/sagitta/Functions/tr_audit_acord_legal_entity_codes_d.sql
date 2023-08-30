CREATE OR REPLACE FUNCTION sagitta.tr_audit_acord_legal_entity_codes_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_acord_legal_entity_codes (
		 sagitem
		,old_uc
		,old_description
		,old_date_off
		,old_date_off_remarks
		,audit_action
	)
	SELECT 	 OLD.sagitem
			,OLD.uc
			,OLD.description
			,OLD.date_off
			,OLD.date_off_remarks
			,'D'
	;
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_acord_legal_entity_codes_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_acord_legal_entity_codes_d() TO rl_sagitta_x;
GO 
