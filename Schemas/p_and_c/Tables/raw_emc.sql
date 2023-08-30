CREATE TABLE p_and_c.raw_emc (
	client varchar(256) NOT NULL,
	last_exp varchar(256) NOT NULL,
	claim_no varchar(256) NOT NULL,
	loss_dt varchar(256) NOT NULL,
	s varchar(256) NOT NULL,
	st varchar(256) NOT NULL,
	"class" varchar(256) NULL,
	loc varchar(256) NULL,
	driverclaimant varchar(256) NOT NULL,
	loss_description varchar(256) NOT NULL,
	occ varchar(256) NULL,
	dept varchar(256) NULL,
	age varchar(256) NULL,
	coverage varchar(256) NOT NULL,
	gross_paid_loss varchar(256) NOT NULL,
	loss_reserves varchar(256) NOT NULL,
	loss_recovery varchar(256) NOT NULL,
	total_incur_loss varchar(256) NOT NULL,
	net_paid_alloc_exp varchar(256) NOT NULL,
	file_name varchar(256) NOT NULL,
	uploaded_at varchar(256) NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_emc OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_emc to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_emc to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_emc to rpauser;
GO
GRANT SELECT ON p_and_c.raw_emc to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_emc to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_emc to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_emc to rl_p_and_c_d;
GO