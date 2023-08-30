ALTER TABLE sagitta.staff 
	DROP COLUMN IF EXISTS modify_dt;
GO 	

ALTER TABLE sagitta.audit_staff 
	 DROP COLUMN IF EXISTS old_modify_dt
	,DROP COLUMN IF EXISTS new_modify_dt;
GO 

ALTER TABLE sagitta.staff_commission_group 
	DROP COLUMN IF EXISTS modify_dt;
GO 

ALTER TABLE sagitta.audit_staff_commission_group 
	 DROP COLUMN IF EXISTS old_modify_dt
	,DROP COLUMN IF EXISTS new_modify_dt;
GO 

DROP FUNCTION IF EXISTS sagitta.sp_staff_upsert(varchar, text);
GO 

DROP FUNCTION IF EXISTS sagitta.sp_staff_commission_group_delete(varchar);
GO 

DROP FUNCTION IF EXISTS sagitta.sp_staff_commission_group_upsert(varchar, int, text);
GO 

CREATE OR REPLACE FUNCTION sagitta.sp_staff_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.staff (
		 sagitem
		,audit_staff_cd
		,audit_entry_dt
		,audit_time
		,audit_cd
		,audit_history_record_number
		,audit_program
		,staff_name
		,addr_1
		,addr_2
		,postal_code
		,postal_extension_code
		,city
		,state_prov_cd
		,work_phone_number
		,home_phone_number
		,dept
		,hired_dt
		,next_review_dt
		,termination_dt
		,annual_salary_amt
		,division_id
		,tax_id
		,emergency_phone_number
		,title
		,birth_dt
		,skip_flag
		,display_only
		,date_off
		,date_off_remark
		,fax_number
		,super_user_id
		,agency_cd
		,email_addr
		,"role"
		,national_producer_number
		,service_account
		,integration_staff_name
		,integration_staff_title
		,mobile_phone
	)
	SELECT 	 sagitem
			,audit_staff_cd
			,audit_entry_dt
			,audit_time
			,audit_cd
			,audit_history_record_number
			,audit_program
			,staff_name
			,addr_1
			,addr_2
			,postal_code
			,postal_extension_code
			,city
			,state_prov_cd
			,work_phone_number
			,home_phone_number
			,dept
			,hired_dt
			,next_review_dt
			,termination_dt
			,annual_salary_amt
			,division_id
			,tax_id
			,emergency_phone_number
			,title
			,birth_dt
			,skip_flag
			,display_only
			,date_off
			,date_off_remark
			,fax_number
			,super_user_id
			,agency_cd
			,email_addr
			,"role"
			,national_producer_number
			,service_account
			,integration_staff_name
			,integration_staff_title
			,mobile_phone
	FROM 	sagitta.stg_staff 
	ON CONFLICT (sagitem) DO UPDATE 
	SET 	 audit_staff_cd 				= excluded.audit_staff_cd
			,audit_entry_dt 				= excluded.audit_entry_dt
			,audit_time 					= excluded.audit_time
			,audit_cd 						= excluded.audit_cd
			,audit_history_record_number 	= excluded.audit_history_record_number
			,audit_program 					= excluded.audit_program
			,staff_name 					= excluded.staff_name
			,addr_1 						= excluded.addr_1
			,addr_2 						= excluded.addr_2
			,postal_code 					= excluded.postal_code
			,postal_extension_code 			= excluded.postal_extension_code
			,city 							= excluded.city
			,state_prov_cd 					= excluded.state_prov_cd
			,work_phone_number 				= excluded.work_phone_number
			,home_phone_number 				= excluded.home_phone_number
			,dept 							= excluded.dept
			,hired_dt 						= excluded.hired_dt
			,next_review_dt 				= excluded.next_review_dt
			,termination_dt 				= excluded.termination_dt
			,annual_salary_amt 				= excluded.annual_salary_amt
			,division_id 					= excluded.division_id
			,tax_id 						= excluded.tax_id
			,emergency_phone_number 		= excluded.emergency_phone_number
			,title 							= excluded.title
			,birth_dt 						= excluded.birth_dt
			,skip_flag 						= excluded.skip_flag
			,display_only 					= excluded.display_only
			,date_off 						= excluded.date_off
			,date_off_remark 				= excluded.date_off_remark
			,fax_number 					= excluded.fax_number
			,super_user_id 					= excluded.super_user_id
			,agency_cd 						= excluded.agency_cd
			,email_addr 					= excluded.email_addr
			,"role" 						= excluded."role"
			,national_producer_number 		= excluded.national_producer_number
			,service_account 				= excluded.service_account
			,integration_staff_name 		= excluded.integration_staff_name
			,integration_staff_title 		= excluded.integration_staff_title
			,mobile_phone 					= excluded.mobile_phone
	WHERE 	(staff.audit_staff_cd,staff.audit_entry_dt,staff.audit_time,staff.audit_cd,staff.audit_history_record_number,staff.audit_program,staff.staff_name,staff.addr_1,staff.addr_2,staff.postal_code,staff.postal_extension_code,staff.city,staff.state_prov_cd,staff.work_phone_number,staff.home_phone_number,staff.dept,staff.hired_dt,staff.next_review_dt,staff.termination_dt,staff.annual_salary_amt,staff.division_id,staff.tax_id,staff.emergency_phone_number,staff.title,staff.birth_dt,staff.skip_flag,staff.display_only,staff.date_off,staff.date_off_remark,staff.fax_number,staff.super_user_id,staff.agency_cd,staff.email_addr,staff."role",staff.national_producer_number,staff.service_account,staff.integration_staff_name,staff.integration_staff_title,staff.mobile_phone) 
		IS DISTINCT FROM 	(excluded.audit_staff_cd,excluded.audit_entry_dt,excluded.audit_time,excluded.audit_cd,excluded.audit_history_record_number,excluded.audit_program,excluded.staff_name,excluded.addr_1,excluded.addr_2,excluded.postal_code,excluded.postal_extension_code,excluded.city,excluded.state_prov_cd,excluded.work_phone_number,excluded.home_phone_number,excluded.dept,excluded.hired_dt,excluded.next_review_dt,excluded.termination_dt,excluded.annual_salary_amt,excluded.division_id,excluded.tax_id,excluded.emergency_phone_number,excluded.title,excluded.birth_dt,excluded.skip_flag,excluded.display_only,excluded.date_off,excluded.date_off_remark,excluded.fax_number,excluded.super_user_id,excluded.agency_cd,excluded.email_addr,excluded."role",excluded.national_producer_number,excluded.service_account,excluded.integration_staff_name,excluded.integration_staff_title,excluded.mobile_phone);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_staff_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_staff_upsert() TO rl_sagitta_x;
