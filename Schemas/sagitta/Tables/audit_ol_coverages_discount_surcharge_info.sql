create table sagitta.audit_ol_coverages_discount_surcharge_info(
     sagitem                                    int             not null 
    ,lis                                        int             not null 
    ,old_discount_surcharge_code                text            null 
    ,new_discount_surcharge_code                text            null 
    ,old_discount_surcharge_desc                text            null 
    ,new_discount_surcharge_desc                text            null 
    ,old_discount_surcharge_rate                text            null 
    ,new_discount_surcharge_rate                text            null 
    ,old_discount_surcharge_pct                 text            null 
    ,new_discount_surcharge_pct                 text            null 
    ,old_discount_surcharge_premium             text            null 
    ,new_discount_surcharge_premium             text            null 
    ,old_discount_surcharge_remarks             text            null 
    ,new_discount_surcharge_remarks             text            null 
    ,audit_action                               char(1)         not null 
    ,audit_user                                 text            not null            default current_user 
    ,audit_timestamp                            timestamp       not null            default timezone('utc'::text, clock_timestamp()) 
    ,audit_id                                   bigint          not null            generated always as identity            primary key 
);
go 

/*** PERMISSIONS ***/
alter table sagitta.audit_ol_coverages_discount_surcharge_info owner to mj_admin;
go 

grant insert on sagitta.audit_ol_coverages_discount_surcharge_info to rl_sagitta_a;
go 
