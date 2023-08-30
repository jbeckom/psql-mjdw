CREATE OR REPLACE FUNCTION miedge.sp_prospects_pc_upsert()
RETURNS int  
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;

BEGIN 
	rc := 0;

	INSERT INTO miedge.prospects_pc (
		 name 
		,state 
		,industry 
		,web 
		,social 
		,employees 
		,revenue_range 
		,fidelity_bond 
		,pc_self_funded 
		,eb_self_funded 
		,summary 
		,ex_mod 
		,ex_mod_changed_in_last_30_days 
		,est_annual_prem 
		,assigned_risk 
		,workers_compensation_carrier 
		,workers_compensation_renewal 
		,bipd_carrier 
		,bipd_renewal 
		,bipd_excess_carrier 
		,bipd_excess_renewal 
		,cargo_carrier 
		,cargo_renewal 
		,bond_carrier 
		,bond_renewal 
		,business_travel_carrier 
		,business_travel_renewal 
		,pc_broker_normalized 
		,pc_broker 
		,benefits_broker 
		,benefits_broker_revenue 
		,searched_benefits_broker 
		,searched_benefits_broker_revenue 
		,peo_normalized 
		,peo 
		,accounting_firm_normalized 
		,accounting_firm 
		,actuary_name 
		,actuary_firm_name 
		,motor_carrier_operation 
		,drivers 
		,vehicles 
		,mileage 
		,checks 
		,dot 
		,osha 
		,whd 
		,address 
		,city 
		,county 
		,zip 
		,phone_number 
		,miedge_smart_id 
		,ein 
		,activity_date 
	)
	SELECT 	 name 
			,state 
			,industry 
			,web 
			,social 
			,employees 
			,revenue_range 
			,fidelity_bond 
			,pc_self_funded 
			,eb_self_funded 
			,summary 
			,ex_mod 
			,ex_mod_changed_in_last_30_days 
			,est_annual_prem 
			,assigned_risk 
			,workers_compensation_carrier 
			,workers_compensation_renewal 
			,bipd_carrier 
			,bipd_renewal 
			,bipd_excess_carrier 
			,bipd_excess_renewal 
			,cargo_carrier 
			,cargo_renewal 
			,bond_carrier 
			,bond_renewal 
			,business_travel_carrier 
			,business_travel_renewal 
			,pc_broker_normalized 
			,pc_broker 
			,benefits_broker 
			,benefits_broker_revenue 
			,searched_benefits_broker 
			,searched_benefits_broker_revenue 
			,peo_normalized 
			,peo 
			,accounting_firm_normalized 
			,accounting_firm 
			,actuary_name 
			,actuary_firm_name 
			,motor_carrier_operation 
			,drivers 
			,vehicles 
			,mileage 
			,checks 
			,dot 
			,osha 
			,whd 
			,address 
			,city 
			,county 
			,zip 
			,phone_number 
			,miedge_smart_id 
			,ein 
			,activity_date 
	FROM 	miedge.stg_prospects_pc
	ON CONFLICT (miedge_smart_id) DO UPDATE 
	SET 	 name                               = excluded.name 
			,state                              = excluded.state 
			,industry                           = excluded.industry 
			,web                                = excluded.web 
			,social                             = excluded.social 
			,employees                          = excluded.employees 
			,revenue_range                      = excluded.revenue_range 
			,fidelity_bond                      = excluded.fidelity_bond 
			,pc_self_funded                     = excluded.pc_self_funded 
			,eb_self_funded                     = excluded.eb_self_funded 
			,summary                            = excluded.summary 
			,ex_mod                             = excluded.ex_mod 
			,ex_mod_changed_in_last_30_days     = excluded.ex_mod_changed_in_last_30_days 
			,est_annual_prem                    = excluded.est_annual_prem 
			,assigned_risk                      = excluded.assigned_risk 
			,workers_compensation_carrier       = excluded.workers_compensation_carrier 
			,workers_compensation_renewal       = excluded.workers_compensation_renewal 
			,bipd_carrier                       = excluded.bipd_carrier 
			,bipd_renewal                       = excluded.bipd_renewal 
			,bipd_excess_carrier                = excluded.bipd_excess_carrier 
			,bipd_excess_renewal                = excluded.bipd_excess_renewal 
			,cargo_carrier                      = excluded.cargo_carrier 
			,cargo_renewal                      = excluded.cargo_renewal 
			,bond_carrier                       = excluded.bond_carrier 
			,bond_renewal                       = excluded.bond_renewal 
			,business_travel_carrier            = excluded.business_travel_carrier 
			,business_travel_renewal            = excluded.business_travel_renewal 
			,pc_broker_normalized               = excluded.pc_broker_normalized 
			,pc_broker                          = excluded.pc_broker 
			,benefits_broker                    = excluded.benefits_broker 
			,benefits_broker_revenue            = excluded.benefits_broker_revenue 
			,searched_benefits_broker           = excluded.searched_benefits_broker 
			,searched_benefits_broker_revenue   = excluded.searched_benefits_broker_revenue 
			,peo_normalized                     = excluded.peo_normalized 
			,peo                                = excluded.peo 
			,accounting_firm_normalized         = excluded.accounting_firm_normalized 
			,accounting_firm                    = excluded.accounting_firm 
			,actuary_name                       = excluded.actuary_name 
			,actuary_firm_name                  = excluded.actuary_firm_name 
			,motor_carrier_operation            = excluded.motor_carrier_operation 
			,drivers                            = excluded.drivers 
			,vehicles                           = excluded.vehicles 
			,mileage                            = excluded.mileage 
			,checks                             = excluded.checks 
			,dot                                = excluded.dot 
			,osha                               = excluded.osha 
			,whd                                = excluded.whd 
			,address                            = excluded.address 
			,city                               = excluded.city 
			,county                             = excluded.county 
			,zip                                = excluded.zip 
			,phone_number                       = excluded.phone_number 
			,miedge_smart_id                    = excluded.miedge_smart_id 
			,ein                                = excluded.ein 
			,activity_date                      = excluded.activity_date 
			,modify_dt 							= timezone('utc'::TEXT, clock_timestamp())
	WHERE 	( prospects_pc.name,prospects_pc.state,prospects_pc.industry,prospects_pc.web,prospects_pc.social,prospects_pc.employees,prospects_pc.revenue_range,prospects_pc.fidelity_bond,prospects_pc.pc_self_funded,prospects_pc.eb_self_funded,prospects_pc.summary,prospects_pc.ex_mod,prospects_pc.ex_mod_changed_in_last_30_days,prospects_pc.est_annual_prem,prospects_pc.assigned_risk,prospects_pc.workers_compensation_carrier,prospects_pc.workers_compensation_renewal,prospects_pc.bipd_carrier,prospects_pc.bipd_renewal,prospects_pc.bipd_excess_carrier,prospects_pc.bipd_excess_renewal,prospects_pc.cargo_carrier,prospects_pc.cargo_renewal,prospects_pc.bond_carrier,prospects_pc.bond_renewal,prospects_pc.business_travel_carrier,prospects_pc.business_travel_renewal,prospects_pc.pc_broker_normalized,prospects_pc.pc_broker,prospects_pc.benefits_broker,prospects_pc.benefits_broker_revenue,prospects_pc.searched_benefits_broker,prospects_pc.searched_benefits_broker_revenue,prospects_pc.peo_normalized,prospects_pc.peo,prospects_pc.accounting_firm_normalized,prospects_pc.accounting_firm,prospects_pc.actuary_name,prospects_pc.actuary_firm_name,prospects_pc.motor_carrier_operation,prospects_pc.drivers,prospects_pc.vehicles,prospects_pc.mileage,prospects_pc.checks,prospects_pc.dot,prospects_pc.osha,prospects_pc.whd,prospects_pc.address,prospects_pc.city,prospects_pc.county,prospects_pc.zip,prospects_pc.phone_number,prospects_pc.miedge_smart_id,prospects_pc.ein,prospects_pc.activity_date)
		IS DISTINCT FROM 	( excluded.name,excluded.state,excluded.industry,excluded.web,excluded.social,excluded.employees,excluded.revenue_range,excluded.fidelity_bond,excluded.pc_self_funded,excluded.eb_self_funded,excluded.summary,excluded.ex_mod,excluded.ex_mod_changed_in_last_30_days,excluded.est_annual_prem,excluded.assigned_risk,excluded.workers_compensation_carrier,excluded.workers_compensation_renewal,excluded.bipd_carrier,excluded.bipd_renewal,excluded.bipd_excess_carrier,excluded.bipd_excess_renewal,excluded.cargo_carrier,excluded.cargo_renewal,excluded.bond_carrier,excluded.bond_renewal,excluded.business_travel_carrier,excluded.business_travel_renewal,excluded.pc_broker_normalized,excluded.pc_broker,excluded.benefits_broker,excluded.benefits_broker_revenue,excluded.searched_benefits_broker,excluded.searched_benefits_broker_revenue,excluded.peo_normalized,excluded.peo,excluded.accounting_firm_normalized,excluded.accounting_firm,excluded.actuary_name,excluded.actuary_firm_name,excluded.motor_carrier_operation,excluded.drivers,excluded.vehicles,excluded.mileage,excluded.checks,excluded.dot,excluded.osha,excluded.whd,excluded.address,excluded.city,excluded.county,excluded.zip,excluded.phone_number,excluded.miedge_smart_id,excluded.ein,excluded.activity_date);
	
	GET DIAGNOSTICS rc = row_count;
	
	DROP TABLE IF EXISTS miedge.stg_prospects_pc;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION miedge.sp_prospects_pc_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION miedge.sp_prospects_pc_upsert() TO rl_miedge_x;
GO 
