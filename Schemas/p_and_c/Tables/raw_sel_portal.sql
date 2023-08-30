CREATE TABLE p_and_c.raw_sel_portal (
	"policy" varchar(256) NOT NULL,
	client_name varchar(256) NOT NULL,
	loss_file varchar(256) NOT NULL,
	date_of_loss varchar(256) NOT NULL,
	lag_time varchar(256) NOT NULL,
	large_account varchar(256) NOT NULL,
	location_identifier_exposure_location varchar(256) NULL,
	deductible varchar(256) NULL,
	loss_description varchar(256) NOT NULL,
	status varchar(256) NOT NULL,
	"date" varchar(256) NOT NULL,
	claimant varchar(256) NOT NULL,
	class_code varchar(256) NOT NULL,
	coverage varchar(256) NOT NULL,
	loss_reserves varchar(256) NOT NULL,
	loss_payments varchar(256) NOT NULL,
	expense_payments varchar(256) NOT NULL,
	loss_recoveries varchar(256) NOT NULL,
	loss_deductibles varchar(256) NOT NULL,
	expense_deductibles varchar(256) NOT NULL,
	filename varchar(256) NOT NULL,
	uploaded_at varchar(256) NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_sel_portal OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_sel_portal to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_sel_portal to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_sel_portal to rpauser;
GO
GRANT SELECT ON p_and_c.raw_sel_portal to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_sel_portal to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_sel_portal to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_sel_portal to rl_p_and_c_d;
GO