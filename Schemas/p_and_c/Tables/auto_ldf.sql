CREATE TABLE p_and_c.auto_ldf (
	"12_months" numeric(5,3) NOT NULL,
	"18_months" numeric(5,3) NOT NULL,
	"24_months" numeric(5,3) NOT NULL,
	"30_months" numeric(5,3) NOT NULL,
	"36_months" numeric(5,3) NOT NULL,
	"42_months" numeric(5,3) NOT NULL,
	"48_months" numeric(5,3) NOT NULL,
	"54_months" numeric(5,3) NOT NULL,
	"60_months" numeric(5,3) NOT NULL,
	"66_months" numeric(5,3) NOT NULL,
	"72_months" numeric(5,3) NOT NULL,
	"78_months" numeric(5,3) NOT NULL,
	"84_months" numeric(5,3) NOT NULL,
	"90_months" numeric(5,3) NOT NULL,
	"96_months" numeric(5,3) NOT NULL,
	"102_months" numeric(5,3) NOT NULL,
	"108_months" numeric(5,3) NOT NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.auto_ldf OWNER TO mj_admin;
GO

Grant insert, select on table p_and_c.auto_ldf to rl_pc_data_analyst;
GO

Grant select on table p_and_c.auto_ldf to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.auto_ldf to rpauser;
GO
GRANT SELECT ON p_and_c.auto_ldf to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.auto_ldf to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.auto_ldf to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.auto_ldf to rl_p_and_c_d;
GO