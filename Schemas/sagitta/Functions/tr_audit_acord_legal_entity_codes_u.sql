CREATE OR REPLACE FUNCTION sagitta.tr_audit_acord_legal_entity_codes_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_acord_legal_entity_codes (
		 sagitem
		,old_uc
		,new_uc
		,old_description
		,new_description
		,old_date_off
		,new_date_off
		,old_date_off_remarks 
		,new_date_off_remarks
		,audit_action
	)
	SELECT 	 OLD.sagitem
			,OLD.uc
			,NEW.uc
			,OLD.description
			,NEW.description
			,OLD.date_off
			,NEW.date_off
			,OLD.date_off_remarks
			,NEW.date_off_remarks
			,'U'
	;
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_acord_legal_entity_codes_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_acord_legal_entity_codes_u() TO rl_sagitta_x;
GO 
