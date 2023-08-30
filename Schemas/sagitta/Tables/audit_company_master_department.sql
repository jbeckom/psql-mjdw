drop table if exists sagitta.audit_company_master_department; 

create table if not exists sagitta.audit_company_master_department (
     sagitem                            int             not null 
    ,lis                                int             not null 
    ,old_dept_cd                        text            null 
    ,new_dept_cd                        text            null 
    ,old_dept_name                      text            null 
    ,new_dept_name                      text            null 
    ,old_phone_number                   text            null 
    ,new_phone_number                   text            null 
    ,old_addr_1                         text            null 
    ,new_addr_1                         text            null 
    ,old_addr_2                         text            null 
    ,new_addr_2                         text            null 
    ,old_postal_code                    text            null 
    ,new_postal_code                    text            null 
    ,old_postal_extension_code          text            null 
    ,new_postal_extension_code          text            null 
    ,old_city                           text            null 
    ,new_city                           text            null 
    ,old_state_prov_cd                  text            null 
    ,new_state_prov_cd                  text            null 
    ,old_cb_acct_meth                   text            null 
    ,new_cb_acct_meth                   text            null 
    ,old_create_ins_rec_yn_cd           text            null 
    ,new_create_ins_rec_yn_cd           text            null 
    ,audit_action                       char(1)         not null 
    ,audit_user                         text            not null            default current_user 
    ,audit_timestamp                    timestamp       not null            default timezone('utc'::text, clock_timestamp())
    ,audit_id                           bigint          not null            generated always as identity            primary key 
);
go 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_company_master_department OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE sagitta.audit_company_master_department TO rl_sagitta_a;
GO 
