DROP TABLE IF EXISTS p_and_c.mapping_causes CASCADE;
GO

CREATE TABLE p_and_c.mapping_causes (
	id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	carrier_cause text NULL,
	cause_id varchar(3) NULL,
	CONSTRAINT mapping_causes_ukey UNIQUE (carrier_cause)
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.mapping_causes OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.mapping_causes to rl_pc_data_analyst;
GO

Grant select on table p_and_c.mapping_causes to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.mapping_causes to rpauser;
GO
GRANT SELECT ON p_and_c.mapping_causes to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.mapping_causes to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.mapping_causes to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.mapping_causes to rl_p_and_c_d;
GO