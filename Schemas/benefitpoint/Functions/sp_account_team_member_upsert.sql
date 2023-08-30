CREATE OR REPLACE FUNCTION benefitpoint.sp_account_team_member_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO benefitpoint.account_team_member (
		 account_id
		,user_id
		,first_name
		,last_name
		,email
		,broker_client_role_id
		,administrator
		,primary_contact 
		,office 
		,team_role_primary
	)
	SELECT 	 account_id
			,user_id
			,first_name
			,last_name
			,email
			,broker_client_role_id
			,administrator
			,primary_contact
			,office 
			,team_role_primary
	FROM 	benefitpoint.stg_account_team_member 
	ON CONFLICT (account_id, user_id) DO UPDATE 
	SET 	 first_name 			= excluded.first_name
			,last_name 				= excluded.last_name
			,email 					= excluded.email
			,broker_client_role_id 	= excluded.broker_client_role_id
			,administrator 			= excluded.administrator
			,primary_contact 		= excluded.primary_contact
			,office 				= excluded.office 
			,team_role_primary 		= excluded.team_role_primary
	WHERE 	(account_team_member.first_name,account_team_member.last_name,account_team_member.email,account_team_member.broker_client_role_id,account_team_member.administrator,account_team_member.primary_contact,account_team_member.office,account_team_member.team_role_primary) 
		IS DISTINCT FROM 	(excluded.first_name,excluded.last_name,excluded.email,excluded.broker_client_role_id,excluded.administrator,excluded.primary_contact,excluded.office,excluded.team_role_primary);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_account_team_member_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_account_team_member_upsert() TO rl_benefitpoint_x;
GO 
