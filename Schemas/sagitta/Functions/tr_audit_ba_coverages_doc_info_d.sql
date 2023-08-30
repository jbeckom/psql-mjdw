CREATE OR REPLACE FUNCTION sagitta.tr_audit_ba_coverages_doc_info_d() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_ba_coverages_doc_info (
		 sagitem  
		,lis 
		,old_doc_class_cd 
		,old_doc_location_agency_id 
		,old_doc_state_prov_cd 
		,old_doc_territory_cd 
		,old_doc_num_employees 
		,old_doc_num_individuals_covered 
		,old_doc_fin_resp_doc_cert_yes_no_cd 
		,audit_action
	)
	SELECT 	 OLD.sagitem 
			,OLD.lis 
			,OLD.doc_class_cd 
			,OLD.doc_location_agency_id 
			,OLD.doc_state_prov_cd 
			,OLD.doc_territory_cd 
			,OLD.doc_num_employees 
			,OLD.doc_num_individuals_covered 
			,OLD.doc_fin_resp_doc_cert_yes_no_cd 
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_ba_coverages_doc_info_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_ba_coverages_doc_info_d() TO rl_sagitta_x;
GO 
