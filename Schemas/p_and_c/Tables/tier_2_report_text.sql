CREATE TABLE p_and_c.tier_2_report_text (
	answername varchar(32) NOT NULL,
	surveyname varchar(64) NOT NULL,
	reporttext varchar(1024) NOT NULL,
	category varchar(256) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.tier_2_report_text OWNER TO mj_admin;
GO

Grant select on table p_and_c.tier_2_report_text to rl_pc_data_analyst;
GO

Grant select on table p_and_c.tier_2_report_text to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.tier_2_report_text to rpauser;
GO
GRANT SELECT ON p_and_c.tier_2_report_text to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.tier_2_report_text to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.tier_2_report_text to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.tier_2_report_text to rl_p_and_c_d;
GO