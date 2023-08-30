CREATE OR REPLACE FUNCTION sagitta.tr_audit_clients_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_clients(
		 sagitem 
		,old_audit_staff_cd 
		,old_audit_entry_dt 
		,old_audit_time 
		,old_audit_cd 
		,old_audit_history_record_number 
		,old_audit_program 
		,old_audit_effective_dt 
		,old_audit_change_agency_id 
		,old_client_cd 
		,old_client_name 
		,old_bill_to_code 
		,old_addr_1 
		,old_addr_2 
		,old_postal_code 
		,old_postal_extension_code 
		,old_city 
		,old_state_prov_cd 
		,old_phone_1_number 
		,old_phone_2_number 
		,old_reference_cd 
		,old_status_cd 
		,old_producer_1_cd 
		,old_producer_2_cd 
		,old_producer_3_cd 
		,old_servicer_1_cd 
		,old_servicer_2_cd 
		,old_servicer_3_cd 
		,old_credit_terms 
		,old_source_cd 
		,old_source_dt 
		,old_cat_1_cd 
		,old_cat_2_cd 
		,old_cat_3_cd 
		,old_cat_4_cd 
		,old_cat_5_cd 
		,old_net_commission_pct 
		,old_contact_method 
		,old_sic_cd 
		,old_collection_comments 
		,old_remark_text 
		,old_phone_1_extension_number 
		,old_phone_2_extension_number 
		,old_fax_number 
		,old_pro_sus_cd 
		,old_date_business_started 
		,old_business_nature 
		,old_inspection_contact 
		,old_inspection_phone_number 
		,old_inspection_phone_extension_number 
		,old_accounting_contact 
		,old_accounting_phone_number 
		,old_accounting_phone_extension_number 
		,old_legal_entity_cd 
		,old_email_addr 
		,old_web_site_link 
		,old_division_number 
		,old_parent_client 
		,old_parent_rel_cd 
		,old_relation_client 
		,old_relation_cd 
		,old_fein 
		,old_insp_email 
		,old_acct_email 
		,old_no_members 
		,old_integration_client_name 
		,audit_action 
	)
	SELECT 	 old.sagitem
			,old.audit_staff_cd 
			,old.audit_entry_dt 
			,old.audit_time 
			,old.audit_cd 
			,old.audit_history_record_number 
			,old.audit_program 
			,old.audit_effective_dt 
			,old.audit_change_agency_id 
			,old.client_cd 
			,old.client_name 
			,old.bill_to_code 
			,old.addr_1 
			,old.addr_2 
			,old.postal_code 
			,old.postal_extension_code 
			,old.city 
			,old.state_prov_cd 
			,old.phone_1_number 
			,old.phone_2_number 
			,old.reference_cd 
			,old.status_cd 
			,old.producer_1_cd 
			,old.producer_2_cd 
			,old.producer_3_cd 
			,old.servicer_1_cd 
			,old.servicer_2_cd 
			,old.servicer_3_cd 
			,old.credit_terms 
			,old.source_cd 
			,old.source_dt 
			,old.cat_1_cd 
			,old.cat_2_cd 
			,old.cat_3_cd 
			,old.cat_4_cd 
			,old.cat_5_cd 
			,old.net_commission_pct 
			,old.contact_method 
			,old.sic_cd 
			,old.collection_comments 
			,old.remark_text 
			,old.phone_1_extension_number 
			,old.phone_2_extension_number 
			,old.fax_number 
			,old.pro_sus_cd 
			,old.date_business_started 
			,old.business_nature 
			,old.inspection_contact 
			,old.inspection_phone_number 
			,old.inspection_phone_extension_number 
			,old.accounting_contact 
			,old.accounting_phone_number 
			,old.accounting_phone_extension_number 
			,old.legal_entity_cd 
			,old.email_addr 
			,old.web_site_link 
			,old.division_number 
			,old.parent_client 
			,old.parent_rel_cd 
			,old.relation_client 
			,old.relation_cd 
			,old.fein 
			,old.insp_email 
			,old.acct_email 
			,old.no_members 
			,old.integration_client_name 
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_clients_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_clients_d() TO rl_sagitta_x;
GO 
