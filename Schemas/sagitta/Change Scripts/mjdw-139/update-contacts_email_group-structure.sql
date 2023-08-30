ALTER TABLE sagitta.contacts_email_group 
	DROP COLUMN IF EXISTS modify_dt;
GO 

DROP FUNCTION IF EXISTS sagitta.sp_contacts_email_group_delete(int);
GO 

DROP FUNCTION IF EXISTS sagitta.sp_contacts_email_group_insert(int, int, text);
GO 

CREATE OR REPLACE FUNCTION sagitta.sp_contacts_email_group_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.contacts_email_group (
		 sagitem
		,lis
		,"type"
		,email_address
		,"primary"
		,preferred
	)
	SELECT 	 sagitem
			,lis
			,"type"
			,email_address
			,"primary"
			,preferred
	FROM 	sagitta.stg_contacts_email_group 
	ON CONFLICT (sagitem, lis) DO UPDATE 
	SET 	 "type" 		= excluded."type"
			,email_address 	= excluded.email_address
			,"primary" 		= excluded."primary"
			,preferred 		= excluded.preferred
	WHERE 	(contacts_email_group."type",contacts_email_group.email_address,contacts_email_group."primary",contacts_email_group.preferred) 
		IS DISTINCT FROM 	(excluded."type",excluded.email_address,excluded."primary",excluded.preferred);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_contacts_email_group_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_contacts_email_group_upsert() TO rl_sagitta_x;
GO 
