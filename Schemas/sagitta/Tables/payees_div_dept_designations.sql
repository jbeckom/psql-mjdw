create table sagitta.payees_div_dept_designations(
     sagitem                    text            not null 
    ,lis                        int             not null 
    ,valid_div                  text            null 
    ,valid_dept                 text            null 
    ,limit_new                  text            null 
    ,limit_new_date             text            null 
    ,limit_renew                text            null 
    ,limit_renew_date           text            null 
    ,constraint payees_div_dept_designations_pkey   primary key (sagitem,lis)
);
go 

/*** PERMISSIONS ***/
alter table sagitta.payees_div_dept_designations owner to mj_admin;
go 

grant select on sagitta.payees_div_dept_designations to rl_sagitta_r;
go 

grant insert on sagitta.payees_div_dept_designations to rl_sagitta_a;
go 

grant update on sagitta.payees_div_dept_designations to rl_sagitta_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on sagitta.payees_div_dept_designations for each row execute function sagitta.tr_audit_payees_div_dept_designations_d();
go

create trigger audit_i after insert on sagitta.payees_div_dept_designations for each row execute function sagitta.tr_audit_payees_div_dept_designations_i();
go 

create trigger audit_u after update on sagitta.payees_div_dept_designations for each row when (old is distinct from new) execute function sagitta.tr_audit_payees_div_dept_designations_u();
go 