CREATE TABLE p_and_c.elr (
	state varchar(2) NOT NULL,
	"year" int4 NOT NULL,
	class_code int4 NOT NULL,
	elr numeric(4,2) NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.elr OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.elr to rl_pc_data_analyst;
GO

Grant select on table p_and_c.elr to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.elr to rpauser;
GO
GRANT SELECT ON p_and_c.elr to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.elr to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.elr to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.elr to rl_p_and_c_d;
GO