CREATE TABLE p_and_c.ciab_market_index (
	"Year" int4 NOT NULL,
	"Quarter" varchar(2) NOT NULL,
	"Segment" varchar(21) NOT NULL,
	"Change" numeric(6,3) NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.ciab_market_index OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.ciab_market_index to rl_pc_data_analyst;
GO

Grant select on table p_and_c.ciab_market_index to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.ciab_market_index to rpauser;
GO
GRANT SELECT ON p_and_c.ciab_market_index to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.ciab_market_index to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.ciab_market_index to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.ciab_market_index to rl_p_and_c_d;
GO