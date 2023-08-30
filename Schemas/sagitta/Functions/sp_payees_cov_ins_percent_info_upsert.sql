create or replace function sagitta.sp_payees_cov_ins_percent_info_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
	insert into sagitta.payees_cov_ins_percent_info (
		 sagitem 
		,lis 
		,coverage_cd
		,agency_new_pct
		,db_new_pct
		,agency_ren_pct
		,db_ren_pct
		,begin_dt
		,end_dt
		,standard_comm_ind
		,insurer_cd
		,grading_from_amt
		,grading_to_amt
		,commission_type_ind
		,comm_div
		,comm_dept
	)
	select 	 sagitem 
			,lis 
			,coverage_cd
			,agency_new_pct
			,db_new_pct
			,agency_ren_pct
			,db_ren_pct
			,begin_dt
			,end_dt
			,standard_comm_ind
			,insurer_cd
			,grading_from_amt
			,grading_to_amt
			,commission_type_ind
			,comm_div
			,comm_dept
	from 	sagitta.stg_payees_cov_ins_percent_info
	on conflict (sagitem,lis) do update 
	set 	 coverage_cd 			= excluded.coverage_cd
			,agency_new_pct 		= excluded.agency_new_pct
			,db_new_pct 			= excluded.db_new_pct
			,agency_ren_pct 		= excluded.agency_ren_pct
			,db_ren_pct 			= excluded.db_ren_pct
			,begin_dt 				= excluded.begin_dt
			,end_dt 				= excluded.end_dt
			,standard_comm_ind 		= excluded.standard_comm_ind
			,insurer_cd 			= excluded.insurer_cd
			,grading_from_amt 		= excluded.grading_from_amt
			,grading_to_amt 		= excluded.grading_to_amt
			,commission_type_ind 	= excluded.commission_type_ind
			,comm_div 				= excluded.comm_div
			,comm_dept 				= excluded.comm_dept
	where 	(payees_cov_ins_percent_info.coverage_cd,payees_cov_ins_percent_info.agency_new_pct,payees_cov_ins_percent_info.db_new_pct,payees_cov_ins_percent_info.agency_ren_pct,payees_cov_ins_percent_info.db_ren_pct,payees_cov_ins_percent_info.begin_dt,payees_cov_ins_percent_info.end_dt,payees_cov_ins_percent_info.standard_comm_ind,payees_cov_ins_percent_info.insurer_cd,payees_cov_ins_percent_info.grading_from_amt,payees_cov_ins_percent_info.grading_to_amt,payees_cov_ins_percent_info.commission_type_ind,payees_cov_ins_percent_info.comm_div,payees_cov_ins_percent_info.comm_dept) 
		is distinct from 	(excluded.coverage_cd,excluded.agency_new_pct,excluded.db_new_pct,excluded.agency_ren_pct,excluded.db_ren_pct,excluded.begin_dt,excluded.end_dt,excluded.standard_comm_ind,excluded.insurer_cd,excluded.grading_from_amt,excluded.grading_to_amt,excluded.commission_type_ind,excluded.comm_div,excluded.comm_dept); 
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
end;
$$;
go

/*** PERMISSIONS ***/
alter function sagitta.sp_payees_cov_ins_percent_info_upsert() owner to mj_admin;
go 

grant execute on function sagitta.sp_payees_cov_ins_percent_info_upsert() to rl_sagitta_x;
go 