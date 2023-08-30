CREATE OR REPLACE FUNCTION sagitta.tr_audit_eq_coverages_scheduled_equipment_item_number_info_u() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_eq_coverages_scheduled_equipment_item_number_info (
		 sagitem 
		,lis 
		,old_equipment_schedule_item_number 
		,new_equipment_schedule_item_number 
		,old_equipment_sch_model_yr 
		,new_equipment_sch_model_yr 
		,old_equip_sch_id_serial_number 
		,new_equip_sch_id_serial_number 
		,old_equip_sch_purchase_dt 
		,new_equip_sch_purchase_dt 
		,old_equip_sch_new_used_ind 
		,new_equip_sch_new_used_ind 
		,old_equipment_schedule_deductible_amt 
		,new_equipment_schedule_deductible_amt 
		,old_equip_sch_insurance_amt 
		,new_equip_sch_insurance_amt 
		,old_equip_sch_desc 
		,new_equip_sch_desc 
		,old_ded_type 
		,new_ded_type 
		,old_ded_basis 
		,new_ded_basis 
		,old_limit_basis 
		,new_limit_basis 
		,old_model 
		,new_model 
		,old_item_value 
		,new_item_value 
		,old_item_value_type 
		,new_item_value_type 
		,old_schedule_equipment_limit_val_date 
		,new_schedule_equipment_limit_val_date 
		,old_owned_leased 
		,new_owned_leased 
		,old_schedule 
		,new_schedule 
		,old_manufacturer 
		,new_manufacturer 
		,old_aoi_seq_no 
		,new_aoi_seq_no 
		,audit_action 		
	)
	SELECT 	 OLD.sagitem 
			,OLD.lis 
			,OLD.equipment_schedule_item_number 
			,NEW.equipment_schedule_item_number 
			,OLD.equipment_sch_model_yr 
			,NEW.equipment_sch_model_yr 
			,OLD.equip_sch_id_serial_number 
			,NEW.equip_sch_id_serial_number 
			,OLD.equip_sch_purchase_dt 
			,NEW.equip_sch_purchase_dt 
			,OLD.equip_sch_new_used_ind 
			,NEW.equip_sch_new_used_ind 
			,OLD.equipment_schedule_deductible_amt 
			,NEW.equipment_schedule_deductible_amt 
			,OLD.equip_sch_insurance_amt 
			,NEW.equip_sch_insurance_amt 
			,OLD.equip_sch_desc 
			,NEW.equip_sch_desc 
			,OLD.ded_type 
			,NEW.ded_type 
			,OLD.ded_basis 
			,NEW.ded_basis 
			,OLD.limit_basis 
			,NEW.limit_basis 
			,OLD.model 
			,NEW.model 
			,OLD.item_value 
			,NEW.item_value 
			,OLD.item_value_type 
			,NEW.item_value_type 
			,OLD.schedule_equipment_limit_val_date 
			,NEW.schedule_equipment_limit_val_date 
			,OLD.owned_leased 
			,NEW.owned_leased 
			,OLD.schedule 
			,NEW.schedule 
			,OLD.manufacturer 
			,NEW.manufacturer 
			,OLD.aoi_seq_no 
			,NEW.aoi_seq_no 
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_eq_coverages_scheduled_equipment_item_number_info_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_eq_coverages_scheduled_equipment_item_number_info_u() TO rl_sagitta_x;
GO 
