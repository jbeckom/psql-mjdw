create table sagitta.ol_coverages_discount_surcharge_info(
     sagitem                                int             not null 
    ,lis                                    int             not null 
    ,discount_surcharge_code                text            null 
    ,discount_surcharge_desc                text            null 
    ,discount_surcharge_rate                text            null 
    ,discount_surcharge_pct                 text            null 
    ,discount_surcharge_premium             text            null 
    ,discount_surcharge_remarks             text            null 
    ,constraint ol_coverages_discount_surcharge_info_pkey   primary key (sagitem,lis)
);
go 

/*** PERMISSIONS ***/
alter table sagitta.ol_coverages_discount_surcharge_info owner to mj_admin;
go 

grant select on sagitta.ol_coverages_discount_surcharge_info to rl_sagitta_r;
go 

grant insert on sagitta.ol_coverages_discount_surcharge_info to rl_sagitta_a;
go 

grant update on sagitta.ol_coverages_discount_surcharge_info to rl_sagitta_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on sagitta.ol_coverages_discount_surcharge_info for each row execute function sagitta.tr_audit_ol_coverages_discount_surcharge_info_d();
go 

create trigger audit_i after insert on sagitta.ol_coverages_discount_surcharge_info for each row execute function sagitta.tr_audit_ol_coverages_discount_surcharge_info_i();
go 

create trigger audit_u after update on sagitta.ol_coverages_discount_surcharge_info for each row when (old is distinct from new) execute function sagitta.tr_audit_ol_coverages_discount_surcharge_info_u();
go 