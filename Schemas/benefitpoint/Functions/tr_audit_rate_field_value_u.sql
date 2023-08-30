create or replace function benefitpoint.tr_audit_rate_field_value_u() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_rate_field_value (
         rate_id 
        ,rate_field_id 
        ,old_multi_value_index 
        ,new_multi_value_index 
        ,old_value_num 
        ,new_value_num 
        ,old_value_text 
        ,new_value_text 
        ,old_age_band_index 
        ,new_age_band_index 
        ,old_age_band_gender 
        ,new_age_band_gender 
        ,audit_action 
    )
    select   old.rate_id 
            ,old.rate_field_id 
            ,old.multi_value_index 
            ,new.multi_value_index 
            ,old.value_num 
            ,new.value_num 
            ,old.value_text 
            ,new.value_text 
            ,old.age_band_index 
            ,new.age_band_index 
            ,old.age_band_gender 
            ,new.age_band_gender 
            ,'U';  
    return old; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_rate_field_value_u() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_rate_field_value_u() to rl_benefitpoint_x;
go 