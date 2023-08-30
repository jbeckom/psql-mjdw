CREATE OR REPLACE FUNCTION sagitta.sp_insurors_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.insurors (
		 sagitem 
		,audit_staff_cd 
		,audit_entry_dt 
		,audit_time 
		,audit_cd 
		,audit_history_record_number 
		,audit_program 
		,insurer_cd 
		,insurer_name 
		,payee_cd 
		,addr_1 
		,addr_2 
		,postal_code 
		,postal_extension_code 
		,city 
		,state_prov_cd 
		,telephone_1 
		,telephone_2 
		,"group" 
		,agency_code 
		,phone_extension_1_number 
		,company_code 
		,phone_extension_2_number 
		,naic_cd 
		,fax_number 
		,"type" 
		,obsolete_41 
		,date_off 
		,date_off_remark 
		,email_addr 
		,rounding_difference 
		,description 
		,"global" 
		,am_best_number 
		,bests_financial_strength 
		,bests_financial_size 
		,state_of_domicile 
		,amb_company_name 
		,amb_parent_number 
		,financial_strength_outlook 
		,financial_strength_action 
		,fein 
		,amb_last_update 
		,auto_id_claim_reporting_phone_number 
		,auto_id_claim_reporting_phone_extension 
	)
	SELECT 	 sagitem 
			,audit_staff_cd 
			,audit_entry_dt::int 
			,audit_time::int 
			,audit_cd 
			,audit_history_record_number 
			,audit_program 
			,insurer_cd 
			,insurer_name 
			,payee_cd 
			,addr_1 
			,addr_2 
			,postal_code 
			,postal_extension_code 
			,city 
			,state_prov_cd 
			,telephone_1 
			,telephone_2 
			,"group" 
			,agency_code 
			,phone_extension_1_number 
			,company_code 
			,phone_extension_2_number 
			,naic_cd 
			,fax_number 
			,"type" 
			,obsolete_41 
			,date_off 
			,date_off_remark 
			,email_addr 
			,rounding_difference 
			,description 
			,"global" 
			,am_best_number 
			,bests_financial_strength 
			,bests_financial_size 
			,state_of_domicile 
			,amb_company_name 
			,amb_parent_number 
			,financial_strength_outlook 
			,financial_strength_action 
			,fein 
			,amb_last_update 
			,auto_id_claim_reporting_phone_number 
			,auto_id_claim_reporting_phone_extension 
	FROM 	sagitta.stg_insurors
	ON CONFLICT (sagitem) DO UPDATE 
	SET  audit_staff_cd 							= excluded.audit_staff_cd 
		,audit_entry_dt 							= excluded.audit_entry_dt 
		,audit_time 								= excluded.audit_time 
		,audit_cd 									= excluded.audit_cd 
		,audit_history_record_number 				= excluded.audit_history_record_number 
		,audit_program 								= excluded.audit_program 
		,insurer_cd 								= excluded.insurer_cd 
		,insurer_name 								= excluded.insurer_name 
		,payee_cd 									= excluded.payee_cd 
		,addr_1 									= excluded.addr_1 
		,addr_2 									= excluded.addr_2 
		,postal_code 								= excluded.postal_code 
		,postal_extension_code 						= excluded.postal_extension_code 
		,city 										= excluded.city 
		,state_prov_cd 								= excluded.state_prov_cd 
		,telephone_1 								= excluded.telephone_1 
		,telephone_2 								= excluded.telephone_2 
		,"group" 									= excluded."group" 
		,agency_code 								= excluded.agency_code 
		,phone_extension_1_number 					= excluded.phone_extension_1_number 
		,company_code 								= excluded.company_code 
		,phone_extension_2_number 					= excluded.phone_extension_2_number 
		,naic_cd 									= excluded.naic_cd 
		,fax_number 								= excluded.fax_number 
		,"type" 									= excluded."type" 
		,obsolete_41 								= excluded.obsolete_41 
		,date_off 									= excluded.date_off 
		,date_off_remark 							= excluded.date_off_remark 
		,email_addr 								= excluded.email_addr 
		,rounding_difference 						= excluded.rounding_difference 
		,description 								= excluded.description 
		,"global" 									= excluded."global" 
		,am_best_number 							= excluded.am_best_number 
		,bests_financial_strength 					= excluded.bests_financial_strength 
		,bests_financial_size 						= excluded.bests_financial_size 
		,state_of_domicile 							= excluded.state_of_domicile 
		,amb_company_name 							= excluded.amb_company_name 
		,amb_parent_number 							= excluded.amb_parent_number 
		,financial_strength_outlook 				= excluded.financial_strength_outlook 
		,financial_strength_action 					= excluded.financial_strength_action 
		,fein 										= excluded.fein 
		,amb_last_update 							= excluded.amb_last_update 
		,auto_id_claim_reporting_phone_number 		= excluded.auto_id_claim_reporting_phone_number 
		,auto_id_claim_reporting_phone_extension 	= excluded.auto_id_claim_reporting_phone_extension 
	WHERE 	(insurors.audit_staff_cd,insurors.audit_entry_dt,insurors.audit_time,insurors.audit_cd,insurors.audit_history_record_number,insurors.audit_program,insurors.insurer_cd,insurors.insurer_name,insurors.payee_cd,insurors.addr_1,insurors.addr_2,insurors.postal_code,insurors.postal_extension_code,insurors.city,insurors.state_prov_cd,insurors.telephone_1,insurors.telephone_2,insurors."group",insurors.agency_code,insurors.phone_extension_1_number,insurors.company_code,insurors.phone_extension_2_number,insurors.naic_cd,insurors.fax_number,insurors."type",insurors.obsolete_41,insurors.date_off,insurors.date_off_remark,insurors.email_addr,insurors.rounding_difference,insurors.description,insurors."global",insurors.am_best_number,insurors.bests_financial_strength,insurors.bests_financial_size,insurors.state_of_domicile,insurors.amb_company_name,insurors.amb_parent_number,insurors.financial_strength_outlook,insurors.financial_strength_action,insurors.fein,insurors.amb_last_update,insurors.auto_id_claim_reporting_phone_number,insurors.auto_id_claim_reporting_phone_extension) 
		IS DISTINCT FROM 	(excluded.audit_staff_cd,excluded.audit_entry_dt,excluded.audit_time,excluded.audit_cd,excluded.audit_history_record_number,excluded.audit_program,excluded.insurer_cd,excluded.insurer_name,excluded.payee_cd,excluded.addr_1,excluded.addr_2,excluded.postal_code,excluded.postal_extension_code,excluded.city,excluded.state_prov_cd,excluded.telephone_1,excluded.telephone_2,excluded."group",excluded.agency_code,excluded.phone_extension_1_number,excluded.company_code,excluded.phone_extension_2_number,excluded.naic_cd,excluded.fax_number,excluded."type",excluded.obsolete_41,excluded.date_off,excluded.date_off_remark,excluded.email_addr,excluded.rounding_difference,excluded.description,excluded."global",excluded.am_best_number,excluded.bests_financial_strength,excluded.bests_financial_size,excluded.state_of_domicile,excluded.amb_company_name,excluded.amb_parent_number,excluded.financial_strength_outlook,excluded.financial_strength_action,excluded.fein,excluded.amb_last_update,excluded.auto_id_claim_reporting_phone_number,excluded.auto_id_claim_reporting_phone_extension); 
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO;

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_insurors_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_insurors_upsert() TO rl_sagitta_x;
GO 