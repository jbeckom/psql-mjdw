create table sagitta.gs_coverages_sign_item_info (
     sagitem                            int             not null 
    ,lis                                int             not null 
    ,sign_item_number                   text            null 
    ,sign_location_agency_id            text            null 
    ,sign_sub_location                  text            null 
    ,inside_outside_sign_cd             text            null 
    ,sign_limit_amt                     text            null 
    ,sign_deductible                    text            null 
    ,sign_descriptions                  text            null 
    ,sign_1_desc_remark_text            text            null 
    ,sign_2_desc_remark_text            text            null 
    ,constraint gs_coverages_sign_item_info_pkey    primary key (sagitem,lis)
);
go 

/*** PERMISSIONS ***/
alter table sagitta.gs_coverages_sign_item_info owner to mj_admin;
go 

grant select on sagitta.gs_coverages_sign_item_info to rl_sagitta_r;
go 

grant insert on sagitta.gs_coverages_sign_item_info to rl_sagitta_a;
go 

grant update on sagitta.gs_coverages_sign_item_info to rl_sagitta_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on sagitta.gs_coverages_sign_item_info for each row execute function sagitta.tr_audit_gs_coverages_sign_item_info_d();
go 

create trigger audit_i after insert on sagitta.gs_coverages_sign_item_info for each row execute function sagitta.tr_audit_gs_coverages_sign_item_info_i();
go 

create trigger audit_u after update on sagitta.gs_coverages_sign_item_info for each row when (old is distinct from new) execute function sagitta.tr_audit_gs_coverages_sign_item_info_u();
go 