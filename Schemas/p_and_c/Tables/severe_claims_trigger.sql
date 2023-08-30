CREATE TABLE p_and_c.severe_claims_trigger (
	client varchar(256) NULL,
	claimant varchar(256) NULL,
	loss_date varchar(256) NULL,
	claim_number varchar(256) NOT NULL,
	claims_cons_email varchar(256) NULL,
	claim_total numeric(20,2) NULL,
	expense numeric(20,2) NULL,
	paid_indemnity numeric(20,2) NULL,
	reserve_indemnity numeric(20,2) NULL,
	paid_medical numeric(20,2) NULL,
	reserve_medical numeric(20,2) NULL,
	subrogation numeric(20,2) NULL,
	litigation varchar(256) NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.severe_claims_trigger OWNER TO mj_admin;
GO

Grant select on table p_and_c.severe_claims_trigger to rl_pc_data_analyst;
GO

Grant select on table p_and_c.severe_claims_trigger to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.severe_claims_trigger to rpauser;
GO
GRANT SELECT ON p_and_c.severe_claims_trigger to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.severe_claims_trigger to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.severe_claims_trigger to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.severe_claims_trigger to rl_p_and_c_d;
GO