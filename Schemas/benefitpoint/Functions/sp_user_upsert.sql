CREATE OR REPLACE FUNCTION benefitpoint.sp_user_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO benefitpoint."user" (
		 user_id
		,office_id
		,username
		,first_name
		,last_name
		,title
		,roles
		,notes
		,last_modified_on
		,last_login_on
		,last_lockout_on
		,created_on
	)
	SELECT 	 user_id::int
			,office_id::int
			,username
			,first_name
			,last_name
			,title
			,roles
			,notes
			,last_modified_on::timestamptz
			,last_login_on::timestamptz
			,last_lockout_on::timestamptz
			,created_on::timestamptz
	FROM 	benefitpoint.stg_user 
	ON CONFLICT (user_id) DO UPDATE 
	SET 	 office_id 			= excluded.office_id
			,username 			= excluded.username
			,first_name 		= excluded.first_name
			,last_name 			= excluded.last_name
			,title 				= excluded.title
			,roles 				= excluded.roles
			,notes 				= excluded.notes
			,last_modified_on 	= excluded.last_modified_on
			,last_login_on 		= excluded.last_login_on
			,last_lockout_on 	= excluded.last_lockout_on
			,created_on 		= excluded.created_on 
	WHERE 	("user".office_id,"user".username,"user".first_name,"user".last_name,"user".title,"user".roles,"user".notes,"user".last_modified_on,"user".last_login_on,"user".last_lockout_on,"user".created_on) 
		IS DISTINCT FROM 	(excluded.office_id,excluded.username,excluded.first_name,excluded.last_name,excluded.title,excluded.roles,excluded.notes,excluded.last_modified_on,excluded.last_login_on,excluded.last_lockout_on,excluded.created_on);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_user_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_user_upsert() TO rl_benefitpoint_x;
GO 
