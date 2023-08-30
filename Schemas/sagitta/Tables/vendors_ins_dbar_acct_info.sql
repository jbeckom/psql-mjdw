create table sagitta.vendors_ins_dbar_acct_info (
     sagitem                        text            not null 
    ,lis                            int             not null 
    ,ins_dbar_acct_number           text            null 
    ,ins_dbar_dept_ind              text            null 
    ,constraint vendors_ins_dbar_acct_info_pkey  primary key (sagitem,lis)
);
go 

/*** PERMISSIONS ***/
alter table sagitta.vendors_ins_dbar_acct_info owner to mj_admin;
go 

grant select on sagitta.vendors_ins_dbar_acct_info to rl_sagitta_r;
go 

grant insert on sagitta.vendors_ins_dbar_acct_info to rl_sagitta_a;
go 

grant update on sagitta.vendors_ins_dbar_acct_info to rl_sagitta_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on sagitta.vendors_ins_dbar_acct_info for each row execute function sagitta.tr_audit_vendors_ins_dbar_acct_info_d();
go 

create trigger audit_i after insert on sagitta.vendors_ins_dbar_acct_info for each row execute function sagitta.tr_audit_vendors_ins_dbar_acct_info_i();
go 

create trigger audit_u after update on sagitta.vendors_ins_dbar_acct_info for each row when (old is distinct from new) execute function sagitta.tr_audit_vendors_ins_dbar_acct_info_u();
go 