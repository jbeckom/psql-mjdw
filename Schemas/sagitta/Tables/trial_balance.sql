drop table if exists sagitta.trial_balance;
go

create table if not exists sagitta.trial_balance (
     period                 date                        not null 
    ,ledger                 text                        not null 
    ,description            text                        null 
    ,ledger_type            text                        null 
    ,start_bal              double precision            null 
    ,this_period            double precision            null 
    ,end_balance            double precision            null 
    ,prior_beg_bal          double precision            null 
    ,prior_period           double precision            null 
    ,prior_end_bal          double precision            null 
    ,id                     bigint                      not null            generated always as identity            primary key 
    ,constraint trial_balance_period_ledger_uq  unique (period,ledger)
);
go 

/*** PERMISSIONS ***/
alter table sagitta.trial_balance owner to mj_admin;
go 

grant select on sagitta.trial_balance to rl_sagitta_r;
go 

grant insert on sagitta.trial_balance to rl_sagitta_a;
go 

grant update on sagitta.trial_balance to rl_sagitta_w;
go 

/*** TRIGGERS ***/
create trigger log_change_iud after insert or update or delete on sagitta.trial_balance for each row execute function audit.tr_sagitta_log_change();
go 