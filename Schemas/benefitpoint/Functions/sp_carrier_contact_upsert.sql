CREATE OR REPLACE FUNCTION benefitpoint.sp_carrier_contact_upsert(_carrier_id int, _xmldata TEXT)
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	rc := 0;

	WITH xmldata AS (SELECT _xmldata::XML AS exemel)
	
	INSERT INTO benefitpoint.carrier_contact (
		 carrier_id 
		,all_contact 
		,title 
		,assistant_first_name 
		,assistant_last_name 
		,assistant_email 
		,market_size 
		,notes 
		,last_modified_on 
	)
	
	SELECT 	 _carrier_id 	AS carrier_id 
			,REPLACE(regexp_replace(UNNEST(xpath('/contacts/allContact/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&')::bool 				AS all_contact 
			,REPLACE(regexp_replace(UNNEST(xpath('/contacts/title/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&') 						AS title
			,REPLACE(regexp_replace(UNNEST(xpath('/contacts/assistantFirstName/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&') 			AS assistant_first_name 
			,REPLACE(regexp_replace(UNNEST(xpath('/contacts/assistantLastName/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&') 			AS assitant_last_name 
			,REPLACE(regexp_replace(UNNEST(xpath('/contacts/assistantEmail/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&') 				AS assistant_email 
			,REPLACE(regexp_replace(UNNEST(xpath('/contacts/marketSize/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&')::benefitpoint.market_size 	AS market_size 
			,REPLACE(regexp_replace(UNNEST(xpath('/contacts/notes/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&') 						AS notes 
			,REPLACE(regexp_replace(UNNEST(xpath('/contacts/lastModifiedOn/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&')::timestamptz 	AS last_modified_on 
	FROM 	xmldata 
	ON CONFLICT (carrier_id) DO UPDATE 
	SET 	 all_contact    		= excluded.all_contact 
			,title  				= excluded.title 
			,assistant_first_name   = excluded.assistant_first_name 
			,assistant_last_name    = excluded.assistant_last_name 
			,assistant_email    	= excluded.assistant_email 
			,market_size    		= excluded.market_size 
			,notes  				= excluded.notes 
			,last_modified_on   	= excluded.last_modified_on 
	WHERE 	(carrier_contact.all_contact,carrier_contact.title,carrier_contact.assistant_first_name,carrier_contact.assistant_last_name,carrier_contact.assistant_email,carrier_contact.market_size,carrier_contact.notes,carrier_contact.last_modified_on) 
		IS DISTINCT FROM 	(excluded.all_contact,excluded.title,excluded.assistant_first_name,excluded.assistant_last_name,excluded.assistant_email,excluded.market_size,excluded.notes,excluded.last_modified_on);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_carrier_contact_upsert(int, text) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_carrier_contact_upsert(int, text) TO rl_benefitpoint_x;
GO 
