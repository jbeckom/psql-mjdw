CREATE TABLE IF NOT EXISTS powerapps.suspect (
	 name                           varchar(500)    NULL
	,prospect                       TEXT            NULL  
	,suspect                        uuid            NOT NULL 
	,suspect_source                 varchar(150)    NOT NULL 
	,source_id                      varchar(150)    NOT NULL 
	,suspect_owner                  text            NULL 
	,created_on                     timestamp       NOT NULL    DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,created_by 					TEXT 			NOT NULL 	DEFAULT current_user 
	,modified_on 					timestamp 		NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,modified_by 					TEXT 			NOT NULL 	DEFAULT current_user 
	,status 						TEXT 			NULL 
	,status_reason 					TEXT 			NULL 
	,account_name 					varchar(250) 	NULL 
	,line_of_business 				TEXT 			NULL 
	,street_1 						varchar(400) 	NULL 
	,street_2 						varchar(400) 	NULL 
	,city 							varchar(250) 	NULL 
	,state 							varchar(50) 	NULL 
	,zip_code 						varchar(50) 	NULL 
	,county 						varchar(200) 	NULL 
	,phone_number 					varchar(100) 	NULL 
	,website 						varchar(250) 	NULL 
	,social_media_details 			varchar(1000) 	NULL 
	,revenue_range 					varchar(50) 	NULL 
	,coverage_summary 				varchar(1000) 	NULL 
	,kpis 							varchar(250) 	NULL 
	,pc_broker 						varchar(250) 	NULL 
	,benefits_renewal 				TEXT 			NULL 
	,benefits_broker 				varchar(250) 	NULL 
	,broker_share 					text 			NULL 
	,broker_affiliation 			varchar(250) 	NULL 
	,broker_revenue 				text 			NULL 
	,broker_revenue_pct 			text 			NULL 
	,broker_commission 				text 			NULL 
	,broker_commission_pct 			text 			NULL 
	,broker_fees 					text 			NULL 
	,broker_fees_pct 				text 			NULL 
	,largest_carrier 				varchar(250) 	NULL 
	,carrier_premium 				text 			NULL 
	,tpa 							varchar(250) 	NULL 
	,tpa_compensation 				varchar(250) 	NULL 
	,advisor 						varchar(250) 	NULL 
	,service_provider 				varchar(250) 	NULL 
	,plan_assets 					text 			NULL 
	,number_of_plans 				text 			NULL 
	,corrective_distributions 		text 			NULL 
	,participant_loans 				text 			NULL 
	,number_of_employees 			text 			NULL 
	,eligible_employees 			text 			NULL 
	,retirees 						varchar(50) 	NULL 
	,premium 						text 			NULL 
	,premium_per_employee 			text 			NULL 
	,revenue 						text 			NULL 
	,commission 					text 			NULL 
	,fees 							text 			NULL 
	,ex_mod 						varchar(100) 	NULL 
	,estimated_annual_premium 		text 			NULL  
	,drivers 						text 			NULL 
	,vehicles 						text 			NULL 
	,mileage 						text 			NULL 
	,motor_carrier_operation 		varchar(100) 	NULL 
	,fidelity_bond 					varchar(50) 	NULL 
	,filing_status 					varchar(200) 	NULL 
	,pc_self_funded 				bool 			NULL 
	,cargo_carrier 					varchar(250) 	NULL 
	,cargo_renewal 					TEXT 			NULL 
	,business_travel_carrier 		varchar(250) 	NULL 
	,business_travel_renewal 		TEXT 			NULL 
	,workers_compensation_carrier 	varchar(250) 	NULL 
	,workers_compensation_renewal 	TEXT 			NULL 
	,bipd_carrier 					varchar(250) 	NULL 
	,bipd_renewal 					TEXT 			NULL 
	,bond_carrier 					varchar(250) 	NULL 
	,bond_renewal 					TEXT 			NULL 
	,miedge_industry 				varchar(1000) 	NULL 
	,actuary_firm_name 				varchar(250) 	NULL 
	,actuary_contact_name 			varchar(250) 	NULL 
	,accounting_firm_name 			varchar(250) 	NULL 
	,dot_date 						TEXT 			NULL 
	,osha_date 						TEXT 			NULL 
	,whd_date 						TEXT 			NULL 
	,naics 							varchar(10) 	NULL 
	,naics_description 				varchar(250) 	NULL 
	,ein 							varchar(100) 	NULL 
	,CONSTRAINT suspect_pkey PRIMARY KEY (suspect_source, source_id, line_of_business)
);
GO

/*** PERMISSIONS ***/
ALTER TABLE powerapps.suspect OWNER TO mj_admin;
GO

GRANT SELECT ON TABLE powerapps.suspect TO rl_powerapps_r;
GO

GRANT INSERT ON TABLE powerapps.suspect TO rl_powerapps_a;
GO

GRANT UPDATE ON TABLE powerapps.suspect TO rl_powerapps_w;
GO