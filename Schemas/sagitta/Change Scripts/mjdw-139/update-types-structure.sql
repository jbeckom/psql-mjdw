ALTER TABLE sagitta."types"
	DROP COLUMN IF EXISTS modify_dt;
GO 

DROP FUNCTION IF EXISTS sagitta.sp_types_upsert(varchar, text);
GO 

CREATE OR REPLACE FUNCTION sagitta.sp_types_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
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
	SELECT 	 sagitem
			,audit_staff_cd
			,audit_entry_dt
			,audit_time
			,audit_cd
			,audit_history_record_number
			,audit_program
			,type_description
			,date_off
			,date_off_remarks
	FROM 	sagitta.stg_types 
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
	WHERE 	("types".audit_staff_cd,"types".audit_entry_dt,"types".audit_time,"types".audit_cd,"types".audit_history_record_number,"types".audit_program,"types".type_description,"types".date_off,"types".date_off_remarks) 
		IS DISTINCT FROM 	(excluded.audit_staff_cd,excluded.audit_entry_dt,excluded.audit_time,excluded.audit_cd,excluded.audit_history_record_number,excluded.audit_program,excluded.type_description,excluded.date_off,excluded.date_off_remarks);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_types_upsert() OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION sagitta.sp_types_upsert() TO rl_sagitta_x;
GO 
