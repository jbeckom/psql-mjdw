CREATE OR REPLACE FUNCTION sagitta.sp_contacts_website_group_upsert(_sagitem int, _lis int, _xmldata TEXT)
RETURNS int 
LANGUAGE plpgsql
AS $$

DECLARE 
	rc 	int;

BEGIN 
	rc := 0;

	WITH xmldata AS (SELECT _xmldata::XML AS exemel)
	INSERT INTO sagitta.contacts_website_group (
		 sagitem
		,lis
		,"type"
		,website
		,"primary"
		,preferred
	)
	SELECT 	 _sagitem 	AS sagitem 
			,_lis 		AS lis
			,REPLACE(regexp_replace(UNNEST(xpath('/WebsiteGroup/Type/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 			AS "type"
			,REPLACE(regexp_replace(UNNEST(xpath('/WebsiteGroup/Website/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 			AS website 
			,REPLACE(regexp_replace(UNNEST(xpath('/WebsiteGroup/Primary/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 			AS "primary"
			,REPLACE(regexp_replace(UNNEST(xpath('/WebsiteGroup/Preferred/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 		AS preferred
	FROM 	xmldata;

	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_contacts_website_group_upsert(int, int, text) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_contacts_website_group_upsert(int, int, text) TO rl_sagitta_x;
GO 
