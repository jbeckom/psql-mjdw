ALTER TABLE sagitta.contacts_website_group 
	DROP COLUMN IF EXISTS modify_dt;
GO 

DROP FUNCTION IF EXISTS sagitta.sp_contacts_website_group_delete(int);
GO 

DROP FUNCTION IF EXISTS sagitta.sp_contacts_website_group_insert(int, int, text);
GO 

CREATE OR REPLACE FUNCTION sagitta.sp_contacts_website_group_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.contacts_website_group (
		 sagitem
		,lis
		,"type"
		,website
		,"primary"
		,preferred
	)
	SELECT 	 sagitem
			,lis
			,"type"
			,website
			,"primary"
			,preferred
	FROM 	sagitta.stg_contacts_website_group 
	ON CONFLICT (sagitem, lis) DO UPDATE 
	SET 	 "type" 	= excluded."type"
			,website 	= excluded.website
			,"primary" 	= excluded."primary"
			,preferred 	= excluded.preferred
	WHERE 	(contacts_website_group."type",contacts_website_group.website,contacts_website_group."primary",contacts_website_group.preferred) 
		IS DISTINCT FROM 	(excluded."type",excluded.website,excluded."primary",excluded.preferred);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_contacts_website_group_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_contacts_website_group_upsert() TO rl_sagitta_x;
GO 
