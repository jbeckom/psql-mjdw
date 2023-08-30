CREATE TABLE p_and_c.assessment_text (
	assessment varchar(256) NULL,
	category varchar(256) NULL,
	"result" varchar(256) NULL,
	"text" text NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.assessment_text OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.assessment_text to rl_pc_data_analyst;
GO

Grant select on table p_and_c.assessment_text to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.assessment_text to rpauser;
GO
GRANT SELECT ON p_and_c.assessment_text to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.assessment_text to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.assessment_text to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.assessment_text to rl_p_and_c_d;
GO