create or replace function public.tfn_table_column_type(_schema text, _table text, type_id int)
returns table (attribute name)
language plpgsql 
as $$

begin 
    return  query 
    SELECT 	col.attname
    FROM 	pg_catalog.pg_namespace		AS sch
        INNER JOIN 	pg_catalog.pg_class 	AS tbl
            ON tbl.relnamespace = sch.oid
        INNER JOIN 	pg_catalog.pg_attribute 	AS  col
            ON col.attrelid = tbl.oid
    WHERE 	sch.nspname = _schema
        AND tbl.relname = _table
        AND col.attnum > 0  -- ordinary columns only
        AND col.atttypid = type_id; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function public.tfn_table_column_type(text,text,int) owner to mj_admin;
go 

grant execute on function public.tfn_table_column_type(text,text,int) to rl_public_x;
go