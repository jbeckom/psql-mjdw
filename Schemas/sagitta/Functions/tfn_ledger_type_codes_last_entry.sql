create or replace function sagitta.tfn_ledger_type_codes_last_entry() 
returns table (last_mod_date int, last_mod_time int)
language plpgsql 
as $$

begin 
    return query 
    select   max(audit_entry_dt)             as last_mod_date 
            ,(
                select  max(audit_time)
                from    sagitta.ledger_type_codes 
                where   audit_entry_dt = (select max(audit_entry_dt) from sagitta.ledger_type_codes)
            )             as last_mod_time
    from    sagitta.ledger_type_codes;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.tfn_ledger_type_codes_last_entry() owner to mj_admin;
go 