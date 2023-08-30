create or replace function sagitta.tr_audit_um_coverages_cov_extension_info_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_um_coverages_cov_extension_info (
         sagitem 
        ,lis 
        ,new_cov_extension
        ,new_cov_extension_first_limit
        ,new_cov_extension_first_ded
        ,new_cov_extension_second_limit
        ,new_cov_extension_second_ded
        ,new_cov_extension_form
        ,new_cov_extension_edition_date
        ,new_cov_extension_premium
        ,new_cov_extension_description
        ,audit_action
    )
    select   new.sagitem 
            ,new.lis 
            ,new.cov_extension
            ,new.cov_extension_first_limit
            ,new.cov_extension_first_ded
            ,new.cov_extension_second_limit
            ,new.cov_extension_second_ded
            ,new.cov_extension_form
            ,new.cov_extension_edition_date
            ,new.cov_extension_premium
            ,new.cov_extension_description
            ,'D'; 
    return old;
end; 
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_um_coverages_cov_extension_info_i() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_um_coverages_cov_extension_info_i() to rl_sagitta_x;
go 
