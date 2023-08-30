DROP TABLE IF EXISTS p_and_c.causes CASCADE;
GO

CREATE TABLE p_and_c.causes (
	id varchar(3) NOT NULL,
	"name" varchar(50) NOT NULL,
	description text NULL,
	cause_category_id int4 NOT NULL,
	CONSTRAINT causes_pkey PRIMARY KEY (id)
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.causes OWNER TO mj_admin;
GO

Grant select on table p_and_c.causes to rl_pc_data_analyst;
GO

Grant select on table p_and_c.causes to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.causes to rpauser;
GO

GRANT SELECT ON p_and_c.causes to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.causes to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.causes to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.causes to rl_p_and_c_d;
GO