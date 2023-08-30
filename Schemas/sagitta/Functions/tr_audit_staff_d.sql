CREATE OR REPLACE FUNCTION sagitta.tr_audit_staff_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_staff (
		 sagitem
		,old_audit_staff_cd
		,old_audit_entry_dt
		,old_audit_time
		,old_audit_cd
		,old_audit_history_record_number
		,old_audit_program
		,old_staff_name
		,old_addr_1
		,old_addr_2
		,old_postal_code
		,old_postal_extension_code
		,old_city
		,old_state_prov_cd
		,old_work_phone_number
		,old_home_phone_number
		,old_dept
		,old_hired_dt
		,old_next_review_dt
		,old_termination_dt
		,old_annual_salary_amt
		,old_division_id
		,old_tax_id
		,old_emergency_phone_number
		,old_title
		,old_birth_dt
		,old_skip_flag
		,old_display_only
		,old_date_off
		,old_date_off_remark
		,old_fax_number
		,old_super_user_id
		,old_agency_cd
		,old_email_addr
		,old_role
		,old_national_producer_number
		,old_service_account
		,old_integration_staff_name
		,old_integration_staff_title
		,old_mobile_phone
		,audit_action
	)
	SELECT 	 OLD.sagitem
			,OLD.audit_staff_cd
			,OLD.audit_entry_dt
			,OLD.audit_time
			,OLD.audit_cd
			,OLD.audit_history_record_number
			,OLD.audit_program
			,OLD.staff_name
			,OLD.addr_1
			,OLD.addr_2
			,OLD.postal_code
			,OLD.postal_extension_code
			,OLD.city
			,OLD.state_prov_cd
			,OLD.work_phone_number
			,OLD.home_phone_number
			,OLD.dept
			,OLD.hired_dt
			,OLD.next_review_dt
			,OLD.termination_dt
			,OLD.annual_salary_amt
			,OLD.division_id
			,OLD.tax_id
			,OLD.emergency_phone_number
			,OLD.title
			,OLD.birth_dt
			,OLD.skip_flag
			,OLD.display_only
			,OLD.date_off
			,OLD.date_off_remark
			,OLD.fax_number
			,OLD.super_user_id
			,OLD.agency_cd
			,OLD.email_addr
			,OLD.role
			,OLD.national_producer_number
			,OLD.service_account
			,OLD.integration_staff_name
			,OLD.integration_staff_title
			,OLD.mobile_phone
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_staff_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_staff_d() TO rl_sagitta_x;
GO 