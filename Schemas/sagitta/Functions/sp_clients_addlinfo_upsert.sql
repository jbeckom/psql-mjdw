CREATE OR REPLACE FUNCTION sagitta.sp_clients_addlinfo_upsert(_sagitem int, _xmldata TEXT)
RETURNS int 
LANGUAGE plpgsql
AS $$

DECLARE 
	rc 	int;

BEGIN 
	rc := 0;

	WITH xmldata AS (SELECT _xmldata::XML AS exemel)
	INSERT INTO sagitta.clients_addlinfo (
		 sagitem
		,audit_staff_cd
		,audit_entry_dt
		,audit_time
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
		SELECT 	 _sagitem 	AS sagitem 
				,REPLACE(regexp_replace(UNNEST(xpath('/Item/a1/v1/s1/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 		AS audit_staff_cd
				,REPLACE(regexp_replace(UNNEST(xpath('/Item/a1/v1/s2/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&')::int 	AS audit_entry_dt
				,REPLACE(regexp_replace(UNNEST(xpath('/Item/a1/v1/s3/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&')::int 	AS audit_time
				,REPLACE(regexp_replace(UNNEST(xpath('/Item/a1/v1/s4/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 		AS audit_cd
				,REPLACE(regexp_replace(UNNEST(xpath('/Item/a1/v1/s5/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 		AS audit_history_record_number
				,REPLACE(regexp_replace(UNNEST(xpath('/Item/a1/v1/s6/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 		AS audit_program
				,REPLACE(regexp_replace(UNNEST(xpath('/Item/a6/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 				AS serv_4
				,REPLACE(regexp_replace(UNNEST(xpath('/Item/a7/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 				AS serv_5
				,REPLACE(regexp_replace(UNNEST(xpath('/Item/a16/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 				AS client_exec
				,REPLACE(regexp_replace(UNNEST(xpath('/Item/a14/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 				AS prod_4
				,REPLACE(regexp_replace(UNNEST(xpath('/Item/a15/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 				AS prod_5
				,REPLACE(regexp_replace(UNNEST(xpath('/Item/a8/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 				AS budgeted_revenue
				,REPLACE(regexp_replace(UNNEST(xpath('/Item/a12/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 				AS invoice_contact
				,REPLACE(regexp_replace(UNNEST(xpath('/Item/a9/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 				AS rewrite
				,REPLACE(regexp_replace(UNNEST(xpath('/Item/a10/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 				AS invoice_email_address
				,REPLACE(regexp_replace(UNNEST(xpath('/Item/a11/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 				AS invoice_fax_number
				,REPLACE(regexp_replace(UNNEST(xpath('/Item/a13/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 				AS industy_segment
				,REPLACE(regexp_replace(UNNEST(xpath('/Item/a17/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 				AS mc_number
				,REPLACE(regexp_replace(UNNEST(xpath('/Item/a18/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 				AS dot_number
		FROM 	xmldata
		ON CONFLICT (sagitem) 	DO UPDATE
		SET 	 audit_staff_cd = excluded.audit_staff_cd
				,audit_entry_dt = excluded.audit_entry_dt
				,audit_time = excluded.audit_time
				,audit_cd = excluded.audit_cd
				,audit_history_record_number = excluded.audit_history_record_number
				,audit_program = excluded.audit_program
				,serv_4 = excluded.serv_4
				,serv_5 = excluded.serv_5
				,client_exec = excluded.client_exec
				,prod_4 = excluded.prod_4
				,prod_5 = excluded.prod_5
				,budgeted_revenue = excluded.budgeted_revenue
				,invoice_contact = excluded.invoice_contact
				,rewrite = excluded.rewrite
				,invoice_email_address = excluded.invoice_email_address
				,invoice_fax_number = excluded.invoice_fax_number
				,industry_segment = excluded.industry_segment
				,mc_number = excluded.mc_number
				,dot_number = excluded.dot_number
				,modify_dt = timezone('utc'::TEXT, clock_timestamp())
		WHERE (clients_addlinfo.audit_staff_cd,clients_addlinfo.audit_entry_dt,clients_addlinfo.audit_time,clients_addlinfo.audit_cd,clients_addlinfo.audit_history_record_number,clients_addlinfo.audit_program,clients_addlinfo.serv_4,clients_addlinfo.serv_5,clients_addlinfo.client_exec,clients_addlinfo.prod_4,clients_addlinfo.prod_5,clients_addlinfo.budgeted_revenue,clients_addlinfo.invoice_contact,clients_addlinfo.rewrite,clients_addlinfo.invoice_email_address,clients_addlinfo.invoice_fax_number,clients_addlinfo.industry_segment,clients_addlinfo.mc_number,clients_addlinfo.dot_number)
			IS DISTINCT FROM (excluded.audit_staff_cd,excluded.audit_entry_dt,excluded.audit_time,excluded.audit_cd,excluded.audit_history_record_number,excluded.audit_program,excluded.serv_4,excluded.serv_5,excluded.client_exec,excluded.prod_4,excluded.prod_5,excluded.budgeted_revenue,excluded.invoice_contact,excluded.rewrite,excluded.invoice_email_address,excluded.invoice_fax_number,excluded.industry_segment,excluded.mc_number,excluded.dot_number);
		
		GET DIAGNOSTICS rc = row_count;
	
		RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_clients_addlinfo_upsert(int, text) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_clients_addlinfo_upsert(int, text) TO rl_sagitta_x;
GO 
