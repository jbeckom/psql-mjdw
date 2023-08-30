CREATE TABLE p_and_c.carrier_alias_map (
	id varchar(256) NOT NULL,
	alias varchar(256) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.carrier_alias_map OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.carrier_alias_map to rl_pc_data_analyst;
GO

Grant select on table p_and_c.carrier_alias_map to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.carrier_alias_map to rpauser;
GO


GRANT SELECT ON p_and_c.carrier_alias_map to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.carrier_alias_map to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.carrier_alias_map to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.carrier_alias_map to rl_p_and_c_d;
GO