CREATE OR REPLACE FUNCTION sagitta.tr_audit_clients_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_clients(
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
		,old_audit_effective_dt 
		,new_audit_effective_dt 
		,old_audit_change_agency_id 
		,new_audit_change_agency_id 
		,old_client_cd 
		,new_client_cd 
		,old_client_name 
		,new_client_name 
		,old_bill_to_code 
		,new_bill_to_code 
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
		,old_phone_1_number 
		,new_phone_1_number 
		,old_phone_2_number 
		,new_phone_2_number 
		,old_reference_cd 
		,new_reference_cd 
		,old_status_cd 
		,new_status_cd 
		,old_producer_1_cd 
		,new_producer_1_cd 
		,old_producer_2_cd 
		,new_producer_2_cd 
		,old_producer_3_cd 
		,new_producer_3_cd 
		,old_servicer_1_cd 
		,new_servicer_1_cd 
		,old_servicer_2_cd 
		,new_servicer_2_cd 
		,old_servicer_3_cd 
		,new_servicer_3_cd 
		,old_credit_terms 
		,new_credit_terms 
		,old_source_cd 
		,new_source_cd 
		,old_source_dt 
		,new_source_dt 
		,old_cat_1_cd 
		,new_cat_1_cd 
		,old_cat_2_cd 
		,new_cat_2_cd 
		,old_cat_3_cd 
		,new_cat_3_cd 
		,old_cat_4_cd 
		,new_cat_4_cd 
		,old_cat_5_cd 
		,new_cat_5_cd 
		,old_net_commission_pct 
		,new_net_commission_pct 
		,old_contact_method 
		,new_contact_method 
		,old_sic_cd 
		,new_sic_cd 
		,old_collection_comments 
		,new_collection_comments 
		,old_remark_text 
		,new_remark_text 
		,old_phone_1_extension_number 
		,new_phone_1_extension_number 
		,old_phone_2_extension_number 
		,new_phone_2_extension_number 
		,old_fax_number 
		,new_fax_number 
		,old_pro_sus_cd 
		,new_pro_sus_cd 
		,old_date_business_started 
		,new_date_business_started 
		,old_business_nature 
		,new_business_nature 
		,old_inspection_contact 
		,new_inspection_contact 
		,old_inspection_phone_number 
		,new_inspection_phone_number 
		,old_inspection_phone_extension_number 
		,new_inspection_phone_extension_number 
		,old_accounting_contact 
		,new_accounting_contact 
		,old_accounting_phone_number 
		,new_accounting_phone_number 
		,old_accounting_phone_extension_number 
		,new_accounting_phone_extension_number 
		,old_legal_entity_cd 
		,new_legal_entity_cd 
		,old_email_addr 
		,new_email_addr 
		,old_web_site_link 
		,new_web_site_link 
		,old_division_number 
		,new_division_number 
		,old_parent_client 
		,new_parent_client 
		,old_parent_rel_cd 
		,new_parent_rel_cd 
		,old_relation_client 
		,new_relation_client 
		,old_relation_cd 
		,new_relation_cd 
		,old_fein 
		,new_fein 
		,old_insp_email 
		,new_insp_email 
		,old_acct_email 
		,new_acct_email 
		,old_no_members 
		,new_no_members 
		,old_integration_client_name 
		,new_integration_client_name 
		,audit_action 
	)
	SELECT 	 old.sagitem
			,old.audit_staff_cd 
			,new.audit_staff_cd 
			,old.audit_entry_dt 
			,new.audit_entry_dt 
			,old.audit_time 
			,new.audit_time 
			,old.audit_cd 
			,new.audit_cd 
			,old.audit_history_record_number 
			,new.audit_history_record_number 
			,old.audit_program 
			,new.audit_program 
			,old.audit_effective_dt 
			,new.audit_effective_dt 
			,old.audit_change_agency_id 
			,new.audit_change_agency_id 
			,old.client_cd 
			,new.client_cd 
			,old.client_name 
			,new.client_name 
			,old.bill_to_code 
			,new.bill_to_code 
			,old.addr_1 
			,new.addr_1 
			,old.addr_2 
			,new.addr_2 
			,old.postal_code 
			,new.postal_code 
			,old.postal_extension_code 
			,new.postal_extension_code 
			,old.city 
			,new.city 
			,old.state_prov_cd 
			,new.state_prov_cd 
			,old.phone_1_number 
			,new.phone_1_number 
			,old.phone_2_number 
			,new.phone_2_number 
			,old.reference_cd 
			,new.reference_cd 
			,old.status_cd 
			,new.status_cd 
			,old.producer_1_cd 
			,new.producer_1_cd 
			,old.producer_2_cd 
			,new.producer_2_cd 
			,old.producer_3_cd 
			,new.producer_3_cd 
			,old.servicer_1_cd 
			,new.servicer_1_cd 
			,old.servicer_2_cd 
			,new.servicer_2_cd 
			,old.servicer_3_cd 
			,new.servicer_3_cd 
			,old.credit_terms 
			,new.credit_terms 
			,old.source_cd 
			,new.source_cd 
			,old.source_dt 
			,new.source_dt 
			,old.cat_1_cd 
			,new.cat_1_cd 
			,old.cat_2_cd 
			,new.cat_2_cd 
			,old.cat_3_cd 
			,new.cat_3_cd 
			,old.cat_4_cd 
			,new.cat_4_cd 
			,old.cat_5_cd 
			,new.cat_5_cd 
			,old.net_commission_pct 
			,new.net_commission_pct 
			,old.contact_method 
			,new.contact_method 
			,old.sic_cd 
			,new.sic_cd 
			,old.collection_comments 
			,new.collection_comments 
			,old.remark_text 
			,new.remark_text 
			,old.phone_1_extension_number 
			,new.phone_1_extension_number 
			,old.phone_2_extension_number 
			,new.phone_2_extension_number 
			,old.fax_number 
			,new.fax_number 
			,old.pro_sus_cd 
			,new.pro_sus_cd 
			,old.date_business_started 
			,new.date_business_started 
			,old.business_nature 
			,new.business_nature 
			,old.inspection_contact 
			,new.inspection_contact 
			,old.inspection_phone_number 
			,new.inspection_phone_number 
			,old.inspection_phone_extension_number 
			,new.inspection_phone_extension_number 
			,old.accounting_contact 
			,new.accounting_contact 
			,old.accounting_phone_number 
			,new.accounting_phone_number 
			,old.accounting_phone_extension_number 
			,new.accounting_phone_extension_number 
			,old.legal_entity_cd 
			,new.legal_entity_cd 
			,old.email_addr 
			,new.email_addr 
			,old.web_site_link 
			,new.web_site_link 
			,old.division_number 
			,new.division_number 
			,old.parent_client 
			,new.parent_client 
			,old.parent_rel_cd 
			,new.parent_rel_cd 
			,old.relation_client 
			,new.relation_client 
			,old.relation_cd 
			,new.relation_cd 
			,old.fein 
			,new.fein 
			,old.insp_email 
			,new.insp_email 
			,old.acct_email 
			,new.acct_email 
			,old.no_members 
			,new.no_members 
			,old.integration_client_name 
			,new.integration_client_name 
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_clients_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_clients_u() TO rl_sagitta_x;
GO 
