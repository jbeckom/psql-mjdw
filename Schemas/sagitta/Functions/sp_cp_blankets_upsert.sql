CREATE OR REPLACE FUNCTION sagitta.sp_cp_blankets_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.cp_blankets (
		 sagitem 
		,audit_staff_cd 
		,audit_entry_dt 
		,audit_time 
		,audit_cd 
		,audit_history_record_number 
		,audit_program 
		,audit_effective_dt 
		,audit_change_agency_id 
		,blanket_number 
		,policy_agency_id 
		,cause 
		,coinsurance_pct 
		,inflation_guard_pct 
		,rate 
		,total_blk_limit 
		,total_blk_premium 
		,blanket_type_cd 
		,blanket_type_desc 
		,valuation_cd 
		,agree_amt_ind 
		,ded_symbol 
		,ded_amt 
		,deductible_type_cd 
		,deductible_basis_cd 
		,off_dt 
		,start_dt 
		,second_amt_value_type 
		,second_amt_value 
		,end_dt 
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
			,blanket_number 
			,policy_agency_id 
			,cause 
			,coinsurance_pct 
			,inflation_guard_pct 
			,rate 
			,total_blk_limit 
			,total_blk_premium 
			,blanket_type_cd 
			,blanket_type_desc 
			,valuation_cd 
			,agree_amt_ind 
			,ded_symbol 
			,ded_amt 
			,deductible_type_cd 
			,deductible_basis_cd 
			,off_dt 
			,start_dt 
			,second_amt_value_type 
			,second_amt_value 
			,end_dt 
	FROM 	sagitta.stg_cp_blankets 
	ON CONFLICT (sagitem) DO UPDATE 
	SET 	 audit_staff_cd 					= excluded.audit_staff_cd 
			,audit_entry_dt 					= excluded.audit_entry_dt 
			,audit_time 						= excluded.audit_time 
			,audit_cd 							= excluded.audit_cd 
			,audit_history_record_number 		= excluded.audit_history_record_number 
			,audit_program 						= excluded.audit_program 
			,audit_effective_dt 				= excluded.audit_effective_dt 
			,audit_change_agency_id 			= excluded.audit_change_agency_id 
			,blanket_number 					= excluded.blanket_number 
			,policy_agency_id 					= excluded.policy_agency_id 
			,cause 								= excluded.cause 
			,coinsurance_pct 					= excluded.coinsurance_pct 
			,inflation_guard_pct 				= excluded.inflation_guard_pct 
			,rate 								= excluded.rate 
			,total_blk_limit 					= excluded.total_blk_limit 
			,total_blk_premium 					= excluded.total_blk_premium 
			,blanket_type_cd 					= excluded.blanket_type_cd 
			,blanket_type_desc 					= excluded.blanket_type_desc 
			,valuation_cd 						= excluded.valuation_cd 
			,agree_amt_ind 						= excluded.agree_amt_ind 
			,ded_symbol 						= excluded.ded_symbol 
			,ded_amt 							= excluded.ded_amt 
			,deductible_type_cd 				= excluded.deductible_type_cd 
			,deductible_basis_cd 				= excluded.deductible_basis_cd 
			,off_dt 							= excluded.off_dt 
			,start_dt 							= excluded.start_dt 
			,second_amt_value_type 				= excluded.second_amt_value_type 
			,second_amt_value 					= excluded.second_amt_value 
			,end_dt 							= excluded.end_dt 
	WHERE 	(cp_blankets.audit_staff_cd,cp_blankets.audit_entry_dt,cp_blankets.audit_time,cp_blankets.audit_cd,cp_blankets.audit_history_record_number,cp_blankets.audit_program,cp_blankets.audit_effective_dt,cp_blankets.audit_change_agency_id,cp_blankets.blanket_number,cp_blankets.policy_agency_id,cp_blankets.cause,cp_blankets.coinsurance_pct,cp_blankets.inflation_guard_pct,cp_blankets.rate,cp_blankets.total_blk_limit,cp_blankets.total_blk_premium,cp_blankets.blanket_type_cd,cp_blankets.blanket_type_desc,cp_blankets.valuation_cd,cp_blankets.agree_amt_ind,cp_blankets.ded_symbol,cp_blankets.ded_amt,cp_blankets.deductible_type_cd,cp_blankets.deductible_basis_cd,cp_blankets.off_dt,cp_blankets.start_dt,cp_blankets.second_amt_value_type,cp_blankets.second_amt_value,cp_blankets.end_dt) 
		IS DISTINCT FROM 	(excluded.audit_staff_cd,excluded.audit_entry_dt,excluded.audit_time,excluded.audit_cd,excluded.audit_history_record_number,excluded.audit_program,excluded.audit_effective_dt,excluded.audit_change_agency_id,excluded.blanket_number,excluded.policy_agency_id,excluded.cause,excluded.coinsurance_pct,excluded.inflation_guard_pct,excluded.rate,excluded.total_blk_limit,excluded.total_blk_premium,excluded.blanket_type_cd,excluded.blanket_type_desc,excluded.valuation_cd,excluded.agree_amt_ind,excluded.ded_symbol,excluded.ded_amt,excluded.deductible_type_cd,excluded.deductible_basis_cd,excluded.off_dt,excluded.start_dt,excluded.second_amt_value_type,excluded.second_amt_value,excluded.end_dt); 
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_cp_blankets_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_cp_blankets_upsert() TO rl_sagitta_x;
GO 
