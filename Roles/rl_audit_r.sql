do 
$$
begin 
    if not exists (select from pg_catalog.pg_roles where rolname = 'rl_audit_r')
        then create role rl_audit_r;
    end if;
end; 
$$; 
go 

grant usage on schema audit to rl_audit_r;
go 