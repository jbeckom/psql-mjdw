CREATE TABLE p_and_c.safety_culture_survey_recs (
	client_id varchar(256) NOT NULL,
	category varchar(256) NOT NULL,
	recommendation text NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.safety_culture_survey_recs OWNER TO mj_admin;
GO

Grant select on table p_and_c.safety_culture_survey_recs to rl_pc_data_analyst;
GO

Grant select on table p_and_c.safety_culture_survey_recs to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.safety_culture_survey_recs to rpauser;
GO
GRANT SELECT ON p_and_c.safety_culture_survey_recs to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.safety_culture_survey_recs to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.safety_culture_survey_recs to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.safety_culture_survey_recs to rl_p_and_c_d;
GO