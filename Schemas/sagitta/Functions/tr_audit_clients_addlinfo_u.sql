CREATE OR REPLACE FUNCTION sagitta.tr_audit_clients_addlinfo_u() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_clients_addlinfo (
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
		,old_serv_4
        ,new_serv_4
		,old_serv_5
        ,new_serv_5
		,old_client_exec
        ,new_client_exec
		,old_prod_4
        ,new_prod_4
		,old_prod_5
        ,new_prod_5
		,old_budgeted_revenue
        ,new_budgeted_revenue
		,old_invoice_contact
        ,new_invoice_contact
		,old_rewrite
        ,new_rewrite
		,old_invoice_email_address
        ,new_invoice_email_address
		,old_invoice_fax_number
        ,new_invoice_fax_number
		,old_industry_segment
        ,new_industry_segment
		,old_mc_number
        ,new_mc_number
		,old_dot_number
        ,new_dot_number
		,audit_action
	)
	SELECT 	 OLD.sagitem
			,OLD.audit_staff_cd
			,NEW.audit_staff_cd
			,OLD.audit_entry_dt
			,NEW.audit_entry_dt
			,OLD.audit_time
			,NEW.audit_time
			,OLD.audit_cd
			,NEW.audit_cd
			,OLD.audit_history_record_number
			,NEW.audit_history_record_number
			,OLD.audit_program
			,NEW.audit_program
			,OLD.serv_4
            ,NEW.serv_4
			,OLD.serv_5
            ,NEW.serv_5
			,OLD.client_exec
            ,NEW.client_exec
			,OLD.prod_4
            ,NEW.prod_4
			,OLD.prod_5
            ,NEW.prod_5
			,OLD.budgeted_revenue
            ,NEW.budgeted_revenue
			,OLD.invoice_contact
            ,NEW.invoice_contact
			,OLD.rewrite
            ,NEW.rewrite
			,OLD.invoice_email_address
            ,NEW.invoice_email_address
			,OLD.invoice_fax_number
            ,NEW.invoice_fax_number
			,OLD.industry_segment
            ,NEW.industry_segment
			,OLD.mc_number
            ,NEW.mc_number
			,OLD.dot_number
            ,NEW.dot_number
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_clients_addlinfo_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_clients_addlinfo_u() TO rl_sagitta_x;
GO 
