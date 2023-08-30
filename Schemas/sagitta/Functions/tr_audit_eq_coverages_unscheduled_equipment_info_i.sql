CREATE OR REPLACE FUNCTION sagitta.tr_audit_eq_coverages_unscheduled_equipment_info_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_eq_coverages_unscheduled_equipment_info (
		 sagitem 
		,lis 
		,new_unsch_equip_desc 
		,new_unscheduled_equip_coins_pct 
		,new_num_unscheduled_equip_max_item 
		,new_unscheduled_equipm_insurance_amt 
		,audit_action
	)
	SELECT 	 NEW.sagitem 
			,NEW.lis 
			,NEW.unsch_equip_desc 
			,NEW.unscheduled_equip_coins_pct 
			,NEW.num_unscheduled_equip_max_item 
			,NEW.unscheduled_equipm_insurance_amt 
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_eq_coverages_unscheduled_equipment_info_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_eq_coverages_unscheduled_equipment_info_i() TO rl_sagitta_x;
GO 