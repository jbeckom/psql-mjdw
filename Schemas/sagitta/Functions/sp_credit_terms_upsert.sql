CREATE OR REPLACE FUNCTION sagitta.sp_credit_terms_upsert(_sagitem varchar(3), _xmldata TEXT)
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;

BEGIN 
	rc := 0;

	WITH xmldata AS (SELECT _xmldata::XML AS exemel)
	INSERT INTO sagitta.credit_terms (
		 sagitem
		,audit_staff_cd
		,audit_entry_dt
		,audit_time
		,audit_cd
		,audit_history_record_number
		,audit_program
		,credit_terms_description
		,due_days
		,"percent"
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
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/a3/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 				AS credit_terms_description 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/a4/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 				AS due_days 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/a5/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 				AS "percent" 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/a6/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 				AS date_off 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/a7/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 				AS date_off_remarks
	FROM 	xmldata
	ON CONFLICT (sagitem) DO UPDATE 
	SET 	 audit_staff_cd 				= excluded.audit_staff_cd
			,audit_entry_dt 				= excluded.audit_entry_dt
			,audit_time 					= excluded.audit_time
			,audit_cd 						= excluded.audit_cd
			,audit_history_record_number 	= excluded.audit_history_record_number
			,audit_program 					= excluded.audit_program
			,credit_terms_description 		= excluded.credit_terms_description
			,due_days 						= excluded.due_days
			,"percent" 						= excluded."percent"
			,date_off 						= excluded.date_off
			,date_off_remarks 				= excluded.date_off_remarks
			,modify_dt 						= timezone('utc'::TEXT, clock_timestamp())
	WHERE 	(credit_terms.audit_staff_cd,credit_terms.audit_entry_dt,credit_terms.audit_time,credit_terms.audit_cd,credit_terms.audit_history_record_number,credit_terms.audit_program,credit_terms.credit_terms_description,credit_terms.due_days,credit_terms."percent",credit_terms.date_off,credit_terms.date_off_remarks)
		IS DISTINCT FROM (excluded.audit_staff_cd,excluded.audit_entry_dt,excluded.audit_time,excluded.audit_cd,excluded.audit_history_record_number,excluded.audit_program,excluded.credit_terms_description,excluded.due_days,excluded."percent",excluded.date_off,excluded.date_off_remarks);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_credit_terms_upsert(varchar, text) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_credit_terms_upsert(varchar, text) TO rl_sagitta_x;
GO 
