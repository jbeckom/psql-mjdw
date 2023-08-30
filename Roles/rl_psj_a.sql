do 
$$ 
begin 
    if not exists (select from pg_catalog.pg_roles where rolname = 'rl_psj_a')
        then create role rl_psj_a;
    end if;
end; 
$$; 
go 

/*** PERMISSIONS ***/
grant usage on schema psj to rl_psj_a;
go 
