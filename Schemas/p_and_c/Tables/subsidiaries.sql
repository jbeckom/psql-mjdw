CREATE TABLE p_and_c.subsidiaries (
	id int4 NOT NULL,
	"name" varchar(256) NULL,
	parent_id text NULL,
	logo_url text NULL,
	power_bi_url text NULL,
	uploaded_at timestamp NULL,
	industry_code bpchar(4) NULL,
	CONSTRAINT subsidiaries_pkey PRIMARY KEY (id)
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.subsidiaries OWNER TO mj_admin;
GO

Grant select on table p_and_c.subsidiaries to rl_pc_data_analyst;
GO

Grant select on table p_and_c.subsidiaries to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.subsidiaries to rpauser;
GO
GRANT SELECT ON p_and_c.subsidiaries to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.subsidiaries to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.subsidiaries to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.subsidiaries to rl_p_and_c_d;
GO