create or replace function sagitta.sp_premiums_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int; 

begin
    insert into sagitta.premiums (
         sagitem 
        ,audit_staff_cd 
        ,audit_entry_dt 
        ,audit_time_ind 
        ,audit_cd 
        ,audit_history_record_number 
        ,audit_program 
        ,audit_effective_dt 
        ,audit_change_agency_id 
        ,policy_agency_id 
        ,installment_plan 
        ,day 
        ,deposit_amt 
        ,down 
        ,fee_amt 
        ,fee_pct 
        ,payment_plan_remark_text 
        ,utm_id 
        ,payables_id 
        ,not_posted 
        ,purge_dt 
        ,invoice_new_ren 
    )
    select   sagitem 
            ,audit_staff_cd 
            ,audit_entry_dt 
            ,audit_time_ind 
            ,audit_cd 
            ,audit_history_record_number 
            ,audit_program 
            ,audit_effective_dt 
            ,audit_change_agency_id 
            ,policy_agency_id 
            ,installment_plan 
            ,day 
            ,deposit_amt 
            ,down 
            ,fee_amt 
            ,fee_pct 
            ,payment_plan_remark_text 
            ,utm_id 
            ,payables_id 
            ,not_posted 
            ,purge_dt 
            ,invoice_new_ren 
    from    sagitta.stg_premiums 
    on conflict (sagitem) do update 
    set      audit_staff_cd                 = excluded.audit_staff_cd 
            ,audit_entry_dt                 = excluded.audit_entry_dt 
            ,audit_time_ind                 = excluded.audit_time_ind 
            ,audit_cd                       = excluded.audit_cd 
            ,audit_history_record_number    = excluded.audit_history_record_number 
            ,audit_program                  = excluded.audit_program 
            ,audit_effective_dt             = excluded.audit_effective_dt 
            ,audit_change_agency_id         = excluded.audit_change_agency_id 
            ,policy_agency_id               = excluded.policy_agency_id 
            ,installment_plan               = excluded.installment_plan 
            ,day                            = excluded.day 
            ,deposit_amt                    = excluded.deposit_amt 
            ,down                           = excluded.down 
            ,fee_amt                        = excluded.fee_amt 
            ,fee_pct                        = excluded.fee_pct 
            ,payment_plan_remark_text       = excluded.payment_plan_remark_text 
            ,utm_id                         = excluded.utm_id 
            ,payables_id                    = excluded.payables_id 
            ,not_posted                     = excluded.not_posted 
            ,purge_dt                       = excluded.purge_dt 
            ,invoice_new_ren                = excluded.invoice_new_ren 
    where   (premiums.audit_staff_cd,premiums.audit_entry_dt,premiums.audit_time_ind,premiums.audit_cd,premiums.audit_history_record_number,premiums.audit_program,premiums.audit_effective_dt,premiums.audit_change_agency_id,premiums.policy_agency_id,premiums.installment_plan,premiums.day,premiums.deposit_amt,premiums.down,premiums.fee_amt,premiums.fee_pct,premiums.payment_plan_remark_text,premiums.utm_id,premiums.payables_id,premiums.not_posted,premiums.purge_dt,premiums.invoice_new_ren) 
        is distinct from    (excluded.audit_staff_cd,excluded.audit_entry_dt,excluded.audit_time_ind,excluded.audit_cd,excluded.audit_history_record_number,excluded.audit_program,excluded.audit_effective_dt,excluded.audit_change_agency_id,excluded.policy_agency_id,excluded.installment_plan,excluded.day,excluded.deposit_amt,excluded.down,excluded.fee_amt,excluded.fee_pct,excluded.payment_plan_remark_text,excluded.utm_id,excluded.payables_id,excluded.not_posted,excluded.purge_dt,excluded.invoice_new_ren); 

    get diagnostics rc = row_count;

    return rc;
end;
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.sp_premiums_upsert() owner to mj_admin;
go 

grant execute on function sagitta.sp_premiums_upsert() to rl_sagitta_x;
go 