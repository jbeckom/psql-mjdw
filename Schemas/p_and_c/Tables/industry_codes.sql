CREATE TABLE p_and_c.industry_codes (
	sic_id_8 text NOT NULL,
	sic_id_8_name text NOT NULL,
	sic_id_6 text NOT NULL,
	sic_id_6_name text NOT NULL,
	sic_id_4 text NOT NULL,
	sic_id_4_name text NOT NULL,
	sic_id_3 text NOT NULL,
	sic_id_3_name text NOT NULL,
	sic_id_2 text NOT NULL,
	sic_id_2_name text NOT NULL,
	sic_category_id text NOT NULL,
	sic_category_name text NOT NULL,
	naics bpchar(6) NULL,
	naics_name varchar(256) NULL,
	am_best_auto_liab numeric(2) NULL,
	am_best_auto_pd numeric(2) NULL,
	am_best_gl_p_and_o numeric(2) NULL,
	am_best_gl_completed numeric(2) NULL,
	am_best_environmental numeric(2) NULL,
	am_best_wco numeric(2) NULL,
	am_best_crime numeric(2) NULL,
	am_best_property numeric(2) NULL,
	am_best_business_interruption numeric(2) NULL,
	am_best_inland_marine numeric(2) NULL,
	ponemon_cyber_frequency numeric(3,1) NULL,
	ponemon_cyber_severity numeric(3,1) NULL,
	contractual_risk numeric(3,1) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.industry_codes OWNER TO mj_admin;
GO

Grant select on table p_and_c.industry_codes to rl_pc_data_analyst;
GO

Grant select on table p_and_c.industry_codes to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.industry_codes to rpauser;
GO
GRANT SELECT ON p_and_c.industry_codes to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.industry_codes to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.industry_codes to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.industry_codes to rl_p_and_c_d;
GO