--DROP FUNCTION IF EXISTS powerapps.sp_account_email_link (TEXT, TEXT );

CREATE OR REPLACE FUNCTION powerapps.sp_account_email_link(_account_source TEXT, _source_key TEXT)
RETURNS int
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;

BEGIN 
	rc := 0;

	INSERT INTO powerapps.account_email (account_guid, email_guid, email_type, ae_owner)
	SELECT 	acct.guid, email.guid, email.email_type, email.email_owner
	FROM 	powerapps.account 	AS acct 
		INNER JOIN powerapps.email 	AS email 
			ON 	acct.account_source = email.email_source
			AND acct.source_key 	= email.source_key 
	WHERE 	acct.account_source = upper(_account_source) 
		AND acct.source_key 	= _source_key 
	ON CONFLICT (account_guid, email_guid, email_type) DO UPDATE
		SET 	 ae_owner 	= excluded.ae_owner
				,modify_dt 	= timezone('utc'::TEXT, clock_timestamp())
				,is_dirty 	= TRUE
		WHERE 	(account_email.ae_owner)
			IS DISTINCT FROM (excluded.ae_owner);
		
	GET DIAGNOSTICS rc = ROW_COUNT;

	RETURN rc;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.sp_account_email_link (TEXT, TEXT ) OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.sp_account_email_link TO rl_powerapps_x;
GO