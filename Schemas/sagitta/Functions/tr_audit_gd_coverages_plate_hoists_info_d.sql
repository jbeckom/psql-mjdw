CREATE OR REPLACE FUNCTION sagitta.tr_audit_gd_coverages_plate_hoists_info_d() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_gd_coverages_plate_hoists_info (
		 sagitem 
		,lis 
		,old_plates_hoists_location_number 
		,old_num_dealer_plates 
		,old_num_repairer_plates 
		,old_num_transportation_plates 
		,old_num_hoists 
		,audit_action 
	)
	SELECT 	 OLD.sagitem 
			,OLD.lis 
			,OLD.plates_hoists_location_number 
			,OLD.num_dealer_plates 
			,OLD.num_repairer_plates 
			,OLD.num_transportation_plates 
			,OLD.num_hoists 
			,'D';
	RETURN OLD;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_gd_coverages_plate_hoists_info_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_gd_coverages_plate_hoists_info_d() TO rl_sagitta_x;
GO 
