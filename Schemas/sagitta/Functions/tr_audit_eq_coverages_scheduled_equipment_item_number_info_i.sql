CREATE OR REPLACE FUNCTION sagitta.tr_audit_eq_coverages_scheduled_equipment_item_number_info_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_eq_coverages_scheduled_equipment_item_number_info (
		 sagitem 
		,lis 
		,new_equipment_schedule_item_number 
		,new_equipment_sch_model_yr 
		,new_equip_sch_id_serial_number 
		,new_equip_sch_purchase_dt 
		,new_equip_sch_new_used_ind 
		,new_equipment_schedule_deductible_amt 
		,new_equip_sch_insurance_amt 
		,new_equip_sch_desc 
		,new_ded_type 
		,new_ded_basis 
		,new_limit_basis 
		,new_model 
		,new_item_value 
		,new_item_value_type 
		,new_schedule_equipment_limit_val_date 
		,new_owned_leased 
		,new_schedule 
		,new_manufacturer 
		,new_aoi_seq_no 
		,audit_action 		
	)
	SELECT 	 NEW.sagitem 
			,NEW.lis 
			,NEW.equipment_schedule_item_number 
			,NEW.equipment_sch_model_yr 
			,NEW.equip_sch_id_serial_number 
			,NEW.equip_sch_purchase_dt 
			,NEW.equip_sch_new_used_ind 
			,NEW.equipment_schedule_deductible_amt 
			,NEW.equip_sch_insurance_amt 
			,NEW.equip_sch_desc 
			,NEW.ded_type 
			,NEW.ded_basis 
			,NEW.limit_basis 
			,NEW.model 
			,NEW.item_value 
			,NEW.item_value_type 
			,NEW.schedule_equipment_limit_val_date 
			,NEW.owned_leased 
			,NEW.schedule 
			,NEW.manufacturer 
			,NEW.aoi_seq_no 
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_eq_coverages_scheduled_equipment_item_number_info_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_eq_coverages_scheduled_equipment_item_number_info_i() TO rl_sagitta_x;
GO 
