CREATE OR REPLACE FUNCTION sagitta.tr_audit_clients_addlinfo_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_clients_addlinfo (
		 sagitem
		,new_audit_staff_cd
		,new_audit_entry_dt
		,new_audit_time
		,new_audit_cd
		,new_audit_history_record_number
		,new_audit_program
		,new_serv_4
		,new_serv_5
		,new_client_exec
		,new_prod_4
		,new_prod_5
		,new_budgeted_revenue
		,new_invoice_contact
		,new_rewrite
		,new_invoice_email_address
		,new_invoice_fax_number
		,new_industry_segment
		,new_mc_number
		,new_dot_number
		,audit_action
	)
	SELECT 	 NEW.sagitem
			,NEW.audit_staff_cd
			,NEW.audit_entry_dt
			,NEW.audit_time
			,NEW.audit_cd
			,NEW.audit_history_record_number
			,NEW.audit_program
			,NEW.serv_4
			,NEW.serv_5
			,NEW.client_exec
			,NEW.prod_4
			,NEW.prod_5
			,NEW.budgeted_revenue
			,NEW.invoice_contact
			,NEW.rewrite
			,NEW.invoice_email_address
			,NEW.invoice_fax_number
			,NEW.industry_segment
			,NEW.mc_number
			,NEW.dot_number
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_clients_addlinfo_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_clients_addlinfo_i() TO rl_sagitta_x;
GO 
