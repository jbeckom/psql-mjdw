CREATE OR REPLACE FUNCTION sagitta.sp_eq_coverages_unscheduled_equipment_info_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.eq_coverages_unscheduled_equipment_info (
		 sagitem  
		,lis  
		,unsch_equip_desc  
		,unscheduled_equip_coins_pct  
		,num_unscheduled_equip_max_item  
		,unscheduled_equipm_insurance_amt  	
	)
	SELECT 	 sagitem  
			,lis  
			,unsch_equip_desc  
			,unscheduled_equip_coins_pct  
			,num_unscheduled_equip_max_item  
			,unscheduled_equipm_insurance_amt 
	FROM 	sagitta.stg_eq_coverages_unscheduled_equipment_info 
	ON CONFLICT (sagitem,lis) DO UPDATE 
	SET 	 unsch_equip_desc   				= excluded.unsch_equip_desc 
			,unscheduled_equip_coins_pct  		= excluded.unscheduled_equip_coins_pct 
			,num_unscheduled_equip_max_item   	= excluded.num_unscheduled_equip_max_item 
			,unscheduled_equipm_insurance_amt   = excluded.unscheduled_equipm_insurance_amt 
	WHERE 	(eq_coverages_unscheduled_equipment_info.unsch_equip_desc,eq_coverages_unscheduled_equipment_info.unscheduled_equip_coins_pct,eq_coverages_unscheduled_equipment_info.num_unscheduled_equip_max_item,eq_coverages_unscheduled_equipment_info.unscheduled_equipm_insurance_amt) 
		IS DISTINCT FROM 	(excluded.unsch_equip_desc,excluded.unscheduled_equip_coins_pct,excluded.num_unscheduled_equip_max_item,excluded.unscheduled_equipm_insurance_amt); 
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_eq_coverages_unscheduled_equipment_info_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_eq_coverages_unscheduled_equipment_info_upsert() TO rl_sagitta_x;
GO 
