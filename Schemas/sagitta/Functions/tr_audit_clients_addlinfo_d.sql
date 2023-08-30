CREATE OR REPLACE FUNCTION sagitta.tr_audit_clients_addlinfo_d() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_clients_addlinfo (
		 sagitem
		,old_audit_staff_cd
		,old_audit_entry_dt
		,old_audit_time
		,old_audit_cd
		,old_audit_history_record_number
		,old_audit_program
		,old_serv_4
		,old_serv_5
		,old_client_exec
		,old_prod_4
		,old_prod_5
		,old_budgeted_revenue
		,old_invoice_contact
		,old_rewrite
		,old_invoice_email_address
		,old_invoice_fax_number
		,old_industry_segment
		,old_mc_number
		,old_dot_number
		,audit_action
	)
	SELECT 	 OLD.sagitem
			,OLD.audit_staff_cd
			,OLD.audit_entry_dt
			,OLD.audit_time
			,OLD.audit_cd
			,OLD.audit_history_record_number
			,OLD.audit_program
			,OLD.serv_4
			,OLD.serv_5
			,OLD.client_exec
			,OLD.prod_4
			,OLD.prod_5
			,OLD.budgeted_revenue
			,OLD.invoice_contact
			,OLD.rewrite
			,OLD.invoice_email_address
			,OLD.invoice_fax_number
			,OLD.industry_segment
			,OLD.mc_number
			,OLD.dot_number
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_clients_addlinfo_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_clients_addlinfo_d() TO rl_sagitta_x;
GO 
