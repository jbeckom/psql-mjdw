CREATE OR REPLACE FUNCTION sagitta.sp_eq_coverages_scheduled_equipment_item_number_info_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.eq_coverages_scheduled_equipment_item_number_info (
		 sagitem 
		,lis 
		,equipment_schedule_item_number 
		,equipment_sch_model_yr 
		,equip_sch_id_serial_number 
		,equip_sch_purchase_dt 
		,equip_sch_new_used_ind 
		,equipment_schedule_deductible_amt 
		,equip_sch_insurance_amt 
		,equip_sch_desc 
		,ded_type 
		,ded_basis 
		,limit_basis 
		,model 
		,item_value 
		,item_value_type 
		,schedule_equipment_limit_val_date 
		,owned_leased 
		,schedule 
		,manufacturer 
		,aoi_seq_no 
	)
	SELECT 	 sagitem 
			,lis 
			,equipment_schedule_item_number 
			,equipment_sch_model_yr 
			,equip_sch_id_serial_number 
			,equip_sch_purchase_dt 
			,equip_sch_new_used_ind 
			,equipment_schedule_deductible_amt 
			,equip_sch_insurance_amt 
			,equip_sch_desc 
			,ded_type 
			,ded_basis 
			,limit_basis 
			,model 
			,item_value 
			,item_value_type 
			,schedule_equipment_limit_val_date 
			,owned_leased 
			,schedule 
			,manufacturer 
			,aoi_seq_no 
	FROM 	sagitta.stg_eq_coverages_scheduled_equipment_item_number_info
	ON CONFLICT (sagitem,lis) DO UPDATE 
	SET 	 equipment_schedule_item_number 	= excluded.equipment_schedule_item_number 
			,equipment_sch_model_yr 			= excluded.equipment_sch_model_yr 
			,equip_sch_id_serial_number 		= excluded.equip_sch_id_serial_number 
			,equip_sch_purchase_dt 				= excluded.equip_sch_purchase_dt 
			,equip_sch_new_used_ind 			= excluded.equip_sch_new_used_ind 
			,equipment_schedule_deductible_amt 	= excluded.equipment_schedule_deductible_amt 
			,equip_sch_insurance_amt 			= excluded.equip_sch_insurance_amt 
			,equip_sch_desc 					= excluded.equip_sch_desc 
			,ded_type 							= excluded.ded_type 
			,ded_basis 							= excluded.ded_basis 
			,limit_basis 						= excluded.limit_basis 
			,model 								= excluded.model 
			,item_value 						= excluded.item_value 
			,item_value_type 					= excluded.item_value_type 
			,schedule_equipment_limit_val_date 	= excluded.schedule_equipment_limit_val_date 
			,owned_leased 						= excluded.owned_leased 
			,schedule 							= excluded.schedule 
			,manufacturer 						= excluded.manufacturer 
			,aoi_seq_no 						= excluded.aoi_seq_no 
	WHERE 	(eq_coverages_scheduled_equipment_item_number_info.equipment_schedule_item_number,eq_coverages_scheduled_equipment_item_number_info.equipment_sch_model_yr,eq_coverages_scheduled_equipment_item_number_info.equip_sch_id_serial_number,eq_coverages_scheduled_equipment_item_number_info.equip_sch_purchase_dt,eq_coverages_scheduled_equipment_item_number_info.equip_sch_new_used_ind,eq_coverages_scheduled_equipment_item_number_info.equipment_schedule_deductible_amt,eq_coverages_scheduled_equipment_item_number_info.equip_sch_insurance_amt,eq_coverages_scheduled_equipment_item_number_info.equip_sch_desc,eq_coverages_scheduled_equipment_item_number_info.ded_type,eq_coverages_scheduled_equipment_item_number_info.ded_basis,eq_coverages_scheduled_equipment_item_number_info.limit_basis,eq_coverages_scheduled_equipment_item_number_info.model,eq_coverages_scheduled_equipment_item_number_info.item_value,eq_coverages_scheduled_equipment_item_number_info.item_value_type,eq_coverages_scheduled_equipment_item_number_info.schedule_equipment_limit_val_date,eq_coverages_scheduled_equipment_item_number_info.owned_leased,eq_coverages_scheduled_equipment_item_number_info.schedule,eq_coverages_scheduled_equipment_item_number_info.manufacturer,eq_coverages_scheduled_equipment_item_number_info.aoi_seq_no) 
		IS DISTINCT FROM 	(excluded.equipment_schedule_item_number,excluded.equipment_sch_model_yr,excluded.equip_sch_id_serial_number,excluded.equip_sch_purchase_dt,excluded.equip_sch_new_used_ind,excluded.equipment_schedule_deductible_amt,excluded.equip_sch_insurance_amt,excluded.equip_sch_desc,excluded.ded_type,excluded.ded_basis,excluded.limit_basis,excluded.model,excluded.item_value,excluded.item_value_type,excluded.schedule_equipment_limit_val_date,excluded.owned_leased,excluded.schedule,excluded.manufacturer,excluded.aoi_seq_no); 
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_eq_coverages_scheduled_equipment_item_number_info_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_eq_coverages_scheduled_equipment_item_number_info_upsert() TO rl_sagitta_x;
GO 
