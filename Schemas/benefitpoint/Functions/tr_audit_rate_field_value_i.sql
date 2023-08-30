create or replace function benefitpoint.tr_audit_rate_field_value_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_rate_field_value (
         rate_id 
        ,rate_field_id 
        ,new_multi_value_index 
        ,new_value_num 
        ,new_value_text 
        ,new_age_band_index 
        ,new_age_band_gender 
        ,audit_action 
    )
    select   new.rate_id 
            ,new.rate_field_id 
            ,new.multi_value_index 
            ,new.value_num 
            ,new.value_text 
            ,new.age_band_index 
            ,new.age_band_gender 
            ,'I';  
    return new; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_rate_field_value_i() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_rate_field_value_i() to rl_benefitpoint_x;
go 