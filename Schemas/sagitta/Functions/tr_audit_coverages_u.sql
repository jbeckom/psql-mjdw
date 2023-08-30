CREATE OR REPLACE FUNCTION sagitta.tr_audit_coverages_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_coverages (
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
		,old_audit_effective_dt
		,new_audit_effective_dt
		,old_audit_change_agency_id
		,new_audit_change_agency_id
		,old_coverage_cd
		,new_coverage_cd
		,old_coverage_description
		,new_coverage_description
		,old_major_lob_cd
		,new_major_lob_cd
		,old_acord_lob_cd
		,new_acord_lob_cd
		,old_acord_sub_lob
		,new_acord_sub_lob
		,old_coverage_type
		,new_coverage_type
		,old_personal_commercial
		,new_personal_commercial
		,old_off_dt
		,new_off_dt
		,old_off_dt_remarks
		,new_off_dt_remarks
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
			,OLD.audit_effective_dt
			,NEW.audit_effective_dt
			,OLD.audit_change_agency_id
			,NEW.audit_change_agency_id
			,OLD.coverage_cd
			,NEW.coverage_cd
			,OLD.coverage_description
			,NEW.coverage_description
			,OLD.major_lob_cd
			,NEW.major_lob_cd
			,OLD.acord_lob_cd
			,NEW.acord_lob_cd
			,OLD.acord_sub_lob
			,NEW.acord_sub_lob
			,OLD.coverage_type
			,NEW.coverage_type
			,OLD.personal_commercial
			,NEW.personal_commercial
			,OLD.off_dt
			,NEW.off_dt
			,OLD.off_dt_remarks
			,NEW.off_dt_remarks
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_coverages_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_coverages_u() TO rl_sagitta_x;
GO 
