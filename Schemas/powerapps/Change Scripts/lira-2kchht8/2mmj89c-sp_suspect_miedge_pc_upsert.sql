CREATE OR REPLACE FUNCTION powerapps.sp_suspect_miedge_pc_upsert ()
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;

BEGIN 
	rc := 0;

	INSERT INTO powerapps.suspect (
		 suspect
		,suspect_source 
		,source_id
		,account_name 
		,line_of_business
		,street_1 
		,city 
		,state 
		,zip_code 
		,county 
		,phone_number 
		,website 
		,social_media_details 
		,revenue_range 
		,coverage_summary 
		,pc_broker 
		,number_of_employees 
		,ex_mod 
		,estimated_annual_premium
		,drivers 
		,vehicles 
		,mileage 
		,motor_carrier_operation 
		,fidelity_bond 
		,pc_self_funded 
		,cargo_carrier 
		,cargo_renewal 
		,business_travel_carrier 
		,business_travel_renewal 
		,workers_compensation_carrier 
		,workers_compensation_renewal 
		,bipd_carrier 
		,bipd_renewal 
		,bond_carrier 
		,bond_renewal 
		,miedge_industry 
		,actuary_firm_name 
		,actuary_contact_name 
		,dot_date 
		,osha_date 
		,whd_date 
		,ein
	)
	SELECT 	 uuid_generate_v4() 										AS suspect
			,'MIEDGE' 													AS suspect_source 
			,pc.miedge_smart_id 										AS source_id
			,pc.name 													AS account_name 
			,'Property & Casualty' 										AS line_of_business
			,pc.address 												AS street_1 
			,pc.city 													AS city 
			,pc.state 													AS state 
			,pc.zip 													AS zip_code 
			,pc.county 													AS county 
			,pc.phone_number 											AS phone_number 
			,pc.web 													AS website 
			,pc.social 													AS social_media_details 
			,pc.revenue_range 											AS revenue_range 
			,pc.summary 												AS coverage_summary 
			,pc.pc_broker_normalized 									AS pc_broker 
			,pc.employees 												AS number_of_employees 
			,pc.ex_mod 													AS ex_mod 
			,pc.est_annual_prem::int 									AS estimated_annual_premium
			,pc.drivers 												AS drivers 
			,pc.vehicles 												AS vehicles 
			,pc.mileage 												AS mileage 
			,pc.motor_carrier_operation 								AS motor_carrier_operation 
			,pc.fidelity_bond 											AS fidelity_bond 
			,pc.pc_self_funded::bool 									AS pc_self_funded 
			,pc.cargo_carrier 											AS cargo_carrier 
			,CASE 
				WHEN pc.cargo_renewal IS NOT NULL THEN 
					CASE
						WHEN concat_ws('-', date_part('year', current_date)::TEXT, LEFT(LEFT(pc.cargo_renewal, 5),2), right(LEFT(pc.cargo_renewal, 5),2))::date >= current_date
							THEN concat_ws('-', date_part('year', current_date)::TEXT, LEFT(LEFT(pc.cargo_renewal, 5),2), right(LEFT(pc.cargo_renewal, 5),2))::date
						ELSE concat_ws('-', date_part('year', current_date + INTERVAL '1 year')::TEXT, LEFT(LEFT(pc.cargo_renewal, 5),2), right(LEFT(pc.cargo_renewal, 5),2))::date
					END
				ELSE NULL 
			 END 														AS cargo_renewal
			,pc.business_travel_carrier 								AS business_travel_carrier 
			,CASE 
				WHEN pc.business_travel_renewal IS NOT NULL THEN 
					CASE
						WHEN concat_ws('-', date_part('year', current_date)::TEXT, LEFT(LEFT(pc.business_travel_renewal, 5),2), right(LEFT(pc.business_travel_renewal, 5),2))::date >= current_date
							THEN concat_ws('-', date_part('year', current_date)::TEXT, LEFT(LEFT(pc.business_travel_renewal, 5),2), right(LEFT(pc.business_travel_renewal, 5),2))::date
						ELSE concat_ws('-', date_part('year', current_date + INTERVAL '1 year')::TEXT, LEFT(LEFT(pc.business_travel_renewal, 5),2), right(LEFT(pc.business_travel_renewal, 5),2))::date
					END
				ELSE NULL 
			 END 														AS business_travel_renewal
			,pc.workers_compensation_carrier 							AS workers_compensation_carrier 
			,CASE 
				WHEN pc.workers_compensation_renewal IS NOT NULL THEN 
					CASE
						WHEN concat_ws('-', date_part('year', current_date)::TEXT, LEFT(LEFT(pc.workers_compensation_renewal, 5),2), right(LEFT(pc.workers_compensation_renewal, 5),2))::date >= current_date
							THEN concat_ws('-', date_part('year', current_date)::TEXT, LEFT(LEFT(pc.workers_compensation_renewal, 5),2), right(LEFT(pc.workers_compensation_renewal, 5),2))::date
						ELSE concat_ws('-', date_part('year', current_date + INTERVAL '1 year')::TEXT, LEFT(LEFT(pc.workers_compensation_renewal, 5),2), right(LEFT(pc.workers_compensation_renewal, 5),2))::date
					END
				ELSE NULL 
			 END 														AS workers_compensation_renewal 
			,pc.bipd_carrier 											AS bipd_carrier 
			,CASE 
				WHEN pc.bipd_renewal IS NOT NULL THEN 
					CASE
						WHEN concat_ws('-', date_part('year', current_date)::TEXT, LEFT(LEFT(pc.bipd_renewal, 5),2), right(LEFT(pc.bipd_renewal, 5),2))::date >= current_date
							THEN concat_ws('-', date_part('year', current_date)::TEXT, LEFT(LEFT(pc.bipd_renewal, 5),2), right(LEFT(pc.bipd_renewal, 5),2))::date
						ELSE concat_ws('-', date_part('year', current_date + INTERVAL '1 year')::TEXT, LEFT(LEFT(pc.bipd_renewal, 5),2), right(LEFT(pc.bipd_renewal, 5),2))::date
					END
				ELSE NULL 
			 END 														AS bipd_renewal
			,pc.bond_carrier 											AS bond_carrier 
			,CASE 
				WHEN pc.bond_renewal IS NOT NULL THEN 
					CASE
						WHEN concat_ws('-', date_part('year', current_date)::TEXT, LEFT(LEFT(pc.bond_renewal, 5),2), right(LEFT(pc.bond_renewal, 5),2))::date >= current_date
							THEN concat_ws('-', date_part('year', current_date)::TEXT, LEFT(LEFT(pc.bond_renewal, 5),2), right(LEFT(pc.bond_renewal, 5),2))::date
						ELSE concat_ws('-', date_part('year', current_date + INTERVAL '1 year')::TEXT, LEFT(LEFT(pc.bond_renewal, 5),2), right(LEFT(pc.bond_renewal, 5),2))::date
					END
				ELSE NULL 
			 END 														AS bond_renewal
			,pc.industry 												AS miedge_industry 
			,pc.actuary_firm_name 										AS actuary_firm_name 
			,pc.actuary_name 											AS actuary_contact_name 
			,CASE 
				WHEN pc.dot IS NOT NULL THEN concat_ws('-',RIGHT(pc.dot,4),LEFT(pc.dot,2),'01')::date
				ELSE NULL 
			 END 														AS dot_date 
			,CASE 
				WHEN pc.osha IS NOT NULL THEN concat_ws('-',RIGHT(pc.osha,4),LEFT(pc.osha,2),'01')::date
				ELSE NULL 
			 END 														AS osha_date 
			,CASE 
				WHEN pc.whd IS NOT NULL THEN concat_ws('-',RIGHT(pc.whd,4),LEFT(pc.whd,2),'01')::date
				ELSE NULL 
			 END  														AS whd_date 
			,pc.ein  													AS ein 
	FROM 	miedge.prospects_pc 	AS pc
	ON CONFLICT (suspect_source, source_id, line_of_business) DO UPDATE 
	SET 	 modified_on 					= timezone('utc'::TEXT, clock_timestamp())
			,modified_by 					= current_user 
			,account_name                   = excluded.account_name 
			,street_1                       = excluded.street_1 
			,city                           = excluded.city 
			,state                          = excluded.state 
			,zip_code                       = excluded.zip_code 
			,county                         = excluded.county 
			,phone_number                   = excluded.phone_number 
			,website                        = excluded.website 
			,social_media_details           = excluded.social_media_details 
			,revenue_range                  = excluded.revenue_range 
			,coverage_summary               = excluded.coverage_summary 
			,pc_broker                      = excluded.pc_broker 
			,number_of_employees            = excluded.number_of_employees 
			,ex_mod                         = excluded.ex_mod 
			,estimated_annual_premium       = excluded.estimated_annual_premium
			,drivers                        = excluded.drivers 
			,vehicles                       = excluded.vehicles 
			,mileage                        = excluded.mileage 
			,motor_carrier_operation        = excluded.motor_carrier_operation 
			,fidelity_bond                  = excluded.fidelity_bond 
			,pc_self_funded                 = excluded.pc_self_funded 
			,cargo_carrier                  = excluded.cargo_carrier 
			,cargo_renewal                  = excluded.cargo_renewal 
			,business_travel_carrier        = excluded.business_travel_carrier 
			,business_travel_renewal        = excluded.business_travel_renewal 
			,workers_compensation_carrier   = excluded.workers_compensation_carrier 
			,workers_compensation_renewal   = excluded.workers_compensation_renewal 
			,bipd_carrier                   = excluded.bipd_carrier 
			,bipd_renewal                   = excluded.bipd_renewal 
			,bond_carrier 					= excluded.bond_carrier 
			,bond_renewal 					= excluded.bond_renewal 
			,miedge_industry                = excluded.miedge_industry 
			,actuary_firm_name              = excluded.actuary_firm_name 
			,actuary_contact_name           = excluded.actuary_contact_name 
			,dot_date                       = excluded.dot_date 
			,osha_date                      = excluded.osha_date 
			,whd_date                       = excluded.whd_date 
			,ein                            = excluded.ein
	WHERE 	(suspect.account_name,suspect.street_1,suspect.city,suspect.state,suspect.zip_code,suspect.county,suspect.phone_number,suspect.website,suspect.social_media_details,suspect.revenue_range,suspect.coverage_summary,suspect.pc_broker,suspect.number_of_employees,suspect.ex_mod,suspect.estimated_annual_premium,suspect.drivers,suspect.vehicles,suspect.mileage,suspect.motor_carrier_operation,suspect.fidelity_bond,suspect.pc_self_funded,suspect.cargo_carrier,suspect.cargo_renewal,suspect.business_travel_carrier,suspect.business_travel_renewal,suspect.workers_compensation_carrier,suspect.workers_compensation_renewal,suspect.bipd_carrier,suspect.bipd_renewal,suspect.bond_carrier,suspect.bond_renewal,suspect.miedge_industry,suspect.actuary_firm_name,suspect.actuary_contact_name,suspect.dot_date,suspect.osha_date,suspect.whd_date,suspect.ein)
		IS DISTINCT FROM 	(excluded.account_name,excluded.street_1,excluded.city,excluded.state,excluded.zip_code,excluded.county,excluded.phone_number,excluded.website,excluded.social_media_details,excluded.revenue_range,excluded.coverage_summary,excluded.pc_broker,excluded.number_of_employees,excluded.ex_mod,excluded.estimated_annual_premium,excluded.drivers,excluded.vehicles,excluded.mileage,excluded.motor_carrier_operation,excluded.fidelity_bond,excluded.pc_self_funded,excluded.cargo_carrier,excluded.cargo_renewal,excluded.business_travel_carrier,excluded.business_travel_renewal,excluded.workers_compensation_carrier,excluded.workers_compensation_renewal,excluded.bipd_carrier,excluded.bipd_renewal,excluded.bond_carrier,excluded.bond_renewal,excluded.miedge_industry,excluded.actuary_firm_name,excluded.actuary_contact_name,excluded.dot_date,excluded.osha_date,excluded.whd_date,excluded.ein);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.sp_suspect_miedge_pc_upsert () OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.sp_suspect_miedge_pc_upsert () TO rl_powerapps_x;
GO
