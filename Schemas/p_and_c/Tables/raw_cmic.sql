CREATE TABLE p_and_c.raw_cmic (
	insured_name varchar(256) NOT NULL,
	policy_type varchar(256) NOT NULL,
	policy_number varchar(256) NOT NULL,
	loss_date varchar(256) NOT NULL,
	occurrence varchar(256) NOT NULL,
	report_date varchar(256) NOT NULL,
	report_time varchar(256) NOT NULL,
	loss_location varchar(256) NOT NULL,
	status varchar(256) NOT NULL,
	vehicle varchar(256) NULL,
	loss_description varchar(256) NOT NULL,
	reserve varchar(256) NOT NULL,
	paid varchar(256) NOT NULL,
	expense varchar(256) NOT NULL,
	salvage varchar(256) NOT NULL,
	subro varchar(256) NOT NULL,
	incurred varchar(256) NOT NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_cmic OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_cmic to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_cmic to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_cmic to rpauser;
GO
GRANT SELECT ON p_and_c.raw_cmic to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_cmic to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_cmic to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_cmic to rl_p_and_c_d;
GO