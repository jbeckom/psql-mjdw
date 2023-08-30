create or replace function sagitta.tr_audit_um_coverages_cov_extension_info_d() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_um_coverages_cov_extension_info (
         sagitem 
        ,lis 
        ,old_cov_extension
        ,old_cov_extension_first_limit
        ,old_cov_extension_first_ded
        ,old_cov_extension_second_limit
        ,old_cov_extension_second_ded
        ,old_cov_extension_form
        ,old_cov_extension_edition_date
        ,old_cov_extension_premium
        ,old_cov_extension_description
        ,audit_action
    )
    select   old.sagitem 
            ,old.lis 
            ,old.cov_extension
            ,old.cov_extension_first_limit
            ,old.cov_extension_first_ded
            ,old.cov_extension_second_limit
            ,old.cov_extension_second_ded
            ,old.cov_extension_form
            ,old.cov_extension_edition_date
            ,old.cov_extension_premium
            ,old.cov_extension_description
            ,'D'; 
    return old;
end; 
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_um_coverages_cov_extension_info_d() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_um_coverages_cov_extension_info_d() to rl_sagitta_x;
go 
