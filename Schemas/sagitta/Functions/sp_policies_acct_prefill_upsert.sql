DROP FUNCTION IF EXISTS sagitta.sp_policies_acct_prefill_upsert(int, text);
GO 

CREATE OR REPLACE FUNCTION sagitta.sp_policies_acct_prefill_upsert()
RETURNS int  
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.policies_acct_prefill (
		 sagitem
		,audit_staff_cd
		,audit_entry_dt
		,audit_time
		,audit_cd
		,audit_history_record_number
		,audit_program
		,audit_effective_dt
		,audit_change_agency_id
		,policy_number
		,client_cd
		,net_commission_pct
		,create_producer_payable
		,filing_state
	)
	SELECT 	 sagitem
			,audit_staff_cd
			,audit_entry_dt
			,audit_time
			,audit_cd
			,audit_history_record_number
			,audit_program
			,audit_effective_dt
			,audit_change_agency_id
			,policy_number
			,client_cd
			,net_commission_pct
			,create_producer_payable
			,filing_state
	FROM 	sagitta.stg_policies_acct_prefill 
	ON CONFLICT (sagitem) DO UPDATE 
	SET 	 audit_staff_cd 				= excluded.audit_staff_cd 
			,audit_entry_dt 				= excluded.audit_entry_dt 
			,audit_time 					= excluded.audit_time 
			,audit_cd 						= excluded.audit_cd 
			,audit_history_record_number 	= excluded.audit_history_record_number 
			,audit_program 					= excluded.audit_program 
			,audit_effective_dt 			= excluded.audit_effective_dt 
			,audit_change_agency_id 		= excluded.audit_change_agency_id 
			,policy_number 					= excluded.policy_number 
			,client_cd 						= excluded.client_cd 
			,net_commission_pct 			= excluded.net_commission_pct 
			,create_producer_payable 		= excluded.create_producer_payable 
			,filing_state 					= excluded.filing_state 
	WHERE 	(policies_acct_prefill.audit_staff_cd,policies_acct_prefill.audit_entry_dt,policies_acct_prefill.audit_time,policies_acct_prefill.audit_cd,policies_acct_prefill.audit_history_record_number,policies_acct_prefill.audit_program,policies_acct_prefill.audit_effective_dt,policies_acct_prefill.audit_change_agency_id,policies_acct_prefill.policy_number,policies_acct_prefill.client_cd,policies_acct_prefill.net_commission_pct,policies_acct_prefill.create_producer_payable,policies_acct_prefill.filing_state) 
		IS DISTINCT FROM 	(excluded.audit_staff_cd,excluded.audit_entry_dt,excluded.audit_time,excluded.audit_cd,excluded.audit_history_record_number,excluded.audit_program,excluded.audit_effective_dt,excluded.audit_change_agency_id,excluded.policy_number,excluded.client_cd,excluded.net_commission_pct,excluded.create_producer_payable,excluded.filing_state); 
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_policies_acct_prefill_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_policies_acct_prefill_upsert() TO rl_sagitta_x;
GO 
