CREATE OR REPLACE FUNCTION sagitta.tr_audit_ba_coverages_doc_info_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_ba_coverages_doc_info (
		 sagitem  
		,lis 
		,new_doc_class_cd 
		,new_doc_location_agency_id 
		,new_doc_state_prov_cd 
		,new_doc_territory_cd 
		,new_doc_num_employees 
		,new_doc_num_individuals_covered 
		,new_doc_fin_resp_doc_cert_yes_no_cd 
		,audit_action
	)
	SELECT 	 NEW.sagitem 
			,NEW.lis 
			,NEW.doc_class_cd 
			,NEW.doc_location_agency_id 
			,NEW.doc_state_prov_cd 
			,NEW.doc_territory_cd 
			,NEW.doc_num_employees 
			,NEW.doc_num_individuals_covered 
			,NEW.doc_fin_resp_doc_cert_yes_no_cd 
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_ba_coverages_doc_info_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_ba_coverages_doc_info_i() TO rl_sagitta_x;
GO 
