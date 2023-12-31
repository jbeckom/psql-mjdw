CREATE OR REPLACE FUNCTION sagitta.tr_audit_clients_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_clients(
		 sagitem 
		,new_audit_staff_cd 
		,new_audit_entry_dt 
		,new_audit_time 
		,new_audit_cd 
		,new_audit_history_record_number 
		,new_audit_program 
		,new_audit_effective_dt 
		,new_audit_change_agency_id 
		,new_client_cd 
		,new_client_name 
		,new_bill_to_code 
		,new_addr_1 
		,new_addr_2 
		,new_postal_code 
		,new_postal_extension_code 
		,new_city 
		,new_state_prov_cd 
		,new_phone_1_number 
		,new_phone_2_number 
		,new_reference_cd 
		,new_status_cd 
		,new_producer_1_cd 
		,new_producer_2_cd 
		,new_producer_3_cd 
		,new_servicer_1_cd 
		,new_servicer_2_cd 
		,new_servicer_3_cd 
		,new_credit_terms 
		,new_source_cd 
		,new_source_dt 
		,new_cat_1_cd 
		,new_cat_2_cd 
		,new_cat_3_cd 
		,new_cat_4_cd 
		,new_cat_5_cd 
		,new_net_commission_pct 
		,new_contact_method 
		,new_sic_cd 
		,new_collection_comments 
		,new_remark_text 
		,new_phone_1_extension_number 
		,new_phone_2_extension_number 
		,new_fax_number 
		,new_pro_sus_cd 
		,new_date_business_started 
		,new_business_nature 
		,new_inspection_contact 
		,new_inspection_phone_number 
		,new_inspection_phone_extension_number 
		,new_accounting_contact 
		,new_accounting_phone_number 
		,new_accounting_phone_extension_number 
		,new_legal_entity_cd 
		,new_email_addr 
		,new_web_site_link 
		,new_division_number 
		,new_parent_client 
		,new_parent_rel_cd 
		,new_relation_client 
		,new_relation_cd 
		,new_fein 
		,new_insp_email 
		,new_acct_email 
		,new_no_members 
		,new_integration_client_name 
		,audit_action 
	)
	SELECT 	 new.sagitem
			,new.audit_staff_cd 
			,new.audit_entry_dt 
			,new.audit_time 
			,new.audit_cd 
			,new.audit_history_record_number 
			,new.audit_program 
			,new.audit_effective_dt 
			,new.audit_change_agency_id 
			,new.client_cd 
			,new.client_name 
			,new.bill_to_code 
			,new.addr_1 
			,new.addr_2 
			,new.postal_code 
			,new.postal_extension_code 
			,new.city 
			,new.state_prov_cd 
			,new.phone_1_number 
			,new.phone_2_number 
			,new.reference_cd 
			,new.status_cd 
			,new.producer_1_cd 
			,new.producer_2_cd 
			,new.producer_3_cd 
			,new.servicer_1_cd 
			,new.servicer_2_cd 
			,new.servicer_3_cd 
			,new.credit_terms 
			,new.source_cd 
			,new.source_dt 
			,new.cat_1_cd 
			,new.cat_2_cd 
			,new.cat_3_cd 
			,new.cat_4_cd 
			,new.cat_5_cd 
			,new.net_commission_pct 
			,new.contact_method 
			,new.sic_cd 
			,new.collection_comments 
			,new.remark_text 
			,new.phone_1_extension_number 
			,new.phone_2_extension_number 
			,new.fax_number 
			,new.pro_sus_cd 
			,new.date_business_started 
			,new.business_nature 
			,new.inspection_contact 
			,new.inspection_phone_number 
			,new.inspection_phone_extension_number 
			,new.accounting_contact 
			,new.accounting_phone_number 
			,new.accounting_phone_extension_number 
			,new.legal_entity_cd 
			,new.email_addr 
			,new.web_site_link 
			,new.division_number 
			,new.parent_client 
			,new.parent_rel_cd 
			,new.relation_client 
			,new.relation_cd 
			,new.fein 
			,new.insp_email 
			,new.acct_email 
			,new.no_members 
			,new.integration_client_name 
			,'I';
	RETURN new;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_clients_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_clients_i() TO rl_sagitta_x;
GO 
