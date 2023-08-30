CREATE OR REPLACE FUNCTION sagitta.tr_audit_coverages_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_coverages (
		 sagitem
		,new_audit_staff_cd
		,new_audit_entry_dt
		,new_audit_time
		,new_audit_cd
		,new_audit_history_record_number
		,new_audit_program
		,new_audit_effective_dt
		,new_audit_change_agency_id
		,new_coverage_cd
		,new_coverage_description
		,new_major_lob_cd
		,new_acord_lob_cd
		,new_acord_sub_lob
		,new_coverage_type
		,new_personal_commercial
		,new_off_dt
		,new_off_dt_remarks
		,audit_action
	)
	SELECT 	 NEW.sagitem
			,NEW.audit_staff_cd
			,NEW.audit_entry_dt
			,NEW.audit_time
			,NEW.audit_cd
			,NEW.audit_history_record_number
			,NEW.audit_program
			,NEW.audit_effective_dt
			,NEW.audit_change_agency_id
			,NEW.coverage_cd
			,NEW.coverage_description
			,NEW.major_lob_cd
			,NEW.acord_lob_cd
			,NEW.acord_sub_lob
			,NEW.coverage_type
			,NEW.personal_commercial
			,NEW.off_dt
			,NEW.off_dt_remarks
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_coverages_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_coverages_i() TO rl_sagitta_x;
GO 
