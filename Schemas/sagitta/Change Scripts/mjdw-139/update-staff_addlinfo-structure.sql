ALTER TABLE sagitta.staff_addlinfo 
	DROP COLUMN IF EXISTS modify_dt;
GO 

ALTER TABLE sagitta.audit_staff_addlinfo 
	 DROP COLUMN IF EXISTS old_modify_dt
	,DROP COLUMN IF EXISTS new_modify_dt;
GO 

DROP FUNCTION IF EXISTS sagitts.sp_staff_addlinfo_upsert(varchar,text);
GO 

CREATE OR REPLACE FUNCTION sagitta.sp_staff_addlinfo_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
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
	SELECT 	 sagitem
			,audit_staff_cd
			,audit_entry_dt
			,audit_time
			,audit_cd
			,audit_history_record_number
			,audit_program
			,only_staff_name
			,associate_role
	FROM 	sagitta.stg_staff_addlinfo 
	ON CONFLICT (sagitem) DO UPDATE 
	SET 	 audit_staff_cd 				= excluded.audit_staff_cd
			,audit_entry_dt 				= excluded.audit_entry_dt
			,audit_time 					= excluded.audit_time
			,audit_cd 						= excluded.audit_cd
			,audit_history_record_number 	= excluded.audit_history_record_number
			,audit_program 					= excluded.audit_program
			,only_staff_name 				= excluded.only_staff_name
			,associate_role 				= excluded.associate_role
	WHERE 	(staff_addlinfo.audit_staff_cd,staff_addlinfo.audit_entry_dt,staff_addlinfo.audit_time,staff_addlinfo.audit_cd,staff_addlinfo.audit_history_record_number,staff_addlinfo.audit_program,staff_addlinfo.only_staff_name,staff_addlinfo.associate_role) 
		IS DISTINCT FROM 	(excluded.audit_staff_cd,excluded.audit_entry_dt,excluded.audit_time,excluded.audit_cd,excluded.audit_history_record_number,excluded.audit_program,excluded.only_staff_name,excluded.associate_role);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_staff_addlinfo_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_staff_addlinfo_upsert() TO rl_sagitta_x;
GO 
