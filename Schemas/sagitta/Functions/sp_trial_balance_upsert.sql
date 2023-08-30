create or replace function sagitta.sp_trial_balance_upsert() 
returns int 
language plpgsql 
as $$

declare rc int;

begin 
    insert into sagitta.trial_balance (
         period 
        ,ledger 
        ,description 
        ,ledger_type 
        ,start_bal 
        ,this_period 
        ,end_balance 
        ,prior_beg_bal 
        ,prior_period 
        ,prior_end_bal 
    )
    select   period 
            ,ledger 
            ,description 
            ,ledger_type 
            ,start_bal 
            ,this_period 
            ,end_balance 
            ,prior_beg_bal 
            ,prior_period 
            ,prior_end_bal 
    from    sagitta.stg_trial_balance 
    on conflict (period,ledger) do update 
    set      description    = excluded.description 
            ,ledger_type    = excluded.ledger_type 
            ,start_bal      = excluded.start_bal 
            ,this_period    = excluded.this_period 
            ,end_balance    = excluded.end_balance 
            ,prior_beg_bal  = excluded.prior_beg_bal 
            ,prior_period   = excluded.prior_period 
            ,prior_end_bal  = excluded.prior_end_bal 
    where   (trial_balance.description,trial_balance.ledger_type,trial_balance.start_bal,trial_balance.this_period,trial_balance.end_balance,trial_balance.prior_beg_bal,trial_balance.prior_period,trial_balance.prior_end_bal) 
        is distinct from    (excluded.description,excluded.ledger_type,excluded.start_bal,excluded.this_period,excluded.end_balance,excluded.prior_beg_bal,excluded.prior_period,excluded.prior_end_bal); 

    get diagnostics rc = row_count;

    return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.sp_trial_balance_upsert() owner to mj_admin;
go 

grant execute on function sagitta.sp_trial_balance_upsert() to rl_sagitta_x;
go 