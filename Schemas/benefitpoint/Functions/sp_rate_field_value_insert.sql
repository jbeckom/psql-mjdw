create or replace function benefitpoint.sp_rate_field_value_insert() 
returns int 
language plpgsql 
as $$ 

declare rc int; 

begin 
    insert into benefitpoint.rate_field_value (
         rate_id 
        ,rate_field_id 
        ,multi_value_index 
        ,value_num 
        ,value_text 
        ,age_band_index 
        ,age_band_gender 
    )
    select   rate_id 
            ,rate_field_id 
            ,multi_value_index 
            ,value_num::double precision 
            ,value_text 
            ,age_band_index::int 
            ,age_band_gender 
    from    benefitpoint.stg_rate_field_value; 

    get diagnostics rc = row_count;

    return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_rate_field_value_insert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_rate_field_value_insert() to rl_benefitpoint_x;
go 