CREATE OR REPLACE FUNCTION sagitta.tr_audit_staff_addlinfo_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_staff_addlinfo (
		 sagitem
		,old_audit_staff_cd
		,old_audit_entry_dt
		,old_audit_time
		,old_audit_cd
		,old_audit_history_record_number
		,old_audit_program
		,old_only_staff_name
		,old_associate_role
		,audit_action
	)
	SELECT 	 OLD.sagitem
			,OLD.audit_staff_cd
			,OLD.audit_entry_dt
			,OLD.audit_time
			,OLD.audit_cd
			,OLD.audit_history_record_number
			,OLD.audit_program
			,OLD.only_staff_name
			,OLD.associate_role
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_staff_addlinfo_d() OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_staff_addlinfo_d() TO rl_sagitta_x;
GO
