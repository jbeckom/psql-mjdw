CREATE OR REPLACE FUNCTION sagitta.tr_audit_staff_addlinfo_u ()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_staff_addlinfo (
		 sagitem
		,old_audit_staff_cd
		,new_audit_staff_cd
		,old_audit_entry_dt
		,new_audit_entry_dt
		,old_audit_time
		,new_audit_time
		,old_audit_cd
		,new_audit_cd
		,old_audit_history_record_number
		,new_audit_history_record_number
		,old_audit_program
		,new_audit_program
		,old_only_staff_name
		,new_only_staff_name
		,old_associate_role
		,new_associate_role
		,audit_action
	)
	SELECT 	 OLD.sagitem
			,OLD.audit_staff_cd
			,NEW.audit_staff_cd
			,OLD.audit_entry_dt
			,NEW.audit_entry_dt
			,OLD.audit_time
			,NEW.audit_time
			,OLD.audit_cd
			,NEW.audit_cd
			,OLD.audit_history_record_number
			,NEW.audit_history_record_number
			,OLD.audit_program
			,NEW.audit_program
			,OLD.only_staff_name
			,NEW.only_staff_name
			,OLD.associate_role
			,NEW.associate_role
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_staff_addlinfo_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_staff_addlinfo_u() TO rl_sagitta_x;
GO 
