CREATE OR REPLACE FUNCTION sagitta.tr_audit_br_coverages_completed_value_location_limit_info_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_br_coverages_completed_value_location_limit_info (
		 sagitem 
		,lis 
		,new_completed_value_location_number 
		,new_completed_value_sub_location_number 
		,new_completed_value_site_limit 
		,audit_action 
	)
	SELECT 	 NEW.sagitem 
			,NEW.lis 
			,NEW.completed_value_location_number 
			,NEW.completed_value_sub_location_number 
			,NEW.completed_value_site_limit 
			,'I';
	RETURN NEW;	
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_br_coverages_completed_value_location_limit_info_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_br_coverages_completed_value_location_limit_info_i() TO rl_sagitta_x;
GO 
