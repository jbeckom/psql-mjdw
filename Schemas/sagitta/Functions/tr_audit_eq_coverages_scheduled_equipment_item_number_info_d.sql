CREATE OR REPLACE FUNCTION sagitta.tr_audit_eq_coverages_scheduled_equipment_item_number_info_d() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_eq_coverages_scheduled_equipment_item_number_info (
		 sagitem 
		,lis 
		,old_equipment_schedule_item_number 
		,old_equipment_sch_model_yr 
		,old_equip_sch_id_serial_number 
		,old_equip_sch_purchase_dt 
		,old_equip_sch_new_used_ind 
		,old_equipment_schedule_deductible_amt 
		,old_equip_sch_insurance_amt 
		,old_equip_sch_desc 
		,old_ded_type 
		,old_ded_basis 
		,old_limit_basis 
		,old_model 
		,old_item_value 
		,old_item_value_type 
		,old_schedule_equipment_limit_val_date 
		,old_owned_leased 
		,old_schedule 
		,old_manufacturer 
		,old_aoi_seq_no 
		,audit_action 		
	)
	SELECT 	 OLD.sagitem 
			,OLD.lis 
			,OLD.equipment_schedule_item_number 
			,OLD.equipment_sch_model_yr 
			,OLD.equip_sch_id_serial_number 
			,OLD.equip_sch_purchase_dt 
			,OLD.equip_sch_new_used_ind 
			,OLD.equipment_schedule_deductible_amt 
			,OLD.equip_sch_insurance_amt 
			,OLD.equip_sch_desc 
			,OLD.ded_type 
			,OLD.ded_basis 
			,OLD.limit_basis 
			,OLD.model 
			,OLD.item_value 
			,OLD.item_value_type 
			,OLD.schedule_equipment_limit_val_date 
			,OLD.owned_leased 
			,OLD.schedule 
			,OLD.manufacturer 
			,OLD.aoi_seq_no 
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_eq_coverages_scheduled_equipment_item_number_info_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_eq_coverages_scheduled_equipment_item_number_info_d() TO rl_sagitta_x;
GO 
