CREATE OR REPLACE FUNCTION sagitta.sp_staff_addlinfo_upsert(_sagitem varchar(5), _xmldata TEXT)
RETURNS int  
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;

BEGIN 
	rc := 0;

	WITH xmldata AS (SELECT _xmldata::XML AS exemel)
	INSERT INTO sagitta.staff_addlinfo (
		 sagitem
		,audit_staff_cd
		,audit_entry_dt
		,audit_time
		,audit_cd
		,audit_history_record_number
		,audit_program
		,only_staff_name
		,associate_role
	)
	SELECT 	 _sagitem 	AS sagitem 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/a1/v1/s1/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 		AS audit_staff_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/a1/v1/s2/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&')::int 	AS audit_entry_dt 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/a1/v1/s3/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&')::int 	AS audit_time 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/a1/v1/s4/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 		AS audit_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/a1/v1/s5/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 		AS audit_history_record_number 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/a1/v1/s6/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 		AS audit_program 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/a6/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 				AS only_staff_name 
			,REPLACE(regexp_replace(UNNEST(xpath('/Item/a7/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 				AS associate_role 
	FROM 	xmldata 
	ON CONFLICT (sagitem) DO UPDATE 
	SET 	 audit_staff_cd                 = excluded.audit_staff_cd
			,audit_entry_dt                 = excluded.audit_entry_dt
			,audit_time                     = excluded.audit_time
			,audit_cd                       = excluded.audit_cd
			,audit_history_record_number    = excluded.audit_history_record_number
			,audit_program                  = excluded.audit_program
			,only_staff_name                = excluded.only_staff_name
			,associate_role                 = excluded.associate_role
			,modify_dt 						= timezone('utc'::TEXT, clock_timestamp())
	WHERE 	(staff_addlinfo.audit_staff_cd,staff_addlinfo.audit_entry_dt,staff_addlinfo.audit_time,staff_addlinfo.audit_cd,staff_addlinfo.audit_history_record_number,staff_addlinfo.audit_program,staff_addlinfo.only_staff_name,staff_addlinfo.associate_role)
		IS DISTINCT FROM 	(excluded.audit_staff_cd,excluded.audit_entry_dt,excluded.audit_time,excluded.audit_cd,excluded.audit_history_record_number,excluded.audit_program,excluded.only_staff_name,excluded.associate_role);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_staff_addlinfo_upsert(varchar, TEXT) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_staff_addlinfo_upsert(varchar, text) TO rl_sagitta_x;
GO 
