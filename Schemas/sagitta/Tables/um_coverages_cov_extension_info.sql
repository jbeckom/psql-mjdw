create table sagitta.um_coverages_cov_extension_info (
     sagitem                            int             not null 
    ,lis                                int             not null 
    ,cov_extension                      text            null 
    ,cov_extension_first_limit          text            null 
    ,cov_extension_first_ded            text            null 
    ,cov_extension_second_limit         text            null 
    ,cov_extension_second_ded           text            null 
    ,cov_extension_form                 text            null 
    ,cov_extension_edition_date         text            null 
    ,cov_extension_premium              text            null 
    ,cov_extension_description          text            null 
    ,constraint um_coverages_cov_extension_info_pkey    primary key (sagitem,lis)
);
go 

/*** PERMISSIONS ***/
alter table sagitta.um_coverages_cov_extension_info owner to mj_admin;
go 

grant select on sagitta.um_coverages_cov_extension_info to rl_sagitta_r;
go 

grant insert on sagitta.um_coverages_cov_extension_info to rl_sagitta_a;
go 

grant update on sagitta.um_coverages_cov_extension_info to rl_sagitta_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on sagitta.um_coverages_cov_extension_info for each row execute function sagitta.tr_audit_um_coverages_cov_extension_info_d();
go 

create trigger audit_i after insert on sagitta.um_coverages_cov_extension_info for each row execute function sagitta.tr_audit_um_coverages_cov_extension_info_i();
go 

create trigger audit_u after update on sagitta.um_coverages_cov_extension_info for each row when (old is distinct from new) execute function sagitta.tr_audit_um_coverages_cov_extension_info_u();
go 
