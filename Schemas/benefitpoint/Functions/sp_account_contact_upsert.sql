CREATE OR REPLACE FUNCTION benefitpoint.sp_account_contact_upsert (_account_id int, _xmldata TEXT)
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	rc := 0;

	WITH xmldata AS (SELECT _xmldata::XML AS exemel)
	
	INSERT INTO benefitpoint.account_contact(
		 account_id
		,title 
		,additional_info 
		,primary_contact 
		,primary_location_id 
		,notes 
		,last_modified_on 
	)
	
	SELECT 	 _account_id 		AS account_id 
			,REPLACE(regexp_replace(UNNEST(xpath('/contacts/title/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 						AS title 
			,REPLACE(regexp_replace(UNNEST(xpath('/contacts/additionalInfo/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 				AS additional_info 
			,REPLACE(regexp_replace(UNNEST(xpath('/contacts/primary/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&')::bool 				AS primary_contact 
			,REPLACE(regexp_replace(UNNEST(xpath('/contacts/primaryLocationID/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&')::int 		AS primary_location_id 
			,REPLACE(regexp_replace(UNNEST(xpath('/contacts/notes/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 						AS notes 
			,REPLACE(regexp_replace(UNNEST(xpath('/contacts/lastModifiedOn/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&')::timestamptz 	AS last_modified_on 
	FROM 	xmldata 
	ON CONFLICT (account_id) DO UPDATE 
	SET 	 title 					= excluded.title 
			,additional_info 		= excluded.additional_info 
			,primary_contact 		= excluded.primary_contact 
			,primary_location_id 	= excluded.primary_location_id 
			,notes 					= excluded.notes 
			,last_modified_on 		= excluded.last_modified_on 
	WHERE 	(account_contact.title,account_contact.additional_info,account_contact.primary_contact,account_contact.primary_location_id,account_contact.notes,account_contact.last_modified_on)
		IS DISTINCT FROM (excluded.title,excluded.additional_info,excluded.primary_contact,excluded.primary_location_id,excluded.notes,excluded.last_modified_on);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_account_contact_upsert (int, text) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_account_contact_upsert (int, text) TO rl_benefitpoint_x;
GO 
