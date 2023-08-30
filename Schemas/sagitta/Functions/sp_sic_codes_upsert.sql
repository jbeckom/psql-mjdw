CREATE OR REPLACE FUNCTION sagitta.sp_sic_codes_upsert(_sagitem int, _xmldata TEXT) 
RETURNS void 
LANGUAGE plpgsql 
AS $$

BEGIN 
	WITH xmldata AS (SELECT _xmldata::XML AS exemel)
	INSERT INTO sagitta.sic_codes (
		 sagitem
		,uc
		,description 
		,category
	)
	SELECT 	 _sagitem 	AS sagitem
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/a2/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 			AS uc
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/a3/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 			AS description 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/a3/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 			AS category 
	FROM 	xmldata
	ON CONFLICT (sagitem) DO UPDATE 
	SET 	 uc 			= excluded.uc 
			,description 	= excluded.description
			,category 		= excluded.category 
			,modify_dt 		= timezone('utc'::TEXT, clock_timestamp())
	WHERE 	(sic_codes.uc, sic_codes.description, sic_codes.category)
		IS DISTINCT FROM 	(excluded.uc, excluded.description, excluded.category);
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_sic_codes_upsert(int, TEXT) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_sic_codes_upsert(int, text) TO rl_sagitta_x;
GO 
