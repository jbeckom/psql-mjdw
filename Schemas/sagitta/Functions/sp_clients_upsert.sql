CREATE OR REPLACE FUNCTION sagitta.sp_clients_upsert()
RETURNS int 
LANGUAGE plpgsql
AS $$

DECLARE rc 	int;

BEGIN 
	insert into sagitta.clients (
		 sagitem 
		,audit_staff_cd 
		,audit_entry_dt 
		,audit_time 
		,audit_cd 
		,audit_history_record_number 
		,audit_program 
		,audit_effective_dt 
		,audit_change_agency_id 
		,client_cd 
		,client_name 
		,bill_to_code 
		,addr_1 
		,addr_2 
		,postal_code 
		,postal_extension_code 
		,city 
		,state_prov_cd 
		,phone_1_number 
		,phone_2_number 
		,reference_cd 
		,status_cd 
		,producer_1_cd 
		,producer_2_cd 
		,producer_3_cd 
		,servicer_1_cd 
		,servicer_2_cd 
		,servicer_3_cd 
		,credit_terms 
		,source_cd 
		,source_dt 
		,cat_1_cd 
		,cat_2_cd 
		,cat_3_cd 
		,cat_4_cd 
		,cat_5_cd 
		,net_commission_pct 
		,contact_method 
		,sic_cd 
		,collection_comments 
		,remark_text 
		,phone_1_extension_number 
		,phone_2_extension_number 
		,fax_number 
		,pro_sus_cd 
		,date_business_started 
		,business_nature 
		,inspection_contact 
		,inspection_phone_number 
		,inspection_phone_extension_number 
		,accounting_contact 
		,accounting_phone_number 
		,accounting_phone_extension_number 
		,legal_entity_cd 
		,email_addr 
		,web_site_link 
		,division_number 
		,parent_client 
		,parent_rel_cd 
		,relation_client 
		,relation_cd 
		,fein 
		,insp_email 
		,acct_email 
		,no_members 
		,integration_client_name 
	)
	select 	 sagitem 
			,audit_staff_cd 
			,audit_entry_dt 
			,audit_time 
			,audit_cd 
			,audit_history_record_number 
			,audit_program 
			,audit_effective_dt 
			,audit_change_agency_id 
			,client_cd 
			,client_name 
			,bill_to_code 
			,addr_1 
			,addr_2 
			,postal_code 
			,postal_extension_code 
			,city 
			,state_prov_cd 
			,phone_1_number 
			,phone_2_number 
			,reference_cd 
			,status_cd 
			,producer_1_cd 
			,producer_2_cd 
			,producer_3_cd 
			,servicer_1_cd 
			,servicer_2_cd 
			,servicer_3_cd 
			,credit_terms 
			,source_cd 
			,source_dt 
			,cat_1_cd 
			,cat_2_cd 
			,cat_3_cd 
			,cat_4_cd 
			,cat_5_cd 
			,net_commission_pct 
			,contact_method 
			,sic_cd 
			,collection_comments 
			,remark_text 
			,phone_1_extension_number 
			,phone_2_extension_number 
			,fax_number 
			,pro_sus_cd 
			,date_business_started 
			,business_nature 
			,inspection_contact 
			,inspection_phone_number 
			,inspection_phone_extension_number 
			,accounting_contact 
			,accounting_phone_number 
			,accounting_phone_extension_number 
			,legal_entity_cd 
			,email_addr 
			,web_site_link 
			,division_number 
			,parent_client 
			,parent_rel_cd 
			,relation_client 
			,relation_cd 
			,fein 
			,insp_email 
			,acct_email 
			,no_members 
			,integration_client_name 
	from 	sagitta.stg_clients 
	on conflict (sagitem) do update 
	set 	 audit_staff_cd 					= excluded.audit_staff_cd 
			,audit_entry_dt 					= excluded.audit_entry_dt 
			,audit_time 						= excluded.audit_time 
			,audit_cd 							= excluded.audit_cd 
			,audit_history_record_number 		= excluded.audit_history_record_number 
			,audit_program 						= excluded.audit_program 
			,audit_effective_dt 				= excluded.audit_effective_dt 
			,audit_change_agency_id 			= excluded.audit_change_agency_id 
			,client_cd 							= excluded.client_cd 
			,client_name 						= excluded.client_name 
			,bill_to_code 						= excluded.bill_to_code 
			,addr_1 							= excluded.addr_1 
			,addr_2 							= excluded.addr_2 
			,postal_code 						= excluded.postal_code 
			,postal_extension_code 				= excluded.postal_extension_code 
			,city 								= excluded.city 
			,state_prov_cd 						= excluded.state_prov_cd 
			,phone_1_number 					= excluded.phone_1_number 
			,phone_2_number 					= excluded.phone_2_number 
			,reference_cd 						= excluded.reference_cd 
			,status_cd 							= excluded.status_cd 
			,producer_1_cd 						= excluded.producer_1_cd 
			,producer_2_cd 						= excluded.producer_2_cd 
			,producer_3_cd 						= excluded.producer_3_cd 
			,servicer_1_cd 						= excluded.servicer_1_cd 
			,servicer_2_cd 						= excluded.servicer_2_cd 
			,servicer_3_cd 						= excluded.servicer_3_cd 
			,credit_terms 						= excluded.credit_terms 
			,source_cd 							= excluded.source_cd 
			,source_dt 							= excluded.source_dt 
			,cat_1_cd 							= excluded.cat_1_cd 
			,cat_2_cd 							= excluded.cat_2_cd 
			,cat_3_cd 							= excluded.cat_3_cd 
			,cat_4_cd 							= excluded.cat_4_cd 
			,cat_5_cd 							= excluded.cat_5_cd 
			,net_commission_pct 				= excluded.net_commission_pct 
			,contact_method 					= excluded.contact_method 
			,sic_cd 							= excluded.sic_cd 
			,collection_comments 				= excluded.collection_comments 
			,remark_text 						= excluded.remark_text 
			,phone_1_extension_number 			= excluded.phone_1_extension_number 
			,phone_2_extension_number 			= excluded.phone_2_extension_number 
			,fax_number 						= excluded.fax_number 
			,pro_sus_cd 						= excluded.pro_sus_cd 
			,date_business_started 				= excluded.date_business_started 
			,business_nature 					= excluded.business_nature 
			,inspection_contact 				= excluded.inspection_contact 
			,inspection_phone_number 			= excluded.inspection_phone_number 
			,inspection_phone_extension_number 	= excluded.inspection_phone_extension_number 
			,accounting_contact 				= excluded.accounting_contact 
			,accounting_phone_number 			= excluded.accounting_phone_number 
			,accounting_phone_extension_number 	= excluded.accounting_phone_extension_number 
			,legal_entity_cd 					= excluded.legal_entity_cd 
			,email_addr 						= excluded.email_addr 
			,web_site_link 						= excluded.web_site_link 
			,division_number 					= excluded.division_number 
			,parent_client 						= excluded.parent_client 
			,parent_rel_cd 						= excluded.parent_rel_cd 
			,relation_client 					= excluded.relation_client 
			,relation_cd 						= excluded.relation_cd 
			,fein 								= excluded.fein 
			,insp_email 						= excluded.insp_email 
			,acct_email 						= excluded.acct_email 
			,no_members 						= excluded.no_members 
			,integration_client_name 			= excluded.integration_client_name 
	where 	(clients.audit_staff_cd,clients.audit_entry_dt,clients.audit_time,clients.audit_cd,clients.audit_history_record_number,clients.audit_program,clients.audit_effective_dt,clients.audit_change_agency_id,clients.client_cd,clients.client_name,clients.bill_to_code,clients.addr_1,clients.addr_2,clients.postal_code,clients.postal_extension_code,clients.city,clients.state_prov_cd,clients.phone_1_number,clients.phone_2_number,clients.reference_cd,clients.status_cd,clients.producer_1_cd,clients.producer_2_cd,clients.producer_3_cd,clients.servicer_1_cd,clients.servicer_2_cd,clients.servicer_3_cd,clients.credit_terms,clients.source_cd,clients.source_dt,clients.cat_1_cd,clients.cat_2_cd,clients.cat_3_cd,clients.cat_4_cd,clients.cat_5_cd,clients.net_commission_pct,clients.contact_method,clients.sic_cd,clients.collection_comments,clients.remark_text,clients.phone_1_extension_number,clients.phone_2_extension_number,clients.fax_number,clients.pro_sus_cd,clients.date_business_started,clients.business_nature,clients.inspection_contact,clients.inspection_phone_number,clients.inspection_phone_extension_number,clients.accounting_contact,clients.accounting_phone_number,clients.accounting_phone_extension_number,clients.legal_entity_cd,clients.email_addr,clients.web_site_link,clients.division_number,clients.parent_client,clients.parent_rel_cd,clients.relation_client,clients.relation_cd,clients.fein,clients.insp_email,clients.acct_email,clients.no_members,clients.integration_client_name) 
		is distinct from 	(excluded.audit_staff_cd,excluded.audit_entry_dt,excluded.audit_time,excluded.audit_cd,excluded.audit_history_record_number,excluded.audit_program,excluded.audit_effective_dt,excluded.audit_change_agency_id,excluded.client_cd,excluded.client_name,excluded.bill_to_code,excluded.addr_1,excluded.addr_2,excluded.postal_code,excluded.postal_extension_code,excluded.city,excluded.state_prov_cd,excluded.phone_1_number,excluded.phone_2_number,excluded.reference_cd,excluded.status_cd,excluded.producer_1_cd,excluded.producer_2_cd,excluded.producer_3_cd,excluded.servicer_1_cd,excluded.servicer_2_cd,excluded.servicer_3_cd,excluded.credit_terms,excluded.source_cd,excluded.source_dt,excluded.cat_1_cd,excluded.cat_2_cd,excluded.cat_3_cd,excluded.cat_4_cd,excluded.cat_5_cd,excluded.net_commission_pct,excluded.contact_method,excluded.sic_cd,excluded.collection_comments,excluded.remark_text,excluded.phone_1_extension_number,excluded.phone_2_extension_number,excluded.fax_number,excluded.pro_sus_cd,excluded.date_business_started,excluded.business_nature,excluded.inspection_contact,excluded.inspection_phone_number,excluded.inspection_phone_extension_number,excluded.accounting_contact,excluded.accounting_phone_number,excluded.accounting_phone_extension_number,excluded.legal_entity_cd,excluded.email_addr,excluded.web_site_link,excluded.division_number,excluded.parent_client,excluded.parent_rel_cd,excluded.relation_client,excluded.relation_cd,excluded.fein,excluded.insp_email,excluded.acct_email,excluded.no_members,excluded.integration_client_name); 

	get diagnostics rc = row_count;

	return rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_clients_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_clients_upsert() TO rl_sagitta_x;
GO 
