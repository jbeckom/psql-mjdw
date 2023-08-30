CREATE TABLE IF NOT EXISTS miedge.prospects_pc(
	 name                               TEXT        NULL
	,state                              TEXT        NULL
	,industry                           TEXT        NULL
	,web                                TEXT        NULL
	,social                             TEXT        NULL
	,employees                          TEXT        NULL
	,revenue_range                      TEXT        NULL
	,fidelity_bond                      TEXT        NULL
	,pc_self_funded                     TEXT        NULL
	,eb_self_funded                     TEXT        NULL
	,summary                            TEXT        NULL
	,ex_mod                             TEXT        NULL
	,ex_mod_changed_in_last_30_days     TEXT        NULL
	,est_annual_prem                    TEXT        NULL
	,assigned_risk                      TEXT        NULL
	,workers_compensation_carrier       TEXT        NULL
	,workers_compensation_renewal       TEXT        NULL
	,bipd_carrier                       TEXT        NULL
	,bipd_renewal                       TEXT        NULL
	,bipd_excess_carrier                TEXT        NULL
	,bipd_excess_renewal                TEXT        NULL
	,cargo_carrier                      TEXT        NULL
	,cargo_renewal                      TEXT        NULL
	,bond_carrier                       TEXT        NULL
	,bond_renewal                       TEXT        NULL
	,business_travel_carrier            TEXT        NULL
	,business_travel_renewal            TEXT        NULL
	,pc_broker_normalized               TEXT        NULL
	,pc_broker                          TEXT        NULL
	,benefits_broker                    TEXT        NULL
	,benefits_broker_revenue            TEXT        NULL
	,searched_benefits_broker           TEXT        NULL
	,searched_benefits_broker_revenue   TEXT        NULL
	,peo_normalized                     TEXT        NULL
	,peo                                TEXT        NULL
	,accounting_firm_normalized         TEXT        NULL
	,accounting_firm                    TEXT        NULL
	,actuary_name                       TEXT        NULL
	,actuary_firm_name                  TEXT        NULL
	,motor_carrier_operation            TEXT        NULL
	,drivers                            TEXT        NULL
	,vehicles                           TEXT        NULL
	,mileage                            TEXT        NULL
	,checks                             TEXT        NULL
	,dot                                TEXT        NULL
	,osha                               TEXT        NULL
	,whd                                TEXT        NULL
	,address                            TEXT        NULL
	,city                               TEXT        NULL
	,county                             TEXT        NULL
	,zip                                TEXT        NULL
	,phone_number                       TEXT        NULL
	,miedge_smart_id                    char(15)    NOT NULL
	,ein                                TEXT        NULL
	,activity_date                      TEXT        NULL
	,modify_dt                          timestamp   NOT NULL    DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,CONSTRAINT prospects_pc_pkey PRIMARY KEY (miedge_smart_id)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE miedge.prospects_pc OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE miedge.prospects_pc TO rl_miedge_r;
GO 

GRANT INSERT ON TABLE miedge.prospects_pc TO rl_miedge_a;
GO 

GRANT UPDATE ON TABLE miedge.prospects_pc TO rl_miedge_w;
GO 
