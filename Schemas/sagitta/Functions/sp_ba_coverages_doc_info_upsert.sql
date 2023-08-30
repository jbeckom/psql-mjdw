CREATE OR REPLACE FUNCTION sagitta.sp_ba_coverages_doc_info_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.ba_coverages_doc_info(
		 sagitem 
		,lis 
		,doc_class_cd 
		,doc_location_agency_id 
		,doc_state_prov_cd 
		,doc_territory_cd 
		,doc_num_employees 
		,doc_num_individuals_covered 
		,doc_fin_resp_doc_cert_yes_no_cd 
	)
	SELECT 	 sagitem 
			,lis 
			,doc_class_cd 
			,doc_location_agency_id 
			,doc_state_prov_cd 
			,doc_territory_cd 
			,doc_num_employees 
			,doc_num_individuals_covered 
			,doc_fin_resp_doc_cert_yes_no_cd 
	FROM 	sagitta.stg_ba_coverages_doc_info 
	ON CONFLICT (sagitem,lis) DO UPDATE 
	SET 	 doc_class_cd 						= excluded.doc_class_cd 
			,doc_location_agency_id 			= excluded.doc_location_agency_id 
			,doc_state_prov_cd 					= excluded.doc_state_prov_cd 
			,doc_territory_cd 					= excluded.doc_territory_cd 
			,doc_num_employees 					= excluded.doc_num_employees 
			,doc_num_individuals_covered 		= excluded.doc_num_individuals_covered 
			,doc_fin_resp_doc_cert_yes_no_cd 	= excluded.doc_fin_resp_doc_cert_yes_no_cd 
	WHERE 	(ba_coverages_doc_info.doc_class_cd,ba_coverages_doc_info.doc_location_agency_id,ba_coverages_doc_info.doc_state_prov_cd,ba_coverages_doc_info.doc_territory_cd,ba_coverages_doc_info.doc_num_employees,ba_coverages_doc_info.doc_num_individuals_covered,ba_coverages_doc_info.doc_fin_resp_doc_cert_yes_no_cd) 
		IS DISTINCT FROM 	(excluded.doc_class_cd,excluded.doc_location_agency_id,excluded.doc_state_prov_cd,excluded.doc_territory_cd,excluded.doc_num_employees,excluded.doc_num_individuals_covered,excluded.doc_fin_resp_doc_cert_yes_no_cd); 
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_ba_coverages_doc_info_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_ba_coverages_doc_info_upsert() TO rl_sagitta_x;
GO 
