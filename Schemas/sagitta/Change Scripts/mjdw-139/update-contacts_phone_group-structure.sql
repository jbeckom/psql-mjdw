ALTER TABLE sagitta.contacts_phone_group 
	DROP COLUMN IF EXISTS modify_dt;
GO 

DROP FUNCTION IF EXISTS sagitta.sp_contacts_phone_group_delete(int);
GO 

DROP FUNCTION IF EXISTS sagitta.sp_contacts_phone_group_insert(int, int, text);
GO 

CREATE OR REPLACE FUNCTION sagitta.sp_contacts_phone_group_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.contacts_phone_group (
		 sagitem
		,lis
		,"type"
		,phone_number
		,"extension"
		,primary_phone
		,mobile_number
		,primary_mobile
		,fax
		,preferred
	)
	SELECT 	 sagitem
			,lis
			,"type"
			,phone_number
			,"extension"
			,primary_phone
			,mobile_number
			,primary_mobile
			,fax
			,preferred
	FROM 	sagitta.stg_contacts_phone_group 
	ON CONFLICT (sagitem, lis) DO UPDATE 
	SET 	 "type" 			= excluded."type"
			,phone_number 		= excluded.phone_number
			,"extension" 		= excluded."extension"
			,primary_phone 		= excluded.primary_phone
			,mobile_number 		= excluded.mobile_number
			,primary_mobile 	= excluded.primary_mobile
			,fax 				= excluded.fax
			,preferred 			= excluded.preferred
	WHERE 	(contacts_phone_group."type",contacts_phone_group.phone_number,contacts_phone_group."extension",contacts_phone_group.primary_phone,contacts_phone_group.mobile_number,contacts_phone_group.primary_mobile,contacts_phone_group.fax,contacts_phone_group.preferred) 
		IS DISTINCT FROM 	(excluded."type",excluded.phone_number,excluded."extension",excluded.primary_phone,excluded.mobile_number,excluded.primary_mobile,excluded.fax,excluded.preferred);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_contacts_phone_group_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_contacts_phone_group_upsert() TO rl_sagitta_x;
GO 
