CREATE OR REPLACE FUNCTION sagitta.sp_types_upsert(_sagitem varchar(3), _xmldata TEXT)
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;

BEGIN 
	rc := 0;
	
	WITH xmldata AS (SELECT _xmldata::XML AS exemel)
	INSERT INTO sagitta."types" (
		 sagitem
		,audit_staff_cd
		,audit_entry_dt
		,audit_time
		,audit_cd
		,audit_history_record_number
		,audit_program
		,type_description
		,date_off
		,date_off_remarks
	)
	SELECT 	 _sagitem 	AS sagitem 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/a1/v1/s1/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 		AS audit_staff_cd
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/a1/v1/s2/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&')::int 	AS audit_entry_dt
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/a1/v1/s3/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&')::int 	AS audit_time
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/a1/v1/s4/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 		AS audit_cd
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/a1/v1/s5/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 		AS audit_history_record_number
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/a1/v1/s6/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 		AS audit_program
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/a3/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 				AS type_description 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/a4/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 				AS date_off
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/a5/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 				AS date_off_remarks 
	FROM 	xmldata 
	ON CONFLICT (sagitem) DO UPDATE 
	SET 	 audit_staff_cd 				= excluded.audit_staff_cd
			,audit_entry_dt 				= excluded.audit_entry_dt
			,audit_time 					= excluded.audit_time
			,audit_cd 						= excluded.audit_cd
			,audit_history_record_number 	= excluded.audit_history_record_number
			,audit_program 					= excluded.audit_program
			,type_description 				= excluded.type_description
			,date_off 						= excluded.date_off
			,date_off_remarks 				= excluded.date_off_remarks
			,modify_dt 						= timezone('utc'::TEXT,clock_timestamp())
	WHERE 	("types".audit_staff_cd,"types".audit_entry_dt,"types".audit_time,"types".audit_cd,"types".audit_history_record_number,"types".audit_program,"types".type_description,"types".date_off,"types".date_off_remarks)
		IS DISTINCT FROM (excluded.audit_staff_cd,excluded.audit_entry_dt,excluded.audit_time,excluded.audit_cd,excluded.audit_history_record_number,excluded.audit_program,excluded.type_description,excluded.date_off,excluded.date_off_remarks);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_types_upsert(varchar, text) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_types_upsert(varchar, text) TO rl_sagitta_x;
GO 
