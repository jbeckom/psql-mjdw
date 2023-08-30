CREATE OR REPLACE FUNCTION sagitta.tr_audit_types_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql
AS $$

BEGIN 
	INSERT INTO sagitta.audit_types (
		 sagitem
		,new_audit_staff_cd
		,new_audit_entry_dt
		,new_audit_time
		,new_audit_cd
		,new_audit_history_record_number
		,new_audit_program
		,new_type_description
		,new_date_off
		,new_date_off_remarks
		,audit_action
	)
	SELECT 	 NEW.sagitem
			,NEW.audit_staff_cd
			,NEW.audit_entry_dt
			,NEW.audit_time
			,NEW.audit_cd
			,NEW.audit_history_record_number
			,NEW.audit_program
			,NEW.type_description
			,NEW.date_off
			,NEW.date_off_remarks
			,'I';
	RETURN NEW;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_types_i() 	OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_types_i() TO rl_sagitta_x;
GO