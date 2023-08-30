create table sagitta.chart_of_accounts_master_allocation_info (
     sagitem                        text            null 
    ,alloc_gl_acct_number           text            null 
    ,allocation_pct                 text            null 
    ,constraint chart_of_accounts_master_allocation_info_pkey   primary key (sagitem)
);
go 

/*** PERMISSIONS ***/
alter table sagitta.chart_of_accounts_master_allocation_info owner to mj_admin;
go 

grant select on sagitta.chart_of_accounts_master_allocation_info to rl_sagitta_r;
go 

grant insert on sagitta.chart_of_accounts_master_allocation_info to rl_sagitta_a;
go 

grant update on sagitta.chart_of_accounts_master_allocation_info to rl_sagitta_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on sagitta.chart_of_accounts_master_allocation_info for each row execute function sagitta.tr_audit_chart_of_accounts_master_allocation_info_d();
go 

create trigger audit_i after insert on sagitta.chart_of_accounts_master_allocation_info for each row execute function sagitta.tr_audit_chart_of_accounts_master_allocation_info_i();
go 

create trigger audit_u after update on sagitta.chart_of_accounts_master_allocation_info for each row when (old is distinct from new) execute function sagitta.tr_audit_chart_of_accounts_master_allocation_info_u();
go 