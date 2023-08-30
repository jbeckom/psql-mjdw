create or replace function sagitta.tr_audit_payees_cov_ins_percent_info_u()
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_payees_cov_ins_percent_info(
         sagitem 
        ,lis 
        ,old_coverage_cd
        ,new_coverage_cd
        ,old_agency_new_pct
        ,new_agency_new_pct
        ,old_db_new_pct
        ,new_db_new_pct
        ,old_agency_ren_pct
        ,new_agency_ren_pct
        ,old_db_ren_pct
        ,new_db_ren_pct
        ,old_begin_dt
        ,new_begin_dt
        ,old_end_dt
        ,new_end_dt
        ,old_standard_comm_ind
        ,new_standard_comm_ind
        ,old_insurer_cd
        ,new_insurer_cd
        ,old_grading_from_amt
        ,new_grading_from_amt
        ,old_grading_to_amt
        ,new_grading_to_amt
        ,old_commission_type_ind
        ,new_commission_type_ind
        ,old_comm_div
        ,new_comm_div
        ,old_comm_dept
        ,new_comm_dept
        ,audit_action 
    )
    select   old.sagitem 
            ,old.lis 
            ,old.coverage_cd
            ,new.coverage_cd
            ,old.agency_new_pct
            ,new.agency_new_pct
            ,old.db_new_pct
            ,new.db_new_pct
            ,old.agency_ren_pct
            ,new.agency_ren_pct
            ,old.db_ren_pct
            ,new.db_ren_pct
            ,old.begin_dt
            ,new.begin_dt
            ,old.end_dt
            ,new.end_dt
            ,old.standard_comm_ind
            ,new.standard_comm_ind
            ,old.insurer_cd
            ,new.insurer_cd
            ,old.grading_from_amt
            ,new.grading_from_amt
            ,old.grading_to_amt
            ,new.grading_to_amt
            ,old.commission_type_ind
            ,new.commission_type_ind
            ,old.comm_div
            ,new.comm_div
            ,old.comm_dept
            ,new.comm_dept
            ,'U' ;
    return old;
end;
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_payees_cov_ins_percent_info_u() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_payees_cov_ins_percent_info_u() to rl_sagitta_x;
go 