CREATE OR REPLACE FUNCTION sagitta.tr_audit_staff_i ()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_staff (
		 sagitem
		,new_audit_staff_cd
		,new_audit_entry_dt
		,new_audit_time
		,new_audit_cd
		,new_audit_history_record_number
		,new_audit_program
		,new_staff_name
		,new_addr_1
		,new_addr_2
		,new_postal_code
		,new_postal_extension_code
		,new_city
		,new_state_prov_cd
		,new_work_phone_number
		,new_home_phone_number
		,new_dept
		,new_hired_dt
		,new_next_review_dt
		,new_termination_dt
		,new_annual_salary_amt
		,new_division_id
		,new_tax_id
		,new_emergency_phone_number
		,new_title
		,new_birth_dt
		,new_skip_flag
		,new_display_only
		,new_date_off
		,new_date_off_remark
		,new_fax_number
		,new_super_user_id
		,new_agency_cd
		,new_email_addr
		,new_role
		,new_national_producer_number
		,new_service_account
		,new_integration_staff_name
		,new_integration_staff_title
		,new_mobile_phone
		,audit_action
	)
	SELECT 	 NEW.sagitem
			,NEW.audit_staff_cd
			,NEW.audit_entry_dt
			,NEW.audit_time
			,NEW.audit_cd
			,NEW.audit_history_record_number
			,NEW.audit_program
			,NEW.staff_name
			,NEW.addr_1
			,NEW.addr_2
			,NEW.postal_code
			,NEW.postal_extension_code
			,NEW.city
			,NEW.state_prov_cd
			,NEW.work_phone_number
			,NEW.home_phone_number
			,NEW.dept
			,NEW.hired_dt
			,NEW.next_review_dt
			,NEW.termination_dt
			,NEW.annual_salary_amt
			,NEW.division_id
			,NEW.tax_id
			,NEW.emergency_phone_number
			,NEW.title
			,NEW.birth_dt
			,NEW.skip_flag
			,NEW.display_only
			,NEW.date_off
			,NEW.date_off_remark
			,NEW.fax_number
			,NEW.super_user_id
			,NEW.agency_cd
			,NEW.email_addr
			,NEW.role
			,NEW.national_producer_number
			,NEW.service_account
			,NEW.integration_staff_name
			,NEW.integration_staff_title
			,NEW.mobile_phone
			,'I';
	RETURN NEW;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_staff_i() OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_staff_i() TO rl_sagitta_x;
GO 