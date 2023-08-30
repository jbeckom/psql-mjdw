CREATE OR REPLACE FUNCTION sagitta.sp_contacts_category_group_upsert(_sagitem int, _lis int, _xmldata text) 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;

BEGIN 
	rc := 0;

	WITH xmldata AS (SELECT _xmldata::XML AS exemel)
	INSERT INTO sagitta.contacts_category_group (
		 sagitem
		,lis
		,category_cd
		,category_desc
	)
	SELECT 	 _sagitem 	AS sagitem 
			,_lis 		AS lis
			,REPLACE(regexp_replace(UNNEST(xpath('/CategoryGroup/CategoryCd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 		AS category_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/CategoryGroup/CategoryDesc/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 	AS category_desc 
	FROM 	xmldata;

	GET DIAGNOSTICS rc = row_count;
	
	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_contacts_category_group_upsert(int, int, text) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_contacts_category_group_upsert(int, int, text) TO rl_sagitta_x;
GO 
