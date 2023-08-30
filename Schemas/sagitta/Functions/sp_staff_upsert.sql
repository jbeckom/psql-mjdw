CREATE OR REPLACE FUNCTION sagitta.sp_staff_upsert(_sagitem varchar(5), _xmldata TEXT)
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;

BEGIN 
	rc := 0;

	WITH xmldata AS (SELECT _xmldata::XML AS exemel)
	INSERT INTO sagitta.staff(
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
	SELECT 	 _sagitem 	AS sagitem
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/AuditInfo/AuditDetail/AuditStaffCd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 				AS audit_staff_cd
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/AuditInfo/AuditDetail/AuditEntryDt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&')::int 			AS audit_entry_dt
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/AuditInfo/AuditDetail/AuditTime/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&')::int 				AS audit_entry_time
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/AuditInfo/AuditDetail/AuditCd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 					AS audit_cd
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/AuditInfo/AuditDetail/AuditHistoryRecordNumber/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 	AS audit_history_record_number 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/AuditInfo/AuditDetail/AuditProgram/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 				AS audit_program
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/StaffName/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 										AS staff_name
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/Addr1/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 											AS addr_1
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/Addr2/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 											AS addr_2
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/PostalCd/PostalCode/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 								AS postal_code
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/PostalCd/PostalExtensionCode/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 					AS postal_extension_code
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/City/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 											AS city
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/StateProvCd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 										AS state_prov_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/WorkPhoneNumber/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 									AS work_phone_number 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/HomePhoneNumber/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 									AS home_phone_number
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/Dept/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 											AS dept
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/HiredDt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 											AS hired_dt 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/NextReviewDt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 									AS next_review_dt 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/TerminationDt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 									AS termination_dt 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/AnnualSalaryAmt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 									AS annual_salary_amt 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/DivisionId/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 										AS division_id
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/TaxId/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 											AS tax_id 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/EmergencyPhoneNumber/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 							AS emergency_phone_number 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/Title/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 											AS title 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/BirthDt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 											AS birth_dt 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/SkipFlag/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 										AS skip_flag 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/DisplayOnly/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 										AS display_only 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/DateOff/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 											AS date_off
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/DateOffRemark/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 									AS date_off_remark 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/FaxNumber/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 										AS fax_number 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/SuperUserId/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 										AS super_user_id
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/AgencyCd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 										AS agency_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/EmailAddr/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 										AS email_addr
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/Role/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 											AS "role"
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/NationalProducerNumber/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 							AS national_producer_number 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/ServiceAccount/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 									AS service_account  
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/IntegrationStaffName/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 							AS integration_staff_name 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/IntegrationStaffTitle/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 							AS integration_staff_title 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/MobilePhone/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 										AS mobile_phone
	FROM 	xmldata
	ON CONFLICT (sagitem) DO UPDATE 
	SET 	 audit_staff_cd                 = excluded.audit_staff_cd
			,audit_entry_dt                 = excluded.audit_entry_dt
			,audit_time                     = excluded.audit_time
			,audit_cd                       = excluded.audit_cd
			,audit_history_record_number    = excluded.audit_history_record_number
			,audit_program                  = excluded.audit_program
			,staff_name                     = excluded.staff_name
			,addr_1                         = excluded.addr_1
			,addr_2                         = excluded.addr_2
			,postal_code                    = excluded.postal_code
			,postal_extension_code          = excluded.postal_extension_code
			,city                           = excluded.city
			,state_prov_cd                  = excluded.state_prov_cd
			,work_phone_number              = excluded.work_phone_number
			,home_phone_number              = excluded.home_phone_number
			,dept                           = excluded.dept
			,hired_dt                       = excluded.hired_dt
			,next_review_dt                 = excluded.next_review_dt
			,termination_dt                 = excluded.termination_dt
			,annual_salary_amt              = excluded.annual_salary_amt
			,division_id                    = excluded.division_id
			,tax_id                         = excluded.tax_id
			,emergency_phone_number         = excluded.emergency_phone_number
			,title                          = excluded.title
			,birth_dt                       = excluded.birth_dt
			,skip_flag                      = excluded.skip_flag
			,display_only                   = excluded.display_only
			,date_off                       = excluded.date_off
			,date_off_remark                = excluded.date_off_remark
			,fax_number                     = excluded.fax_number
			,super_user_id                  = excluded.super_user_id
			,agency_cd                      = excluded.agency_cd
			,email_addr                     = excluded.email_addr
			,"role"                         = excluded."role"
			,national_producer_number       = excluded.national_producer_number
			,service_account                = excluded.service_account
			,integration_staff_name         = excluded.integration_staff_name
			,integration_staff_title        = excluded.integration_staff_title
			,mobile_phone                   = excluded.mobile_phone
			,modify_dt 						= timezone('utc'::TEXT, clock_timestamp())
	WHERE 	(staff.audit_staff_cd,staff.audit_entry_dt,staff.audit_time,staff.audit_cd,staff.audit_history_record_number,staff.audit_program,staff.staff_name,staff.addr_1,staff.addr_2,staff.postal_code,staff.postal_extension_code,staff.city,staff.state_prov_cd,staff.work_phone_number,staff.home_phone_number,staff.dept,staff.hired_dt,staff.next_review_dt,staff.termination_dt,staff.annual_salary_amt,staff.division_id,staff.tax_id,staff.emergency_phone_number,staff.title,staff.birth_dt,staff.skip_flag,staff.display_only,staff.date_off,staff.date_off_remark,staff.fax_number,staff.super_user_id,staff.agency_cd,staff.email_addr,staff."role",staff.national_producer_number,staff.service_account,staff.integration_staff_name,staff.integration_staff_title,staff.mobile_phone)
		IS DISTINCT FROM 	(excluded.audit_staff_cd,excluded.audit_entry_dt,excluded.audit_time,excluded.audit_cd,excluded.audit_history_record_number,excluded.audit_program,excluded.staff_name,excluded.addr_1,excluded.addr_2,excluded.postal_code,excluded.postal_extension_code,excluded.city,excluded.state_prov_cd,excluded.work_phone_number,excluded.home_phone_number,excluded.dept,excluded.hired_dt,excluded.next_review_dt,excluded.termination_dt,excluded.annual_salary_amt,excluded.division_id,excluded.tax_id,excluded.emergency_phone_number,excluded.title,excluded.birth_dt,excluded.skip_flag,excluded.display_only,excluded.date_off,excluded.date_off_remark,excluded.fax_number,excluded.super_user_id,excluded.agency_cd,excluded.email_addr,excluded."role",excluded.national_producer_number,excluded.service_account,excluded.integration_staff_name,excluded.integration_staff_title,excluded.mobile_phone);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_staff_upsert(varchar, TEXT) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_staff_upsert(varchar, text) TO rl_sagitta_x;
GO 
