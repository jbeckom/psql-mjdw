CREATE OR REPLACE FUNCTION sagitta.tr_audit_eq_coverages_equipment_storage_info_u() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_eq_coverages_equipment_storage_info (
		 sagitem 
		,lis 
		,old_location_agency_id 
		,new_location_agency_id 
		,old_num_months_in_storage 
		,new_num_months_in_storage 
		,old_max_value_in_building 
		,new_max_value_in_building 
		,old_max_value_out_building 
		,new_max_value_out_building 
		,old_equip_storage_security 
		,new_equip_storage_security 
		,audit_action 
	)
	SELECT 		 OLD.sagitem 
				,OLD.lis 
				,OLD.location_agency_id 
				,OLD.num_months_in_storage 
				,NEW.num_months_in_storage 
				,OLD.max_value_in_building 
				,NEW.max_value_in_building 
				,OLD.max_value_out_building 
				,NEW.max_value_out_building 
				,OLD.equip_storage_security 
				,NEW.equip_storage_security 
				,'U';
	RETURN OLD;			
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_eq_coverages_equipment_storage_info_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_eq_coverages_equipment_storage_info_u() TO rl_sagitta_x;
GO 
