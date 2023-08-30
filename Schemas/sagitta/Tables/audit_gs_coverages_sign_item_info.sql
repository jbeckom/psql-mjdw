create table sagitta.audit_gs_coverages_sign_item_info (
     sagitem                                int             not null 
    ,lis                                    int             not null 
    ,old_sign_item_number                   text            null 
    ,new_sign_item_number                   text            null 
    ,old_sign_location_agency_id            text            null 
    ,new_sign_location_agency_id            text            null 
    ,old_sign_sub_location                  text            null 
    ,new_sign_sub_location                  text            null 
    ,old_inside_outside_sign_cd             text            null 
    ,new_inside_outside_sign_cd             text            null 
    ,old_sign_limit_amt                     text            null 
    ,new_sign_limit_amt                     text            null 
    ,old_sign_deductible                    text            null 
    ,new_sign_deductible                    text            null 
    ,old_sign_descriptions                  text            null 
    ,new_sign_descriptions                  text            null 
    ,old_sign_1_desc_remark_text            text            null 
    ,new_sign_1_desc_remark_text            text            null 
    ,old_sign_2_desc_remark_text            text            null 
    ,new_sign_2_desc_remark_text            text            null 
    ,audit_action                           char(1)         not null 
    ,audit_user                             text            not null            default current_user 
    ,audit_timestamp                        timestamp       not null            default timezone('utc'::text, clock_timestamp()) 
    ,audit_id                               bigint          not null            generated always as identity            primary key 
);
go 

/*** PERMISSIONS ***/
alter table sagitta.audit_gs_coverages_sign_item_info owner to mj_admin;
go 

grant insert on sagitta.audit_gs_coverages_sign_item_info to rl_sagitta_a;
go 
