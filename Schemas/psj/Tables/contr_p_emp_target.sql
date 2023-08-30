create table if not exists psj.contr_p_emp_target (
     fiscal_year                    int                         not null 
    ,division_name                  bigint                      not null            references division_name(name_id)
    ,target                         int                         not null 
    ,contr_p_emp_target_id          bigint                      not null            generated always as identity            primary key 
    ,constraint contr_p_emp_target_fiscal_year_division_uq     unique (fiscal_year,division_name)   -- can this be constrained in another way?
);
go 

/*** PERMISSIONS ***/
alter table psj.contr_p_emp_target owner to mj_admin;
go 

grant select on psj.contr_p_emp_target to rl_psj_r;
go 

grant insert on psj.contr_p_emp_target to rl_psj_a;
go 

grant update on psj.contr_p_emp_target to rl_psj_w;
go 
