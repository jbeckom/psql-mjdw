CREATE OR REPLACE FUNCTION sagitta.sp_acord_legal_entity_codes_upsert(_sagitem varchar(4), _xmldata TEXT)
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE
	rc 	int;

BEGIN 
	rc := 0;
	
	WITH xmldata AS (SELECT _xmldata::XML AS exemel)
	INSERT INTO sagitta.acord_legal_entity_codes (
		 sagitem
		,uc 
		,description 
		,date_off
		,date_off_remarks
	)
	SELECT 	 _sagitem 	AS sagitem 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/a2/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 	AS uc
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/a3/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 	AS description 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/a4/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 	AS date_off
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/a5/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 	AS date_off_remarks
	FROM 	xmldata
	ON CONFLICT (sagitem) 	DO UPDATE
	SET 	 uc = excluded.uc
			,description = excluded.description
			,date_off = excluded.date_off
			,date_off_remarks = excluded.date_off_remarks
			,modify_dt = timezone('utc'::TEXT, clock_timestamp())
	WHERE 	(acord_legal_entity_codes.uc,acord_legal_entity_codes.description,acord_legal_entity_codes.date_off,acord_legal_entity_codes.date_off_remarks)
		IS DISTINCT FROM (excluded.uc,excluded.description,excluded.date_off,excluded.date_off_remarks);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_acord_legal_entity_codes_upsert(varchar, text) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_acord_legal_entity_codes_upsert(varchar, text) TO rl_sagitta_x;
GO 
