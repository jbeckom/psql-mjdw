CREATE OR REPLACE FUNCTION sagitta.tr_audit_coverages_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_coverages (
		 sagitem
		,old_audit_staff_cd
		,old_audit_entry_dt
		,old_audit_time
		,old_audit_cd
		,old_audit_history_record_number
		,old_audit_program
		,old_audit_effective_dt
		,old_audit_change_agency_id
		,old_coverage_cd
		,old_coverage_description
		,old_major_lob_cd
		,old_acord_lob_cd
		,old_acord_sub_lob
		,old_coverage_type
		,old_personal_commercial
		,old_off_dt
		,old_off_dt_remarks
		,audit_action
	)
	SELECT 	 OLD.sagitem
			,OLD.audit_staff_cd
			,OLD.audit_entry_dt
			,OLD.audit_time
			,OLD.audit_cd
			,OLD.audit_history_record_number
			,OLD.audit_program
			,OLD.audit_effective_dt
			,OLD.audit_change_agency_id
			,OLD.coverage_cd
			,OLD.coverage_description
			,OLD.major_lob_cd
			,OLD.acord_lob_cd
			,OLD.acord_sub_lob
			,OLD.coverage_type
			,OLD.personal_commercial
			,OLD.off_dt
			,OLD.off_dt_remarks
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_coverages_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_coverages_d() TO rl_sagitta_x;
GO 