GO 




CREATE OR REPLACE FUNCTION sagitta.sp_staff_commission_group_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.staff_commission_group (
		sagitem
		,lis
		,standard_commission
		,"type"
		,insurer_id
		,coverage_cd
		,from_amt
		,to_amt
		,ab_new_comm_percentage
		,ab_renewal_comm_percentage
		,cb_new_comm_percentage
		,cb_renew_comm_percentage
		,start_dt
		,end_dt
		,comm_div
		,comm_dept
	)
	SELECT 	 sagitem
			,lis
			,standard_commission
			,"type"
			,insurer_id
			,coverage_cd
			,from_amt
			,to_amt
			,ab_new_comm_percentage
			,ab_renewal_comm_percentage
			,cb_new_comm_percentage
			,cb_renew_comm_percentage
			,start_dt
			,end_dt
			,comm_div
			,comm_dept
	FROM 	sagitta.stg_staff_commission_group 
	ON CONFLICT (sagitem, lis) DO UPDATE 
	SET 	 standard_commission 			= excluded.standard_commission
			,"type" 						= excluded."type"
			,insurer_id 					= excluded.insurer_id
			,coverage_cd 					= excluded.coverage_cd
			,from_amt 						= excluded.from_amt
			,to_amt 						= excluded.to_amt
			,ab_new_comm_percentage 		= excluded.ab_new_comm_percentage
			,ab_renewal_comm_percentage 	= excluded.ab_renewal_comm_percentage
			,cb_new_comm_percentage 		= excluded.cb_new_comm_percentage
			,cb_renew_comm_percentage 		= excluded.cb_renew_comm_percentage
			,start_dt 						= excluded.start_dt
			,end_dt 						= excluded.end_dt
			,comm_div 						= excluded.comm_div
			,comm_dept 						= excluded.comm_dept 
	WHERE 	(staff_commission_group.standard_commission,staff_commission_group."type",staff_commission_group.insurer_id,staff_commission_group.coverage_cd,staff_commission_group.from_amt,staff_commission_group.to_amt,staff_commission_group.ab_new_comm_percentage,staff_commission_group.ab_renewal_comm_percentage,staff_commission_group.cb_new_comm_percentage,staff_commission_group.cb_renew_comm_percentage,staff_commission_group.start_dt,staff_commission_group.end_dt,staff_commission_group.comm_div,staff_commission_group.comm_dept) 
		IS DISTINCT FROM 	(excluded.standard_commission,excluded."type",excluded.insurer_id,excluded.coverage_cd,excluded.from_amt,excluded.to_amt,excluded.ab_new_comm_percentage,excluded.ab_renewal_comm_percentage,excluded.cb_new_comm_percentage,excluded.cb_renew_comm_percentage,excluded.start_dt,excluded.end_dt,excluded.comm_div,excluded.comm_dept);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_staff_commission_group_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_staff_commission_group_upsert() TO rl_sagitta_x;
GO 
