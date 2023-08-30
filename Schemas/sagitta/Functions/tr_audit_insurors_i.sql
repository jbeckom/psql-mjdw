CREATE OR REPLACE FUNCTION sagitta.tr_audit_insurors_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_insurors (
		 sagitem 
		,new_audit_staff_cd 
		,new_audit_entry_dt 
		,new_audit_time 
		,new_audit_cd 
		,new_audit_history_record_number 
		,new_audit_program 
		,new_insurer_cd 
		,new_insurer_name 
		,new_payee_cd 
		,new_addr_1 
		,new_addr_2 
		,new_postal_code 
		,new_postal_extension_code 
		,new_city 
		,new_state_prov_cd 
		,new_telephone_1 
		,new_telephone_2 
		,new_group 
		,new_agency_code 
		,new_phone_extension_1_number 
		,new_company_code 
		,new_phone_extension_2_number 
		,new_naic_cd 
		,new_fax_number 
		,new_type 
		,new_obsolete_41 
		,new_date_off 
		,new_date_off_remark 
		,new_email_addr 
		,new_rounding_difference 
		,new_description 
		,new_global 
		,new_am_best_number 
		,new_bests_financial_strength 
		,new_bests_financial_size 
		,new_state_of_domicile 
		,new_amb_company_name 
		,new_amb_parent_number 
		,new_financial_strength_outlook 
		,new_financial_strength_action 
		,new_fein 
		,new_amb_last_update 
		,new_auto_id_claim_reporting_phone_number 
		,new_auto_id_claim_reporting_phone_extension 
		,audit_action 
	)
	SELECT 	 NEW.sagitem 
			,NEW.audit_staff_cd 
			,NEW.audit_entry_dt 
			,NEW.audit_time 
			,NEW.audit_cd 
			,NEW.audit_history_record_number 
			,NEW.audit_program 
			,NEW.insurer_cd 
			,NEW.insurer_name 
			,NEW.payee_cd 
			,NEW.addr_1 
			,NEW.addr_2 
			,NEW.postal_code 
			,NEW.postal_extension_code 
			,NEW.city 
			,NEW.state_prov_cd 
			,NEW.telephone_1 
			,NEW.telephone_2 
			,NEW."group" 
			,NEW.agency_code 
			,NEW.phone_extension_1_number 
			,NEW.company_code 
			,NEW.phone_extension_2_number 
			,NEW.naic_cd 
			,NEW.fax_number 
			,NEW."type" 
			,NEW.obsolete_41 
			,NEW.date_off 
			,NEW.date_off_remark 
			,NEW.email_addr 
			,NEW.rounding_difference 
			,NEW.description 
			,NEW."global" 
			,NEW.am_best_number 
			,NEW.bests_financial_strength 
			,NEW.bests_financial_size 
			,NEW.state_of_domicile 
			,NEW.amb_company_name 
			,NEW.amb_parent_number 
			,NEW.financial_strength_outlook 
			,NEW.financial_strength_action 
			,NEW.fein 
			,NEW.amb_last_update 
			,NEW.auto_id_claim_reporting_phone_number 
			,NEW.auto_id_claim_reporting_phone_extension 
			,'I';
	RETURN NEW;
END;
$$;
GO;

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_insurors_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_insurors_i() TO rl_sagitta_x;
GO 
