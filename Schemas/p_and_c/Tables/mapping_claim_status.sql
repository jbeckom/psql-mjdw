CREATE TABLE p_and_c.mapping_claim_status (
	carrier_claim_status varchar(256) NOT NULL,
	claim_status varchar(256) NULL,
	CONSTRAINT mapping_claim_status_pkey PRIMARY KEY (carrier_claim_status)
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.mapping_claim_status OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.mapping_claim_status to rl_pc_data_analyst;
GO

Grant select on table p_and_c.mapping_claim_status to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.mapping_claim_status to rpauser;
GO
GRANT SELECT ON p_and_c.mapping_claim_status to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.mapping_claim_status to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.mapping_claim_status to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.mapping_claim_status to rl_p_and_c_d;
GO