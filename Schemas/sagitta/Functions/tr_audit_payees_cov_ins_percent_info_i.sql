create or replace function sagitta.tr_audit_payees_cov_ins_percent_info_i()
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_payees_cov_ins_percent_info(
         sagitem 
        ,lis 
        ,new_coverage_cd
        ,new_agency_new_pct
        ,new_db_new_pct
        ,new_agency_ren_pct
        ,new_db_ren_pct
        ,new_begin_dt
        ,new_end_dt
        ,new_standard_comm_ind
        ,new_insurer_cd
        ,new_grading_from_amt
        ,new_grading_to_amt
        ,new_commission_type_ind
        ,new_comm_div
        ,new_comm_dept
        ,audit_action 
    )
    select   new.sagitem 
            ,new.lis 
            ,new.coverage_cd
            ,new.agency_new_pct
            ,new.db_new_pct
            ,new.agency_ren_pct
            ,new.db_ren_pct
            ,new.begin_dt
            ,new.end_dt
            ,new.standard_comm_ind
            ,new.insurer_cd
            ,new.grading_from_amt
            ,new.grading_to_amt
            ,new.commission_type_ind
            ,new.comm_div
            ,new.comm_dept
            ,'I' ;
    return new;
end;
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_payees_cov_ins_percent_info_i() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_payees_cov_ins_percent_info_i() to rl_sagitta_x;
go 