do 
$$ 
begin 
    if not exists (select from pg_catalog.pg_roles where rolname = 'rl_psj_c')
        then create role rl_psj_c;
    end if;
end; 
$$; 
go 

/*** PERMISSIONS ***/
grant usage on schema psj to rl_psj_c;
go 

grant create on schema psj to rl_psj_c;
go 