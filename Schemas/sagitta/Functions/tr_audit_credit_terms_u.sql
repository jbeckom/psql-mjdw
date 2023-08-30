CREATE OR REPLACE FUNCTION sagitta.tr_audit_credit_terms_u() 
RETURNS TRIGGER 
LANGUAGE plpgsql
AS $$

BEGIN 
	INSERT INTO sagitta.audit_credit_terms (
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
		,old_credit_terms_description
		,new_credit_terms_description
		,old_due_days
		,new_due_days
		,old_percent
		,new_percent
		,old_date_off
		,new_date_off
		,old_date_off_remarks
		,new_date_off_remarks
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
			,OLD.credit_terms_description
			,NEW.credit_terms_description
			,OLD.due_days
			,NEW.due_days
			,OLD."percent"
			,NEW."percent"
			,OLD.date_off
			,NEW.date_off
			,OLD.date_off_remarks
			,NEW.date_off_remarks
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_credit_terms_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_credit_terms_u() TO rl_sagitta_x;
GO 
