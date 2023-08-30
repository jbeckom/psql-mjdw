CREATE TABLE p_and_c.raw_wic (
	insured_name varchar(256) NOT NULL,
	policy_number varchar(256) NOT NULL,
	policy_start_date varchar(256) NOT NULL,
	policy_end_date varchar(256) NOT NULL,
	claim_number varchar(256) NOT NULL,
	date_of_loss varchar(256) NOT NULL,
	occur varchar(256) NOT NULL,
	feature varchar(256) NOT NULL,
	loss_description varchar(256) NOT NULL,
	feature_status varchar(256) NOT NULL,
	cum_paid_loss varchar(256) NOT NULL,
	outstanding_case_loss_reserve varchar(256) NOT NULL,
	net_subrogation varchar(256) NULL,
	paid_alae varchar(256) NULL,
	cumulative_case_incurred_loss varchar(256) NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL,
	net_recovery varchar(256) NULL,
	cum_salv_subro varchar(256) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_wic OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_wic to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_wic to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_wic to rpauser;
GO
GRANT SELECT ON p_and_c.raw_wic to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_wic to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_wic to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_wic to rl_p_and_c_d;
GO