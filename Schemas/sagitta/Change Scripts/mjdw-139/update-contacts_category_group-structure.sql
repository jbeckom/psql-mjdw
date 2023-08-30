ALTER TABLE sagitta.contacts_category_group 
	DROP COLUMN IF EXISTS modify_dt;
GO 

DROP FUNCTION IF EXISTS sagitta.sp_contacts_category_group_delete(int);
GO 

DROP FUNCTION IF EXISTS sagitta.sp_contacts_category_group_insert(int,int,text);
GO 

CREATE OR REPLACE FUNCTION sagitta.sp_contacts_category_group_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.contacts_category_group (
		 sagitem
		,lis
		,category_cd
		,category_desc
	)
	SELECT 	 sagitem
			,lis
			,category_cd
			,category_desc
	FROM 	sagitta.stg_contacts_category_group 
	ON CONFLICT (sagitem, lis) DO UPDATE 
	SET 	 category_cd 	= excluded.category_cd 
			,category_desc 	= excluded.category_desc
	WHERE 	(contacts_category_group.category_cd, contacts_category_group.category_desc) 
		IS DISTINCT FROM 	(excluded.category_cd, excluded.category_desc);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_contacts_category_group_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_contacts_category_group_upsert() TO rl_sagitta_x;
GO 
