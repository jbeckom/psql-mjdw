CREATE OR REPLACE FUNCTION sagitta.sp_contacts_address_group_upsert(_sagitem int, _lis int, _xmldata text)
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE 
	rc 	int;

BEGIN 
	rc := 0;

	WITH xmldata AS (SELECT _xmldata::XML AS exemel)
	INSERT INTO sagitta.contacts_address_group (
		sagitem
		,lis
		,"type"
		,address
		,address_2
		,zip
		,zip_ext
		,city
		,state
		,country
		,"primary"
		,preferred
	)
	SELECT 	 _sagitem 	AS sagitem 
			,_lis 		AS lis
			,REPLACE(regexp_replace(UNNEST(xpath('/AddressGroup/Type/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 		AS "type"
			,REPLACE(regexp_replace(UNNEST(xpath('/AddressGroup/Address/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 		AS address
			,REPLACE(regexp_replace(UNNEST(xpath('/AddressGroup/Address2/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 	AS address_2
			,REPLACE(regexp_replace(UNNEST(xpath('/AddressGroup/Zip/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 			AS zip
			,REPLACE(regexp_replace(UNNEST(xpath('/AddressGroup/ZipExt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 		AS zip_ext
			,REPLACE(regexp_replace(UNNEST(xpath('/AddressGroup/City/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 		AS city
			,REPLACE(regexp_replace(UNNEST(xpath('/AddressGroup/State/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 		AS state
			,REPLACE(regexp_replace(UNNEST(xpath('/AddressGroup/Country/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 		AS country 
			,REPLACE(regexp_replace(UNNEST(xpath('/AddressGroup/Primary/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 		AS "primary"
			,REPLACE(regexp_replace(UNNEST(xpath('/AddressGroup/Preferred/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 	AS preferred
	FROM 	xmldata;

	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_contacts_address_group_upsert(int, int, TEXT) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_contacts_address_group_upsert(int, int, text) TO rl_sagitta_x;
GO 
