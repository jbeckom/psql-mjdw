ALTER TABLE sagitta.contacts_address_group 
	DROP COLUMN IF EXISTS modify_dt;
	
DROP FUNCTION IF EXISTS sagitta.sp_contacts_address_group_delete(int);
GO 

DROP FUNCTION IF EXISTS sagitta.sp_contacts_address_group_insert(int, int, text);
GO 

CREATE OR REPLACE FUNCTION sagitta.sp_contacts_address_group_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.contacts_address_group (
		 sagitem
		,lis
		,"type"
		,address
		,address_2
		,zip
		,zip_ext
		,city
		,state
		,country
		,"primary"
		,preferred
	)
	SELECT 	sagitem
			,lis
			,"type"
			,address
			,address_2
			,zip
			,zip_ext
			,city
			,state
			,country
			,"primary"
			,preferred
	FROM 	sagitta.stg_contacts_address_group 
	ON CONFLICT (sagitem, lis) DO UPDATE 
	SET 	 "type" 	= excluded."type"
			,address 	= excluded.address
			,address_2 	= excluded.address_2
			,zip 		= excluded.zip
			,zip_ext 	= excluded.zip_ext
			,city 		= excluded.city
			,state 		= excluded.state
			,country 	= excluded.country
			,"primary" 	= excluded."primary"
			,preferred 	= excluded.preferred
	WHERE 	(contacts_address_group."type",contacts_address_group.address,contacts_address_group.address_2,contacts_address_group.zip,contacts_address_group.zip_ext,contacts_address_group.city,contacts_address_group.state,contacts_address_group.country,contacts_address_group."primary",contacts_address_group.preferred) 
		IS DISTINCT FROM 	(excluded."type",excluded.address,excluded.address_2,excluded.zip,excluded.zip_ext,excluded.city,excluded.state,excluded.country,excluded."primary",excluded.preferred);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_contacts_address_group_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_contacts_address_group_upsert() TO rl_sagitta_x;
GO 
