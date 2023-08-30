create or replace function sagitta.tfn_vendors_last_entry()
returns table (last_mod_date int, last_mod_time int)
language plpgsql 
as $$

begin 
    return query 
    select   max(audit_entry_dt)         as last_mod_date
            ,(
                select  max(audit_time)
                from    sagitta.vendors 
                where   audit_entry_dt = (select max(audit_entry_dt) from sagitta.vendors)
            )                             as last_mod_time
    from    sagitta.vendors;
end;
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.tfn_vendors_last_entry() owner to mj_admin;
go 

grant execute on function sagitta.tfn_vendors_last_entry() to rl_sagitta_x;
go 