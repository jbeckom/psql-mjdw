create or replace function sagitta.tr_audit_um_coverages_cov_extension_info_u() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_um_coverages_cov_extension_info (
         sagitem 
        ,lis 
        ,old_cov_extension
        ,new_cov_extension
        ,old_cov_extension_first_limit
        ,new_cov_extension_first_limit
        ,old_cov_extension_first_ded
        ,new_cov_extension_first_ded
        ,old_cov_extension_second_limit
        ,new_cov_extension_second_limit
        ,old_cov_extension_second_ded
        ,new_cov_extension_second_ded
        ,old_cov_extension_form
        ,new_cov_extension_form
        ,old_cov_extension_edition_date
        ,new_cov_extension_edition_date
        ,old_cov_extension_premium
        ,new_cov_extension_premium
        ,old_cov_extension_description
        ,new_cov_extension_description
        ,audit_action
    )
    select   old.sagitem 
            ,old.lis 
            ,old.cov_extension
            ,new.cov_extension
            ,old.cov_extension_first_limit
            ,new.cov_extension_first_limit
            ,old.cov_extension_first_ded
            ,new.cov_extension_first_ded
            ,old.cov_extension_second_limit
            ,new.cov_extension_second_limit
            ,old.cov_extension_second_ded
            ,new.cov_extension_second_ded
            ,old.cov_extension_form
            ,new.cov_extension_form
            ,old.cov_extension_edition_date
            ,new.cov_extension_edition_date
            ,old.cov_extension_premium
            ,new.cov_extension_premium
            ,old.cov_extension_description
            ,new.cov_extension_description
            ,'U'; 
    return old;
end; 
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_um_coverages_cov_extension_info_u() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_um_coverages_cov_extension_info_u() to rl_sagitta_x;
go 
