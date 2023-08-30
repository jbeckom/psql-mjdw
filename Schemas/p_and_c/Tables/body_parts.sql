CREATE TABLE p_and_c.body_parts (
	id int4 NOT NULL,
	"name" varchar(50) NOT NULL,
	mapped text NULL,
	body_part_category_id int4 NOT NULL,
	CONSTRAINT body_parts_pkey PRIMARY KEY (id)
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.body_parts OWNER TO mj_admin;
GO

Grant select on table p_and_c.body_parts to rl_pc_data_analyst;
GO

Grant select on table p_and_c.body_parts to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.body_parts to rpauser;
GO

GRANT SELECT ON p_and_c.body_parts to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.body_parts to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.body_parts to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.body_parts to rl_p_and_c_d;
GO