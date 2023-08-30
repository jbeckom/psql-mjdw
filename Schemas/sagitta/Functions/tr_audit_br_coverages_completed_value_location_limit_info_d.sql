CREATE OR REPLACE FUNCTION sagitta.tr_audit_br_coverages_completed_value_location_limit_info_d() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_br_coverages_completed_value_location_limit_info (
		 sagitem 
		,lis 
		,old_completed_value_location_number 
		,old_completed_value_sub_location_number 
		,old_completed_value_site_limit 
		,audit_action 
	)
	SELECT 	 OLD.sagitem 
			,OLD.lis 
			,OLD.completed_value_location_number 
			,OLD.completed_value_sub_location_number 
			,OLD.completed_value_site_limit 
			,'D';
	RETURN OLD;	
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_br_coverages_completed_value_location_limit_info_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_br_coverages_completed_value_location_limit_info_d() TO rl_sagitta_x;
GO 
