create or replace function public.tfn_table_unique_key(_schema text, _table text)
returns table (attribute name)
language plpgsql 
as $$

begin
    return  query 
    SELECT 	att.attname 	AS attribute
    FROM 	pg_catalog.pg_constraint 	AS con
        INNER JOIN 	pg_catalog.pg_class 	AS rel
            ON rel.oid = con.conrelid
        INNER JOIN 	pg_catalog.pg_namespace 	AS nsp
            ON nsp.oid = con.connamespace
        INNER JOIN pg_catalog.pg_attribute 	AS att
            ON att.attrelid = rel.oid
    WHERE 	nsp.nspname = _schema
        AND rel.relname = _table
        AND con.contype = 'u'
        AND att.attnum = ANY(con.conkey);
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function public.tfn_table_unique_key(text,text) owner to mj_admin;
go 

grant execute on function public.tfn_table_unique_key(text,text) to rl_public_x;
go 