CREATE OR REPLACE FUNCTION powerapps.sp_account_phone_link (_account_source TEXT, _source_key TEXT)
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc int;
	
BEGIN 
		rc := 0;
	
		INSERT INTO powerapps.account_phone (account_guid, phone_guid, phone_type, ap_owner)
		SELECT 	acct.guid, phn.guid, phn.phone_type, phn.phone_owner
		FROM 	powerapps.account 	AS acct 
			INNER JOIN 	powerapps.phone 	AS phn
				ON 	acct.account_source 	= phn.phone_source 
				AND acct.source_key 		= phn.source_key 
		WHERE 	acct.account_source = upper(_account_source) 
			AND acct.source_key 	= _source_key
		ON CONFLICT (account_guid, phone_guid, phone_type) DO UPDATE 
			SET 	 ap_owner 	= excluded.ap_owner 
					,modify_dt 	= timezone('utc'::TEXT, clock_timestamp())
					,is_dirty 	= TRUE 
		WHERE (account_phone.ap_owner)
			IS DISTINCT FROM (excluded.ap_owner);
		
		GET DIAGNOSTICS rc = row_count;
	
		RETURN rc;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.sp_account_phone_link (TEXT, TEXT ) OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.sp_account_phone_link TO rl_powerapps_x;
GO