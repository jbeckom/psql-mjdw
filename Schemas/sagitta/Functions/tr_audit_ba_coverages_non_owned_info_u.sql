CREATE OR REPLACE FUNCTION sagitta.tr_audit_ba_coverages_non_owned_info_u() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_ba_coverages_non_owned_info (
		 sagitem 
		,lis 
		,old_non_owned_class_cd 
		,new_non_owned_class_cd 
		,old_non_owned_location_agency_id 
		,new_non_owned_location_agency_id 
		,old_non_owned_state_prov_cd 
		,new_non_owned_state_prov_cd 
		,old_non_owned_group_type_cd 
		,new_non_owned_group_type_cd 
		,old_non_owned_num 
		,new_non_owned_num 
		,old_non_owned_pct 
		,new_non_owned_pct 
		,old_non_owned_social_service_agency_yes_no_cd 
		,new_non_owned_social_service_agency_yes_no_cd 
		,old_non_owned_individual_liabilityfor_employees_yes_no_cd 
		,new_non_owned_individual_liabilityfor_employees_yes_no_cd 
		,audit_action
	)
	SELECT 	 OLD.sagitem 
			,OLD.lis 
			,OLD.non_owned_class_cd 
			,NEW.non_owned_class_cd 
			,OLD.non_owned_location_agency_id 
			,NEW.non_owned_location_agency_id 
			,OLD.non_owned_state_prov_cd 
			,NEW.non_owned_state_prov_cd 
			,OLD.non_owned_group_type_cd 
			,NEW.non_owned_group_type_cd 
			,OLD.non_owned_num 
			,NEW.non_owned_num 
			,OLD.non_owned_pct 
			,NEW.non_owned_pct 
			,OLD.non_owned_social_service_agency_yes_no_cd 
			,NEW.non_owned_social_service_agency_yes_no_cd 
			,OLD.non_owned_individual_liabilityfor_employees_yes_no_cd 
			,NEW.non_owned_individual_liabilityfor_employees_yes_no_cd 
			,'U';
	RETURN OLD;
END;
$$;
GO;

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_ba_coverages_non_owned_info_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_ba_coverages_non_owned_info_u() TO rl_sagitta_x;
GO 
