CREATE OR REPLACE FUNCTION sagitta.tr_audit_credit_terms_d() 
RETURNS TRIGGER 
LANGUAGE plpgsql
AS $$

BEGIN 
	INSERT INTO sagitta.audit_credit_terms (
		 sagitem
		,old_audit_staff_cd 
		,old_audit_entry_dt 
		,old_audit_time 
		,old_audit_cd 
		,old_audit_history_record_number 
		,old_audit_program
		,old_credit_terms_description
		,old_due_days
		,old_percent
		,old_date_off
		,old_date_off_remarks
		,audit_action
	)
	SELECT 	 OLD.sagitem
			,OLD.audit_staff_cd
			,OLD.audit_entry_dt
			,OLD.audit_time
			,OLD.audit_cd
			,OLD.audit_history_record_number
			,OLD.audit_program
			,OLD.credit_terms_description
			,OLD.due_days
			,OLD."percent"
			,OLD.date_off
			,OLD.date_off_remarks
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_credit_terms_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_credit_terms_d() TO rl_sagitta_x;
GO 
