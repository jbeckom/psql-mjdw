CREATE TABLE if not exists p_and_c.raw_nmic_supp (
	claim_number varchar(256) NOT NULL,
	type_of_loss varchar(256) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_nmic_supp OWNER TO mj_admin;
GO

Grant select,update,insert on table p_and_c.raw_nmic_supp to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_nmic_supp to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_nmic_supp to rpauser;
GO
GRANT SELECT ON p_and_c.raw_nmic_supp to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_nmic_supp to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_nmic_supp to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_nmic_supp to rl_p_and_c_d;
GO