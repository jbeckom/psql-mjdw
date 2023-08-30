CREATE OR REPLACE FUNCTION sagitta.tr_audit_staff_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_staff (
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
		,old_staff_name
		,new_staff_name
		,old_addr_1
		,new_addr_1
		,old_addr_2
		,new_addr_2
		,old_postal_code
		,new_postal_code
		,old_postal_extension_code
		,new_postal_extension_code
		,old_city
		,new_city
		,old_state_prov_cd
		,new_state_prov_cd
		,old_work_phone_number
		,new_work_phone_number
		,old_home_phone_number
		,new_home_phone_number
		,old_dept
		,new_dept
		,old_hired_dt
		,new_hired_dt
		,old_next_review_dt
		,new_next_review_dt
		,old_termination_dt
		,new_termination_dt
		,old_annual_salary_amt
		,new_annual_salary_amt
		,old_division_id
		,new_division_id
		,old_tax_id
		,new_tax_id
		,old_emergency_phone_number
		,new_emergency_phone_number
		,old_title
		,new_title
		,old_birth_dt
		,new_birth_dt
		,old_skip_flag
		,new_skip_flag
		,old_display_only
		,new_display_only
		,old_date_off
		,new_date_off
		,old_date_off_remark
		,new_date_off_remark
		,old_fax_number
		,new_fax_number
		,old_super_user_id
		,new_super_user_id
		,old_agency_cd
		,new_agency_cd
		,old_email_addr
		,new_email_addr
		,old_role
		,new_role
		,old_national_producer_number
		,new_national_producer_number
		,old_service_account
		,new_service_account
		,old_integration_staff_name
		,new_integration_staff_name
		,old_integration_staff_title
		,new_integration_staff_title
		,old_mobile_phone
		,new_mobile_phone
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
			,OLD.staff_name
			,NEW.staff_name
			,OLD.addr_1
			,NEW.addr_1
			,OLD.addr_2
			,NEW.addr_2
			,OLD.postal_code
			,NEW.postal_code
			,OLD.postal_extension_code
			,NEW.postal_extension_code
			,OLD.city
			,NEW.city
			,OLD.state_prov_cd
			,NEW.state_prov_cd
			,OLD.work_phone_number
			,NEW.work_phone_number
			,OLD.home_phone_number
			,NEW.home_phone_number
			,OLD.dept
			,NEW.dept
			,OLD.hired_dt
			,NEW.hired_dt
			,OLD.next_review_dt
			,NEW.next_review_dt
			,OLD.termination_dt
			,NEW.termination_dt
			,OLD.annual_salary_amt
			,NEW.annual_salary_amt
			,OLD.division_id
			,NEW.division_id
			,OLD.tax_id
			,NEW.tax_id
			,OLD.emergency_phone_number
			,NEW.emergency_phone_number
			,OLD.title
			,NEW.title
			,OLD.birth_dt
			,NEW.birth_dt
			,OLD.skip_flag
			,NEW.skip_flag
			,OLD.display_only
			,NEW.display_only
			,OLD.date_off
			,NEW.date_off
			,OLD.date_off_remark
			,NEW.date_off_remark
			,OLD.fax_number
			,NEW.fax_number
			,OLD.super_user_id
			,NEW.super_user_id
			,OLD.agency_cd
			,NEW.agency_cd
			,OLD.email_addr
			,NEW.email_addr
			,OLD.role
			,NEW.role
			,OLD.national_producer_number
			,NEW.national_producer_number
			,OLD.service_account
			,NEW.service_account
			,OLD.integration_staff_name
			,NEW.integration_staff_name
			,OLD.integration_staff_title
			,NEW.integration_staff_title
			,OLD.mobile_phone
			,NEW.mobile_phone
			,'U';
	RETURN OLD;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_staff_u() OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_staff_u() TO rl_sagitta_x;
GO 
