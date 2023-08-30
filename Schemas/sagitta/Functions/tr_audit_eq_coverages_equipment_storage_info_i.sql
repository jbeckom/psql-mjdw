CREATE OR REPLACE FUNCTION sagitta.tr_audit_eq_coverages_equipment_storage_info_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_eq_coverages_equipment_storage_info (
		 sagitem 
		,lis 
		,new_location_agency_id 
		,new_num_months_in_storage 
		,new_max_value_in_building 
		,new_max_value_out_building 
		,new_equip_storage_security 
		,audit_action 
	)
	SELECT 		 NEW.sagitem 
				,NEW.lis 
				,NEW.location_agency_id 
				,NEW.num_months_in_storage 
				,NEW.max_value_in_building 
				,NEW.max_value_out_building 
				,NEW.equip_storage_security 
				,'I';
	RETURN NEW;			
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_eq_coverages_equipment_storage_info_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_eq_coverages_equipment_storage_info_i() TO rl_sagitta_x;
GO 