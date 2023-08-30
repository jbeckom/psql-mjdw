DROP FUNCTION IF EXISTS sagitta.sp_coverages_upsert(int, text);
GO 

CREATE OR REPLACE FUNCTION sagitta.sp_coverages_upsert()
RETURNS int  
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.coverages (
		 sagitem
		,audit_staff_cd
		,audit_entry_dt
		,audit_time
		,audit_cd
		,audit_history_record_number
		,audit_program
		,audit_effective_dt
		,audit_change_agency_id
		,coverage_cd
		,coverage_description
		,major_lob_cd
		,acord_lob_cd
		,acord_sub_lob
		,coverage_type
		,personal_commercial
		,off_dt
		,off_dt_remarks
	)
	SELECT 	 sagitem::int 
			,audit_staff_cd
			,audit_entry_dt::int 
			,audit_time::int 
			,audit_cd
			,audit_history_record_number
			,audit_program
			,audit_effective_dt
			,audit_change_agency_id
			,coverage_cd
			,coverage_description
			,major_lob_cd
			,acord_lob_cd
			,acord_sub_lob
			,coverage_type
			,personal_commercial
			,off_dt::int 
			,off_dt_remarks
	FROM 	sagitta.stg_coverages
	ON CONFLICT (sagitem) DO UPDATE 
	SET 	 audit_staff_cd 				= excluded.audit_staff_cd 
			,audit_entry_dt 				= excluded.audit_entry_dt 
			,audit_time 					= excluded.audit_time 
			,audit_cd 						= excluded.audit_cd 
			,audit_history_record_number 	= excluded.audit_history_record_number 
			,audit_program 					= excluded.audit_program 
			,audit_effective_dt 			= excluded.audit_effective_dt 
			,audit_change_agency_id 		= excluded.audit_change_agency_id 
			,coverage_cd 					= excluded.coverage_cd 
			,coverage_description 			= excluded.coverage_description 
			,major_lob_cd 					= excluded.major_lob_cd 
			,acord_lob_cd 					= excluded.acord_lob_cd 
			,acord_sub_lob 					= excluded.acord_sub_lob 
			,coverage_type 					= excluded.coverage_type 
			,personal_commercial 			= excluded.personal_commercial 
			,off_dt 						= excluded.off_dt 
			,off_dt_remarks 				= excluded.off_dt_remarks 
	WHERE 	(coverages.audit_staff_cd,coverages.audit_entry_dt,coverages.audit_time,coverages.audit_cd,coverages.audit_history_record_number,coverages.audit_program,coverages.audit_effective_dt,coverages.audit_change_agency_id,coverages.coverage_cd,coverages.coverage_description,coverages.major_lob_cd,coverages.acord_lob_cd,coverages.acord_sub_lob,coverages.coverage_type,coverages.personal_commercial,coverages.off_dt,coverages.off_dt_remarks) 
		IS DISTINCT FROM 	(excluded.audit_staff_cd,excluded.audit_entry_dt,excluded.audit_time,excluded.audit_cd,excluded.audit_history_record_number,excluded.audit_program,excluded.audit_effective_dt,excluded.audit_change_agency_id,excluded.coverage_cd,excluded.coverage_description,excluded.major_lob_cd,excluded.acord_lob_cd,excluded.acord_sub_lob,excluded.coverage_type,excluded.personal_commercial,excluded.off_dt,excluded.off_dt_remarks); 
	
	GET DIAGNOSTICS rc = row_count; 

	RETURN rc; 
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_coverages_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_coverages_upsert() TO rl_sagitta_x;
GO 
