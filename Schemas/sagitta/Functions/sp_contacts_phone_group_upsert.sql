CREATE OR REPLACE FUNCTION sagitta.sp_contacts_phone_group_upsert(_sagitem int, _lis int, _xmldata TEXT)
RETURNS int 
LANGUAGE plpgsql
AS $$

DECLARE 
	rc 	int;

BEGIN 
	rc := 0;

	WITH xmldata AS (SELECT _xmldata::XML AS exemel)
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
	SELECT 	 _sagitem 	AS sagitem 
			,_lis 		AS lis 
			,REPLACE(regexp_replace(UNNEST(xpath('/PhoneGroup/Type/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 			AS "type"
			,REPLACE(regexp_replace(UNNEST(xpath('/PhoneGroup/PhoneNumber/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 	AS phone_number 
			,REPLACE(regexp_replace(UNNEST(xpath('/PhoneGroup/Extension/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 		AS "extension" 
			,REPLACE(regexp_replace(UNNEST(xpath('/PhoneGroup/PrimaryPhone/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 	AS primary_phone 
			,REPLACE(regexp_replace(UNNEST(xpath('/PhoneGroup/MobileNumber/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 	AS mobile_number 
			,REPLACE(regexp_replace(UNNEST(xpath('/PhoneGroup/PrimaryMobile/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 	AS primary_mobile 
			,REPLACE(regexp_replace(UNNEST(xpath('/PhoneGroup/Fax/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 			AS fax 
			,REPLACE(regexp_replace(UNNEST(xpath('/PhoneGroup/Preferred/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 		AS preferred 
	FROM 	xmldata;

	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_contacts_phone_group_upsert (int, int, TEXT) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_contacts_phone_group_upsert(int, int, text) TO rl_sagitta_x;
GO 
