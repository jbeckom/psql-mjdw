DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'retool_poc')
		THEN CREATE USER retool_poc;
	END IF;
END;
$$;
GO 

/*** GROUPS / ROLES ***/
grant usage on schema p_and_c to retool_poc;
go 

grant select,insert on p_and_c.mapping_body_parts to retool_poc;
go 

grant select on p_and_c.body_parts to retool_poc;
go 

grant select on p_and_c.body_part_categories to retool_poc;
go 

grant select on p_and_c.kickouts_body_parts to retool_poc;
go 