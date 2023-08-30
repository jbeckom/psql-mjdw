CREATE OR REPLACE FUNCTION powerapps.sp_suspect_miedge_eb_upsert ()
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
		,kpis
		,pc_broker 
		,benefits_renewal
		,benefits_broker 
		,broker_share
		,broker_affiliation 
		,broker_revenue 
		,broker_revenue_pct 
		,broker_commission 
		,broker_commission_pct 
		,broker_fees 
		,broker_fees_pct 
		,largest_carrier 
		,carrier_premium 
		,tpa 
		,tpa_compensation 
		,advisor 
		,service_provider 
		,plan_assets 
		,number_of_plans 
		,corrective_distributions 
		,participant_loans 
		,number_of_employees 
		,eligible_employees 
		,retirees 
		,premium 
		,premium_per_employee 
		,revenue 
		,commission 
		,fees 
		,fidelity_bond 
		,filing_status 
		,actuary_firm_name 
		,actuary_contact_name 
		,accounting_firm_name 
		,naics 
		,naics_description 
		,ein
	)
	SELECT 	 uuid_generate_v4() 												AS suspect 
			,'MIEDGE' 															AS suspect_source 
			,eb.msid 															AS source_id 
			,eb.name 															AS account_name 
			,'EB' 																AS line_of_business 
			,eb.address 														AS street_1 
			,eb.city 															AS city 
			,eb.state 															AS state 
			,eb.zip 															AS zip_code 
			,eb.county 															AS county 
			,eb.phone_number 													AS phone_number 
			,eb.web 															AS website 
			,eb.social 															AS social_media_details 
			,eb.revenue_range 													AS revenue_range 
			,eb.kpis 															AS kpis
			,eb.pc_broker_normalized 											AS pc_broker 
			,eb.benefits_renewal 												AS benefits_renewal
			,eb.benefits_broker_normalized 										AS benefits_broker 
			,eb.broker_share 													AS broker_share
			,eb.broker_affiliation 												AS broker_affiliation 
			,to_char(eb.broker_revenue::numeric,'$FM999,999,999') 				AS broker_revenue 
			,eb.broker_revenue_pct 												AS broker_revenue_pct 
			,to_char(eb.broker_commission::numeric,'$FM999,999,999') 			AS broker_commission 
			,eb.broker_commission_pct 											AS broker_commission_pct 
			,to_char(eb.broker_fees::NUMERIC, '$FM999,999,999') 				AS broker_fees 
			,eb.broker_fees_pct 												AS broker_fees_pct 
			,eb.largest_carrier_normalized 										AS largest_carrier 
			,to_char(eb.carrier_premium::numeric,'$FM999,999,999') 				AS carrier_premium 
			,eb.tpa 															AS tpa 
			,eb.tpa_compensation 												AS tpa_compensation 
			,eb.advisor 														AS advisor 
			,eb.service_provider 												AS service_provider 
			,to_char(eb.plan_assets::NUMERIC, '$FM999,999,999') 				AS plan_assets 
			,eb.no_of_plans 													AS number_of_plans 
			,to_char(eb.corrective_distributions::numeric,'$FM999,999,999') 	AS corrective_distributions 
			,to_char(eb.participant_loans::numeric,'$FM999,999,999') 			AS participant_loans 
			,eb.employees 														AS number_of_employees 
			,eb.eligible_employees 												AS eligible_employees 
			,eb.retirees 														AS retirees 
			,to_char(eb.premium::NUMERIC, '$FM999,999,999') 					AS premium 
			,eb.premium_per_employee::money 									AS premium_per_employee 
			,to_char(eb.revenue::numeric, '$FM999,999,999') 					AS revenue 
			,to_char(eb.commission::numeric, '$FM999,999,999') 					AS commission 
			,to_char(eb.fees::NUMERIC, '$FM999,999,999') 						AS fees 
			,eb.fidelity_bond 													AS fidelity_bond 
			,eb.filing_status													AS filing_status 
			,eb.actuary_firm_name 												AS actuary_firm_name 
			,eb.actuary_name 													AS actuary_contact_name 
			,eb.accounting_firm_normalized 										AS accounting_firm_name 
			,eb.primary_naics 													AS naics 
			,eb.naics_description 												AS naics_description 
			,eb.ein 															AS ein
	FROM 	miedge.prospects_eb 	AS eb
	ON CONFLICT (suspect_source, source_id, line_of_business) DO UPDATE 
	SET 	 modified_on 					= timezone('utc'::TEXT, clock_timestamp())
			,modified_by 					= current_user
			,account_name                   = excluded.account_name
			,street_1                       = excluded.street_1
			,street_2                       = excluded.street_2
			,city                           = excluded.city
			,state                          = excluded.state
			,zip_code                       = excluded.zip_code
			,county                         = excluded.county
			,phone_number                   = excluded.phone_number
			,website                        = excluded.website
			,social_media_details           = excluded.social_media_details
			,revenue_range                  = excluded.revenue_range
			,coverage_summary               = excluded.coverage_summary
			,kpis                           = excluded.kpis
			,pc_broker                      = excluded.pc_broker
			,benefits_renewal               = excluded.benefits_renewal
			,benefits_broker                = excluded.benefits_broker
			,broker_share                   = excluded.broker_share
			,broker_affiliation             = excluded.broker_affiliation
			,broker_revenue                 = excluded.broker_revenue
			,broker_revenue_pct             = excluded.broker_revenue_pct
			,broker_commission              = excluded.broker_commission
			,broker_commission_pct          = excluded.broker_commission_pct
			,broker_fees                    = excluded.broker_fees
			,broker_fees_pct                = excluded.broker_fees_pct
			,largest_carrier                = excluded.largest_carrier
			,carrier_premium                = excluded.carrier_premium
			,tpa                            = excluded.tpa
			,tpa_compensation               = excluded.tpa_compensation
			,advisor                        = excluded.advisor
			,service_provider               = excluded.service_provider
			,plan_assets                    = excluded.plan_assets
			,number_of_plans                = excluded.number_of_plans
			,corrective_distributions       = excluded.corrective_distributions
			,participant_loans              = excluded.participant_loans
			,number_of_employees            = excluded.number_of_employees
			,eligible_employees             = excluded.eligible_employees
			,retirees                       = excluded.retirees
			,premium                        = excluded.premium
			,premium_per_employee           = excluded.premium_per_employee
			,revenue                        = excluded.revenue
			,commission                     = excluded.commission
			,fees                           = excluded.fees
			,ex_mod                         = excluded.ex_mod
			,estimated_annual_premium       = excluded.estimated_annual_premium
			,drivers                        = excluded.drivers
			,vehicles                       = excluded.vehicles
			,mileage                        = excluded.mileage
			,motor_carrier_operation        = excluded.motor_carrier_operation
			,fidelity_bond                  = excluded.fidelity_bond
			,filing_status                  = excluded.filing_status
			,pc_self_funded                 = excluded.pc_self_funded
			,cargo_carrier                  = excluded.cargo_carrier
			,cargo_renewal                  = excluded.cargo_renewal
			,business_travel_carrier        = excluded.business_travel_carrier
			,business_travel_renewal        = excluded.business_travel_renewal
			,workers_compensation_carrier   = excluded.workers_compensation_carrier
			,workers_compensation_renewal   = excluded.workers_compensation_renewal
			,bond_carrier                   = excluded.bond_carrier
			,bond_renewal                   = excluded.bond_renewal
			,miedge_industry                = excluded.miedge_industry
			,actuary_firm_name              = excluded.actuary_firm_name
			,actuary_contact_name           = excluded.actuary_contact_name
			,accounting_firm_name 			= excluded.accounting_firm_name 
			,naics                          = excluded.naics
			,naics_description              = excluded.naics_description
			,ein                            = excluded.ein
	WHERE 	(suspect.account_name,suspect.street_1,suspect.street_2,suspect.city,suspect.state,suspect.zip_code,suspect.county,suspect.phone_number,suspect.website,suspect.social_media_details,suspect.revenue_range,suspect.coverage_summary,suspect.kpis,suspect.pc_broker,suspect.benefits_renewal,suspect.benefits_broker,suspect.broker_share,suspect.broker_affiliation,suspect.broker_revenue,suspect.broker_revenue_pct,suspect.broker_commission,suspect.broker_commission_pct,suspect.broker_fees,suspect.broker_fees_pct,suspect.largest_carrier,suspect.carrier_premium,suspect.tpa,suspect.tpa_compensation,suspect.advisor,suspect.service_provider,suspect.plan_assets,suspect.number_of_plans,suspect.corrective_distributions,suspect.participant_loans,suspect.number_of_employees,suspect.eligible_employees,suspect.retirees,suspect.premium,suspect.premium_per_employee,suspect.revenue,suspect.commission,suspect.fees,suspect.ex_mod,suspect.estimated_annual_premium,suspect.drivers,suspect.vehicles,suspect.mileage,suspect.motor_carrier_operation,suspect.fidelity_bond,suspect.filing_status,suspect.pc_self_funded,suspect.cargo_carrier,suspect.cargo_renewal,suspect.business_travel_carrier,suspect.business_travel_renewal,suspect.workers_compensation_carrier,suspect.workers_compensation_renewal,suspect.bond_carrier,suspect.bond_renewal,suspect.miedge_industry,suspect.actuary_firm_name,suspect.actuary_contact_name,suspect.accounting_firm_name,suspect.naics,suspect.naics_description,suspect.ein) 
		IS DISTINCT FROM 	(excluded.account_name,excluded.street_1,excluded.street_2,excluded.city,excluded.state,excluded.zip_code,excluded.county,excluded.phone_number,excluded.website,excluded.social_media_details,excluded.revenue_range,excluded.coverage_summary,excluded.kpis,excluded.pc_broker,excluded.benefits_renewal,excluded.benefits_broker,excluded.broker_share,excluded.broker_affiliation,excluded.broker_revenue,excluded.broker_revenue_pct,excluded.broker_commission,excluded.broker_commission_pct,excluded.broker_fees,excluded.broker_fees_pct,excluded.largest_carrier,excluded.carrier_premium,excluded.tpa,excluded.tpa_compensation,excluded.advisor,excluded.service_provider,excluded.plan_assets,excluded.number_of_plans,excluded.corrective_distributions,excluded.participant_loans,excluded.number_of_employees,excluded.eligible_employees,excluded.retirees,excluded.premium,excluded.premium_per_employee,excluded.revenue,excluded.commission,excluded.fees,excluded.ex_mod,excluded.estimated_annual_premium,excluded.drivers,excluded.vehicles,excluded.mileage,excluded.motor_carrier_operation,excluded.fidelity_bond,excluded.filing_status,excluded.pc_self_funded,excluded.cargo_carrier,excluded.cargo_renewal,excluded.business_travel_carrier,excluded.business_travel_renewal,excluded.workers_compensation_carrier,excluded.workers_compensation_renewal,excluded.bond_carrier,excluded.bond_renewal,excluded.miedge_industry,excluded.actuary_firm_name,excluded.actuary_contact_name,excluded.accounting_firm_name,excluded.naics,excluded.naics_description,excluded.ein);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.sp_suspect_miedge_eb_upsert () OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.sp_suspect_miedge_eb_upsert () TO rl_powerapps_x;
GO
