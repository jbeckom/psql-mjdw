--DROP FUNCTION IF EXISTS powerapps.sp_account_address_link (TEXT, TEXT);

CREATE OR REPLACE FUNCTION powerapps.sp_account_address_link(_account_source TEXT, _source_key TEXT)
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;

BEGIN 
	rc := 0;
	
	INSERT INTO powerapps.account_address (account_guid, address_guid, address_type, aa_owner)
	SELECT 	acct.guid, adrs.guid, adrs.address_type, acct.account_owner 
	FROM 	powerapps.account 			AS acct 
		LEFT JOIN 	powerapps.address 	AS adrs 
			ON 	acct.account_source 	= adrs.address_source
			AND acct.source_key 		= adrs.source_key
	WHERE 	acct.account_source 		= upper(_account_source) 
		AND acct.source_key 			= _source_key
		AND ((acct.guid IS NOT NULL) AND (adrs.guid IS NOT NULL))
	ON CONFLICT (account_guid, address_guid, address_type) DO UPDATE 
		SET 	 aa_owner 	= excluded.aa_owner 
				,modify_dt 	= timezone('utc'::TEXT, clock_timestamp())
				,is_dirty 	= TRUE;
			
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.sp_account_address_link (TEXT, TEXT ) OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.sp_account_address_link TO rl_powerapps_x;
GO