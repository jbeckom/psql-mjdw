create or replace function sagitta.tr_audit_payees_cov_ins_percent_info_d()
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_payees_cov_ins_percent_info(
         sagitem 
        ,lis 
        ,old_coverage_cd
        ,old_agency_new_pct
        ,old_db_new_pct
        ,old_agency_ren_pct
        ,old_db_ren_pct
        ,old_begin_dt
        ,old_end_dt
        ,old_standard_comm_ind
        ,old_insurer_cd
        ,old_grading_from_amt
        ,old_grading_to_amt
        ,old_commission_type_ind
        ,old_comm_div
        ,old_comm_dept
        ,audit_action 
    )
    select   old.sagitem 
            ,old.lis 
            ,old.coverage_cd
            ,old.agency_new_pct
            ,old.db_new_pct
            ,old.agency_ren_pct
            ,old.db_ren_pct
            ,old.begin_dt
            ,old.end_dt
            ,old.standard_comm_ind
            ,old.insurer_cd
            ,old.grading_from_amt
            ,old.grading_to_amt
            ,old.commission_type_ind
            ,old.comm_div
            ,old.comm_dept
            ,'D' ;
    return old;
end;
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_payees_cov_ins_percent_info_d() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_payees_cov_ins_percent_info_d() to rl_sagitta_x;
go 