CREATE TABLE p_and_c.exchange_rates (
	"date" date NOT NULL,
	currency varchar(64) NOT NULL,
	rate numeric NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.exchange_rates OWNER TO mj_admin;
GO

Grant select on table p_and_c.exchange_rates to rl_pc_data_analyst;
GO

Grant update, insert, select on table p_and_c.exchange_rates to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.exchange_rates to rpauser;
GO
GRANT SELECT ON p_and_c.exchange_rates to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.exchange_rates to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.exchange_rates to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.exchange_rates to rl_p_and_c_d;
GO