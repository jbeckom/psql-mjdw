CREATE OR REPLACE FUNCTION miedge.sp_prospects_eb_upsert ()
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;

BEGIN 
	rc := 0;

	INSERT INTO miedge.prospects_eb (
		 name
		,state
		,employees
		,eligible_employees
		,revenue_range
		,kpis
		,fidelity_bond
		,filing_status
		,premium
		,premium_per_employee
		,revenue
		,commission
		,fees
		,benefits_renewal
		,benefits_broker_normalized
		,benefits_broker
		,broker_share
		,broker_affiliation
		,broker_revenue
		,broker_revenue_pct
		,broker_commission
		,broker_commission_pct
		,broker_fees
		,broker_fees_pct
		,largest_carrier_normalized
		,carrier_premium
		,tpa
		,tpa_compensation
		,retirees
		,pc_broker_normalized
		,pc_broker
		,peo_normalized
		,peo
		,accounting_firm_normalized
		,accounting_firm
		,actuary_name
		,actuary_firm_name
		,advisor
		,service_provider
		,plan_assets
		,no_of_plans
		,corrective_distributions
		,participant_loans
		,web
		,social
		,primary_naics
		,naics_description
		,address
		,city
		,county
		,zip
		,phone_number
		,msid
		,ein
		,activity_date
	)
	SELECT 	 name
			,state
			,employees
			,eligible_employees
			,revenue_range
			,kpis
			,fidelity_bond
			,filing_status
			,premium
			,premium_per_employee
			,revenue
			,commission
			,fees
			,benefits_renewal
			,benefits_broker_normalized
			,benefits_broker
			,broker_share
			,broker_affiliation
			,broker_revenue
			,broker_revenue_pct
			,broker_commission
			,broker_commission_pct
			,broker_fees
			,broker_fees_pct
			,largest_carrier_normalized
			,carrier_premium
			,tpa
			,tpa_compensation
			,retirees
			,pc_broker_normalized
			,pc_broker
			,peo_normalized
			,peo
			,accounting_firm_normalized
			,accounting_firm
			,actuary_name
			,actuary_firm_name
			,advisor
			,service_provider
			,plan_assets
			,no_of_plans
			,corrective_distributions
			,participant_loans
			,web
			,social
			,primary_naics
			,naics_description
			,address
			,city
			,county
			,zip
			,phone_number
			,msid
			,ein
			,activity_date
	FROM 	miedge.stg_prospects_eb
	ON CONFLICT (msid) DO UPDATE 
	SET 	 name   						= excluded.name
			,state  						= excluded.state
			,employees  					= excluded.employees
			,eligible_employees     		= excluded.eligible_employees
			,revenue_range  				= excluded.revenue_range
			,kpis   						= excluded.kpis
			,fidelity_bond  				= excluded.fidelity_bond
			,filing_status  				= excluded.filing_status
			,premium    					= excluded.premium
			,premium_per_employee   		= excluded.premium_per_employee
			,revenue    					= excluded.revenue
			,commission     				= excluded.commission
			,fees   						= excluded.fees
			,benefits_renewal   			= excluded.benefits_renewal
			,benefits_broker_normalized     = excluded.benefits_broker_normalized
			,benefits_broker    			= excluded.benefits_broker
			,broker_share   				= excluded.broker_share
			,broker_affiliation     		= excluded.broker_affiliation
			,broker_revenue     			= excluded.broker_revenue
			,broker_revenue_pct     		= excluded.broker_revenue_pct
			,broker_commission  			= excluded.broker_commission
			,broker_commission_pct  		= excluded.broker_commission_pct
			,broker_fees    				= excluded.broker_fees
			,broker_fees_pct    			= excluded.broker_fees_pct
			,largest_carrier_normalized     = excluded.largest_carrier_normalized
			,carrier_premium    			= excluded.carrier_premium
			,tpa    						= excluded.tpa
			,tpa_compensation   			= excluded.tpa_compensation
			,retirees   					= excluded.retirees
			,pc_broker_normalized   		= excluded.pc_broker_normalized
			,pc_broker  					= excluded.pc_broker
			,peo_normalized     			= excluded.peo_normalized
			,peo    						= excluded.peo
			,accounting_firm_normalized     = excluded.accounting_firm_normalized
			,accounting_firm    			= excluded.accounting_firm
			,actuary_name   				= excluded.actuary_name
			,actuary_firm_name  			= excluded.actuary_firm_name
			,advisor    					= excluded.advisor
			,service_provider   			= excluded.service_provider
			,plan_assets    				= excluded.plan_assets
			,no_of_plans    				= excluded.no_of_plans
			,corrective_distributions   	= excluded.corrective_distributions
			,participant_loans  			= excluded.participant_loans
			,web    						= excluded.web
			,social     					= excluded.social
			,primary_naics  				= excluded.primary_naics
			,naics_description  			= excluded.naics_description
			,address    					= excluded.address
			,city   						= excluded.city
			,county     					= excluded.county
			,zip    						= excluded.zip
			,phone_number   				= excluded.phone_number
			,msid   						= excluded.msid
			,ein    						= excluded.ein
			,activity_date  				= excluded.activity_date
			,modify_dt 						= timezone('utc'::TEXT, clock_timestamp())
	WHERE 	(prospects_eb.name,prospects_eb.state,prospects_eb.employees,prospects_eb.eligible_employees,prospects_eb.revenue_range,prospects_eb.kpis,prospects_eb.fidelity_bond,prospects_eb.filing_status,prospects_eb.premium,prospects_eb.premium_per_employee,prospects_eb.revenue,prospects_eb.commission,prospects_eb.fees,prospects_eb.benefits_renewal,prospects_eb.benefits_broker_normalized,prospects_eb.benefits_broker,prospects_eb.broker_share,prospects_eb.broker_affiliation,prospects_eb.broker_revenue,prospects_eb.broker_revenue_pct,prospects_eb.broker_commission,prospects_eb.broker_commission_pct,prospects_eb.broker_fees,prospects_eb.broker_fees_pct,prospects_eb.largest_carrier_normalized,prospects_eb.carrier_premium,prospects_eb.tpa,prospects_eb.tpa_compensation,prospects_eb.retirees,prospects_eb.pc_broker_normalized,prospects_eb.pc_broker,prospects_eb.peo_normalized,prospects_eb.peo,prospects_eb.accounting_firm_normalized,prospects_eb.accounting_firm,prospects_eb.actuary_name,prospects_eb.actuary_firm_name,prospects_eb.advisor,prospects_eb.service_provider,prospects_eb.plan_assets,prospects_eb.no_of_plans,prospects_eb.corrective_distributions,prospects_eb.participant_loans,prospects_eb.web,prospects_eb.social,prospects_eb.primary_naics,prospects_eb.naics_description,prospects_eb.address,prospects_eb.city,prospects_eb.county,prospects_eb.zip,prospects_eb.phone_number,prospects_eb.msid,prospects_eb.ein,prospects_eb.activity_date)
		IS DISTINCT FROM 	(excluded.name,excluded.state,excluded.employees,excluded.eligible_employees,excluded.revenue_range,excluded.kpis,excluded.fidelity_bond,excluded.filing_status,excluded.premium,excluded.premium_per_employee,excluded.revenue,excluded.commission,excluded.fees,excluded.benefits_renewal,excluded.benefits_broker_normalized,excluded.benefits_broker,excluded.broker_share,excluded.broker_affiliation,excluded.broker_revenue,excluded.broker_revenue_pct,excluded.broker_commission,excluded.broker_commission_pct,excluded.broker_fees,excluded.broker_fees_pct,excluded.largest_carrier_normalized,excluded.carrier_premium,excluded.tpa,excluded.tpa_compensation,excluded.retirees,excluded.pc_broker_normalized,excluded.pc_broker,excluded.peo_normalized,excluded.peo,excluded.accounting_firm_normalized,excluded.accounting_firm,excluded.actuary_name,excluded.actuary_firm_name,excluded.advisor,excluded.service_provider,excluded.plan_assets,excluded.no_of_plans,excluded.corrective_distributions,excluded.participant_loans,excluded.web,excluded.social,excluded.primary_naics,excluded.naics_description,excluded.address,excluded.city,excluded.county,excluded.zip,excluded.phone_number,excluded.msid,excluded.ein,excluded.activity_date);
	
	GET DIAGNOSTICS rc = row_count;
	
	DROP TABLE IF EXISTS miedge.stg_prospects_eb;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION miedge.sp_prospects_eb_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION miedge.sp_prospects_eb_upsert() TO rl_miedge_x;
GO 
