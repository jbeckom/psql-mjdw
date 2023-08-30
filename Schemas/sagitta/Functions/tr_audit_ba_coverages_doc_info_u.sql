CREATE OR REPLACE FUNCTION sagitta.tr_audit_ba_coverages_doc_info_u() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_ba_coverages_doc_info (
		 sagitem  
		,lis 
		,old_doc_class_cd 
		,new_doc_class_cd 
		,old_doc_location_agency_id 
		,new_doc_location_agency_id 
		,old_doc_state_prov_cd 
		,new_doc_state_prov_cd 
		,old_doc_territory_cd 
		,new_doc_territory_cd 
		,old_doc_num_employees 
		,new_doc_num_employees 
		,old_doc_num_individuals_covered 
		,new_doc_num_individuals_covered 
		,old_doc_fin_resp_doc_cert_yes_no_cd 
		,new_doc_fin_resp_doc_cert_yes_no_cd 
		,audit_action
	)
	SELECT 	 OLD.sagitem 
			,OLD.lis 
			,OLD.doc_class_cd 
			,NEW.doc_class_cd 
			,OLD.doc_location_agency_id 
			,NEW.doc_location_agency_id 
			,OLD.doc_state_prov_cd 
			,NEW.doc_state_prov_cd 
			,OLD.doc_territory_cd 
			,NEW.doc_territory_cd 
			,OLD.doc_num_employees 
			,NEW.doc_num_employees 
			,OLD.doc_num_individuals_covered 
			,NEW.doc_num_individuals_covered 
			,OLD.doc_fin_resp_doc_cert_yes_no_cd 
			,NEW.doc_fin_resp_doc_cert_yes_no_cd 
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_ba_coverages_doc_info_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_ba_coverages_doc_info_u() TO rl_sagitta_x;
GO 
