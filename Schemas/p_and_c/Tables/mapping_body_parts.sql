DROP TABLE IF EXISTS p_and_c.mapping_body_parts CASCADE;
GO

CREATE TABLE p_and_c.mapping_body_parts (
	id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	carrier_body_part text NULL,
	body_part_id int4 NULL,
	CONSTRAINT mapping_body_parts_ukey UNIQUE (carrier_body_part)
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.mapping_body_parts OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.mapping_body_parts to rl_pc_data_analyst;
GO

Grant select on table p_and_c.mapping_body_parts to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.mapping_body_parts to rpauser;
GO
GRANT SELECT ON p_and_c.mapping_body_parts to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.mapping_body_parts to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.mapping_body_parts to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.mapping_body_parts to rl_p_and_c_d;
GO