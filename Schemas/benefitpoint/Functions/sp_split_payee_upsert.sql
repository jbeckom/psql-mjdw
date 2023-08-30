create or replace function benefitpoint.sp_split_payee_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
    insert into benefitpoint.split_payee(
         split_id 
        ,payee_id 
        ,commission 
        ,override 
        ,bonus 
        ,bob 
        ,sort_order 
        ,ignore_split_team 
        ,round_to 
        ,payee_role_type 
    )
    SELECT 	 split_id 
            ,payee_id 
            ,commission::double PRECISION  
            ,override::double PRECISION  
            ,bonus::double PRECISION  
            ,bob::double PRECISION  
            ,sort_order::int  
            ,ignore_split_team::bool  
            ,round_to::bool  
            ,payee_role_type 
    from    benefitpoint.stg_split_payee 
    on conflict (split_id, payee_id) do update 
    set      commission        = excluded.commission 
            ,override           = excluded.override 
            ,bonus              = excluded.bonus 
            ,bob                = excluded.bob 
            ,sort_order         = excluded.sort_order 
            ,ignore_split_team  = excluded.ignore_split_team 
            ,round_to           = excluded.round_to 
            ,payee_role_type    = excluded.payee_role_type 
    where   (split_payee.commission,split_payee.override,split_payee.bonus,split_payee.bob,split_payee.sort_order,split_payee.ignore_split_team,split_payee.round_to,split_payee.payee_role_type) 
        is distinct from    (excluded.commission,excluded.override,excluded.bonus,excluded.bob,excluded.sort_order,excluded.ignore_split_team,excluded.round_to,excluded.payee_role_type); 

    get diagnostics rc = row_count;

    return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_split_payee_upsert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_split_payee_upsert() to rl_benefitpoint_x;
go 