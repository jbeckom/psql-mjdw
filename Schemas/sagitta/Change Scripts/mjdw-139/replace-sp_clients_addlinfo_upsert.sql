ALTER TABLE sagitta.clients_addlinfo
	DROP COLUMN IF EXISTS modify_dt;
GO 

ALTER TABLE sagitta.audit_clients_addlinfo 
	 DROP COLUMN IF EXISTS old_modify_dt
	,DROP COLUMN IF EXISTS new_modify_dt;
GO 

DROP FUNCTION IF EXISTS sagitta.sp_clients_addlinfo_upsert(int, text);
GO 

CREATE OR REPLACE FUNCTION sagitta.sp_clients_addlinfo_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.clients_addlinfo(
		 sagitem
		,audit_entry_dt
		,audit_time
		,audit_staff_cd
		,audit_cd
		,audit_history_record_number
		,audit_program
		,serv_4
		,serv_5
		,client_exec
		,prod_4
		,prod_5
		,budgeted_revenue
		,invoice_contact
		,rewrite
		,invoice_email_address
		,invoice_fax_number
		,industry_segment
		,mc_number
		,dot_number
	)
	SELECT 	 sagitem
			,audit_entry_dt
			,audit_time
			,audit_staff_cd
			,audit_cd
			,audit_history_record_number
			,audit_program
			,serv_4
			,serv_5
			,client_exec
			,prod_4
			,prod_5
			,budgeted_revenue
			,invoice_contact
			,rewrite
			,invoice_email_address
			,invoice_fax_number
			,industry_segment
			,mc_number
			,dot_number
	FROM 	sagitta.stg_clients_addlinfo 
	ON CONFLICT (sagitem) DO UPDATE 
	SET 	 audit_entry_dt 				= excluded.audit_entry_dt
			,audit_time 					= excluded.audit_time
			,audit_staff_cd 				= excluded.audit_staff_cd
			,audit_cd 						= excluded.audit_cd
			,audit_history_record_number 	= excluded.audit_history_record_number
			,audit_program 					= excluded.audit_program
			,serv_4 						= excluded.serv_4
			,serv_5 						= excluded.serv_5
			,client_exec 					= excluded.client_exec
			,prod_4 						= excluded.prod_4
			,prod_5 						= excluded.prod_5
			,budgeted_revenue 				= excluded.budgeted_revenue
			,invoice_contact 				= excluded.invoice_contact
			,rewrite 						= excluded.rewrite
			,invoice_email_address 			= excluded.invoice_email_address
			,invoice_fax_number 			= excluded.invoice_fax_number
			,industry_segment 				= excluded.industry_segment
			,mc_number 						= excluded.mc_number
			,dot_number 					= excluded.dot_number
	WHERE 	(clients_addlinfo.audit_entry_dt,clients_addlinfo.audit_time,clients_addlinfo.audit_staff_cd,clients_addlinfo.audit_cd,clients_addlinfo.audit_history_record_number,clients_addlinfo.audit_program,clients_addlinfo.serv_4,clients_addlinfo.serv_5,clients_addlinfo.client_exec,clients_addlinfo.prod_4,clients_addlinfo.prod_5,clients_addlinfo.budgeted_revenue,clients_addlinfo.invoice_contact,clients_addlinfo.rewrite,clients_addlinfo.invoice_email_address,clients_addlinfo.invoice_fax_number,clients_addlinfo.industry_segment,clients_addlinfo.mc_number,clients_addlinfo.dot_number) 
		IS DISTINCT FROM 	(excluded.audit_entry_dt,excluded.audit_time,excluded.audit_staff_cd,excluded.audit_cd,excluded.audit_history_record_number,excluded.audit_program,excluded.serv_4,excluded.serv_5,excluded.client_exec,excluded.prod_4,excluded.prod_5,excluded.budgeted_revenue,excluded.invoice_contact,excluded.rewrite,excluded.invoice_email_address,excluded.invoice_fax_number,excluded.industry_segment,excluded.mc_number,excluded.dot_number);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_clients_addlinfo_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_clients_addlinfo_upsert() TO rl_sagitta_x;
GO 
