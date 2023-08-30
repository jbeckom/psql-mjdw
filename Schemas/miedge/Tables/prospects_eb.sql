CREATE TABLE IF NOT EXISTS miedge.prospects_eb (
	 name                           TEXT    	NULL
	,state                          TEXT    	NULL
	,employees                      TEXT    	NULL
	,eligible_employees             TEXT    	NULL
	,revenue_range                  TEXT    	NULL
	,kpis                           TEXT    	NULL
	,fidelity_bond                  TEXT    	NULL
	,filing_status                  TEXT    	NULL
	,premium                        TEXT    	NULL
	,premium_per_employee           TEXT    	NULL
	,revenue                        TEXT    	NULL
	,commission                     TEXT    	NULL
	,fees                           TEXT    	NULL
	,benefits_renewal               TEXT    	NULL
	,benefits_broker_normalized     TEXT    	NULL
	,benefits_broker                TEXT    	NULL
	,broker_share                   TEXT    	NULL
	,broker_affiliation             TEXT    	NULL
	,broker_revenue                 TEXT    	NULL
	,broker_revenue_pct             TEXT    	NULL
	,broker_commission              TEXT    	NULL
	,broker_commission_pct          TEXT    	NULL
	,broker_fees                    TEXT    	NULL
	,broker_fees_pct                TEXT    	NULL
	,largest_carrier_normalized     TEXT    	NULL
	,carrier_premium                TEXT    	NULL
	,tpa                            TEXT    	NULL
	,tpa_compensation               TEXT    	NULL
	,retirees                       TEXT    	NULL
	,pc_broker_normalized           TEXT    	NULL
	,pc_broker                      TEXT    	NULL
	,peo_normalized                 TEXT    	NULL
	,peo                            TEXT    	NULL
	,accounting_firm_normalized     TEXT    	NULL
	,accounting_firm                TEXT    	NULL
	,actuary_name                   TEXT    	NULL
	,actuary_firm_name              TEXT    	NULL
	,advisor                        TEXT    	NULL
	,service_provider               TEXT    	NULL
	,plan_assets                    TEXT    	NULL
	,no_of_plans                    TEXT    	NULL
	,corrective_distributions       TEXT    	NULL
	,participant_loans              TEXT    	NULL
	,web                            TEXT    	NULL
	,social                         TEXT    	NULL
	,primary_naics                  TEXT    	NULL
	,naics_description              TEXT    	NULL
	,address                        TEXT    	NULL
	,city                           TEXT    	NULL
	,county                         TEXT    	NULL
	,zip                            TEXT    	NULL
	,phone_number                   TEXT    	NULL
	,msid                           char(15)    NULL 	
	,ein                            TEXT    	NULL
	,activity_date                  TEXT    	NULL
	,modify_dt 						timestamp   NOT NULL    DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,CONSTRAINT prospects_eb_pkey PRIMARY KEY (msid)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE miedge.prospects_eb OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE miedge.prospects_eb TO rl_miedge_r;
GO 

GRANT INSERT ON TABLE miedge.prospects_eb TO rl_miedge_a;
GO 

GRANT UPDATE ON TABLE miedge.prospects_eb TO rl_miedge_w;
GO 