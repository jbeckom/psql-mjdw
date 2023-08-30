DROP TABLE IF EXISTS p_and_c.safety_culture_survey_custom
GO

CREATE TABLE p_and_c.safety_culture_survey_custom (
	client_id text NOT NULL,
	demo1 text,
	demo2 text,
    demo3 text,
	demo4 text,
    demo5 text,
	demo6 text,
    custom1 text,
	custom2 text,
    custom3 text,
	custom4 text,
    custom5 text,
	custom6 text,
    custom7 text
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.safety_culture_survey_custom OWNER TO mj_admin;
GO

Grant select on table p_and_c.safety_culture_survey_custom to rl_pc_data_analyst;
GO

Grant select on table p_and_c.safety_culture_survey_custom to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.safety_culture_survey_custom to rpauser;
GO
GRANT SELECT ON p_and_c.safety_culture_survey_custom to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.safety_culture_survey_custom to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.safety_culture_survey_custom to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.safety_culture_survey_custom to rl_p_and_c_d;
GO