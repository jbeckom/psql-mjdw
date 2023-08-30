DROP TABLE p_and_c.mapping_by_claim_number CASCADE;
GO

CREATE TABLE p_and_c.mapping_by_claim_number (
	client_id varchar(256) NOT NULL,
	claim_number varchar(256) NOT NULL,
	claim_status varchar(256) NULL,
	occupation varchar(256) NULL,
	claimant_name varchar(256) NULL,
	claimant_first varchar(256) NULL,
	claimant_middle varchar(256) NULL,
	claimant_last varchar(256) NULL,
	driver_first varchar(256) NULL,
	driver_middle varchar(256) NULL,
	driver_last varchar(256) NULL,
	days_employed varchar(256) NULL,
	claimant_age varchar(256) NULL,
	claimant_gender varchar(256) NULL,
	carrier_body_part varchar(256) NULL,
	carrier_cause varchar(256) NULL,
	carrier_nature varchar(256) NULL,
	claim_site varchar(256) NULL,
	carrier_coverage_type varchar(256) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.mapping_by_claim_number OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.mapping_by_claim_number to rl_pc_data_analyst;
GO

Grant select on table p_and_c.mapping_by_claim_number to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.mapping_by_claim_number to rpauser;
GO
GRANT SELECT ON p_and_c.mapping_by_claim_number to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.mapping_by_claim_number to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.mapping_by_claim_number to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.mapping_by_claim_number to rl_p_and_c_d;
GO