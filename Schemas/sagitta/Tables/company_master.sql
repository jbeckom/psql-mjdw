drop table if exists sagitta.company_master;

create table if not exists sagitta.company_master (
     sagitem                                int             not null 
    ,audit_staff_cd                         text            null 
    ,audit_entry_dt                         int             null 
    ,audit_time                             int             null 
    ,audit_cd                               text            null 
    ,audit_history_record_number            text            null 
    ,audit_program                          text            null 
    ,division_name                          text            null 
    ,addr_1                                 text            null 
    ,addr_2                                 text            null 
    ,postal_code                            text            null 
    ,postal_extension_code                  text            null 
    ,phone_1_number                         text            null 
    ,phone_2_number                         text            null 
    ,gl_format                              text            null 
    ,division_gl_suspense_acct              text            null 
    ,prefill_acord_forms_yn_cd              text            null 
    ,fax_number                             text            null 
    ,ny_license_code                        text            null 
    ,constraint company_master_pkey     primary key (sagitem)
);
go 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.company_master OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE sagitta.company_master TO rl_sagitta_r;
GO 

GRANT INSERT ON TABLE sagitta.company_master TO rl_sagitta_a;
GO 

GRANT UPDATE ON TABLE sagitta.company_master TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.company_master FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_company_master_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.company_master FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_company_master_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.company_master FOR EACH ROW WHEN (NEW IS DISTINCT FROM OLD) EXECUTE FUNCTION sagitta.tr_audit_company_master_u();
GO 
