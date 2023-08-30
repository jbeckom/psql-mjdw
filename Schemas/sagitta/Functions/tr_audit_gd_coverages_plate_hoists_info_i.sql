CREATE OR REPLACE FUNCTION sagitta.tr_audit_gd_coverages_plate_hoists_info_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_gd_coverages_plate_hoists_info (
		 sagitem 
		,lis 
		,new_plates_hoists_location_number 
		,new_num_dealer_plates 
		,new_num_repairer_plates 
		,new_num_transportation_plates 
		,new_num_hoists 
		,audit_action 
	)
	SELECT 	 NEW.sagitem 
			,NEW.lis 
			,NEW.plates_hoists_location_number 
			,NEW.num_dealer_plates 
			,NEW.num_repairer_plates 
			,NEW.num_transportation_plates 
			,NEW.num_hoists 
			,'I';
	RETURN NEW;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_gd_coverages_plate_hoists_info_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_gd_coverages_plate_hoists_info_i() TO rl_sagitta_x;
GO 
