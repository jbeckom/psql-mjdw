CREATE OR REPLACE FUNCTION sagitta.tr_audit_insurors_d() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_insurors (
		 sagitem 
		,old_audit_staff_cd 
		,old_audit_entry_dt 
		,old_audit_time 
		,old_audit_cd 
		,old_audit_history_record_number 
		,old_audit_program 
		,old_insurer_cd 
		,old_insurer_name 
		,old_payee_cd 
		,old_addr_1 
		,old_addr_2 
		,old_postal_code 
		,old_postal_extension_code 
		,old_city 
		,old_state_prov_cd 
		,old_telephone_1 
		,old_telephone_2 
		,old_group 
		,old_agency_code 
		,old_phone_extension_1_number 
		,old_company_code 
		,old_phone_extension_2_number 
		,old_naic_cd 
		,old_fax_number 
		,old_type 
		,old_obsolete_41 
		,old_date_off 
		,old_date_off_remark 
		,old_email_addr 
		,old_rounding_difference 
		,old_description 
		,old_global 
		,old_am_best_number 
		,old_bests_financial_strength 
		,old_bests_financial_size 
		,old_state_of_domicile 
		,old_amb_company_name 
		,old_amb_parent_number 
		,old_financial_strength_outlook 
		,old_financial_strength_action 
		,old_fein 
		,old_amb_last_update 
		,old_auto_id_claim_reporting_phone_number 
		,old_auto_id_claim_reporting_phone_extension 
		,audit_action 
	)
	SELECT 	 OLD.sagitem 
			,OLD.audit_staff_cd 
			,OLD.audit_entry_dt 
			,OLD.audit_time 
			,OLD.audit_cd 
			,OLD.audit_history_record_number 
			,OLD.audit_program 
			,OLD.insurer_cd 
			,OLD.insurer_name 
			,OLD.payee_cd 
			,OLD.addr_1 
			,OLD.addr_2 
			,OLD.postal_code 
			,OLD.postal_extension_code 
			,OLD.city 
			,OLD.state_prov_cd 
			,OLD.telephone_1 
			,OLD.telephone_2 
			,OLD."group" 
			,OLD.agency_code 
			,OLD.phone_extension_1_number 
			,OLD.company_code 
			,OLD.phone_extension_2_number 
			,OLD.naic_cd 
			,OLD.fax_number 
			,OLD."type" 
			,OLD.obsolete_41 
			,OLD.date_off 
			,OLD.date_off_remark 
			,OLD.email_addr 
			,OLD.rounding_difference 
			,OLD.description 
			,OLD."global" 
			,OLD.am_best_number 
			,OLD.bests_financial_strength 
			,OLD.bests_financial_size 
			,OLD.state_of_domicile 
			,OLD.amb_company_name 
			,OLD.amb_parent_number 
			,OLD.financial_strength_outlook 
			,OLD.financial_strength_action 
			,OLD.fein 
			,OLD.amb_last_update 
			,OLD.auto_id_claim_reporting_phone_number 
			,OLD.auto_id_claim_reporting_phone_extension 
			,'D';
	RETURN OLD;
END;
$$;
GO;

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_insurors_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_insurors_d() TO rl_sagitta_x;
GO 
