CREATE OR REPLACE FUNCTION powerapps.sp_account_fax_link (_account_source TEXT, _source_key TEXT)
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;
	
BEGIN 
	rc := 0;

	INSERT INTO powerapps.account_fax (account_guid, fax_guid, fax_type, af_owner)
	SELECT 	acct.guid, fax.guid, fax.fax_type, fax.fax_owner
	FROM 	powerapps.account 	AS acct 
		INNER JOIN 	powerapps.fax 	AS fax 
			ON 	acct.account_source 	= fax.fax_source 
			AND acct.source_key  	= fax.source_key
	WHERE 	acct.account_source 	= upper(_account_source) 
		AND acct.source_key  		= _source_key 
	ON CONFLICT (account_guid, fax_guid, fax_type) DO UPDATE 
		SET 	 af_owner 	= excluded.af_owner 
				,modify_dt 	= timezone('utc'::TEXT, clock_timestamp())
				,is_dirty 	= TRUE 
		WHERE 	(account_fax.af_owner)
			IS DISTINCT FROM (excluded.af_owner);
		
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.sp_account_fax_link (TEXT, TEXT) OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.sp_account_fax_link TO rl_powerapps_x;
GO