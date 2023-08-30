create or replace function benefitpoint.sp_statement_insert()
returns int 
language plpgsql 
as $$

declare rc int;

begin 
    insert into benefitpoint.statement (
         statement_id 
        ,billing_carrier_id 
        ,ams360_gl_date 
        ,statement_status 
        ,statement_total 
        ,payement_method 
        ,entry_date 
        ,statement_date 
        ,accounting_month 
        ,office_id 
        ,notes 
        ,override_only 
        ,override_payee_id 
        ,range_start_on 
        ,range_end_on 
        ,use_estimated_premium 
        ,last_posted_on 
        ,voided_on 
        ,created_by_user_id 
        ,last_modified_on 
    )
    select   statement_id 
            ,billing_carrier_id 
            ,ams360_gl_date::date 
            ,statement_status 
            ,statement_total 
            ,payement_method 
            ,entry_date 
            ,statement_date 
            ,accounting_month::date 
            ,office_id::int 
            ,notes 
            ,override_only::bool 
            ,override_payee_id::int 
            ,range_start_on::timestamp 
            ,range_end_on::timestamp 
            ,use_estimated_premium::bool 
            ,last_posted_on::timestamp 
            ,voided_on::timestamp 
            ,created_by_user_id::int 
            ,last_modified_on::timestamp
    from    benefitpoint.stg_statement; 

    get diagnostics rc = row_count;

    return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_statement_insert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_statement_insert() to rl_benefitpoint_x;
go 
