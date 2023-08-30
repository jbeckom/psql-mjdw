create or replace function benefitpoint.sp_check_insert() 
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
    insert into benefitpoint.check (
         statement_id 
        ,check_number 
        ,check_date 
        ,deposit_date 
        ,payable_to 
        ,issued_by 
        ,amount 
    )
    select  statement_id 
            ,check_number 
            ,check_date::timestamp 
            ,deposit_date::timestamp 
            ,payable_to 
            ,issued_by 
            ,amount::decimal 
    from    benefitpoint.stg_check;

    get diagnostics rc  = row_count;

    return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_check_insert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_check_insert() to rl_benefitpoint_x;
go 