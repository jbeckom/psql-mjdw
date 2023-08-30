CREATE TABLE p_and_c.raw_cinco (
	loc varchar(256) NULL,
	"policy" varchar(256) NOT NULL,
	policy_effect varchar(256) NOT NULL,
	named_insured varchar(256) NOT NULL,
	oc varchar(256) NOT NULL,
	cat varchar(256) NULL,
	loss_date varchar(256) NOT NULL,
	loss_description varchar(256) NOT NULL,
	loss_type varchar(256) NOT NULL,
	claimant_payee varchar(256) NOT NULL,
	paid varchar(256) NOT NULL,
	salv_subr varchar(256) NOT NULL,
	expense varchar(256) NOT NULL,
	end_rsv_or_month_closed varchar(256) NOT NULL,
	incurred varchar(256) NOT NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_cinco OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_cinco to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_cinco to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_cinco to rpauser;
GO
GRANT SELECT ON p_and_c.raw_cinco to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_cinco to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_cinco to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_cinco to rl_p_and_c_d;
GO