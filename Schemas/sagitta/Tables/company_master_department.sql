drop table if exists sagitta.company_master_department; 

create table if not exists sagitta.company_master_department (
     sagitem                        int             not null 
    ,lis                            int             not null 
    ,dept_cd                        text            null 
    ,dept_name                      text            null 
    ,phone_number                   text            null 
    ,addr_1                         text            null 
    ,addr_2                         text            null 
    ,postal_code                    text            null 
    ,postal_extension_code          text            null 
    ,city                           text            null 
    ,state_prov_cd                  text            null 
    ,cb_acct_meth                   text            null 
    ,create_ins_rec_yn_cd           text            null 
    ,constraint company_master_department_pkey  primary key (sagitem,lis)
);
go 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.company_master_department OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE sagitta.company_master_department TO rl_sagitta_r;
GO 

GRANT INSERT ON TABLE sagitta.company_master_department TO rl_sagitta_a;
GO 

GRANT UPDATE ON TABLE sagitta.company_master_department TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.company_master_department FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_company_master_department_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.company_master_department FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_company_master_department_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.company_master_department FOR EACH ROW WHEN (NEW IS DISTINCT FROM OLD) EXECUTE FUNCTION sagitta.tr_audit_company_master_department_u();
GO 
