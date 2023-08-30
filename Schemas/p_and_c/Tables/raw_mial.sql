CREATE TABLE p_and_c.raw_mial (
	client_id varchar(256) NOT NULL,
	requested_date varchar(256) NOT NULL,
	claimant_name varchar(256) NOT NULL,
	unique_no varchar(256) NOT NULL,
	"class" varchar(256) NOT NULL,
	state_no varchar(256) NOT NULL,
	injury_date varchar(256) NOT NULL,
	first_day_off varchar(256) NULL,
	return_date varchar(256) NULL,
	mmi_release varchar(256) NULL,
	injury varchar(256) NOT NULL,
	code varchar(256) NOT NULL,
	description varchar(256) NOT NULL,
	paid_this_month_compensation varchar(256) NOT NULL,
	paid_to_date_compensation varchar(256) NOT NULL,
	reserve_required_compensation varchar(256) NOT NULL,
	outstanding_compensation varchar(256) NOT NULL,
	paid_this_month_medical varchar(256) NOT NULL,
	paid_to_date_medical varchar(256) NOT NULL,
	reserve_required_medical varchar(256) NOT NULL,
	outstanding_medical varchar(256) NOT NULL,
	paid_this_month_legal varchar(256) NOT NULL,
	paid_to_date_legal varchar(256) NOT NULL,
	reserve_required_legal varchar(256) NOT NULL,
	outstanding_legal varchar(256) NOT NULL,
	paid_this_month_other varchar(256) NOT NULL,
	paid_to_date_other varchar(256) NOT NULL,
	reserve_required_other varchar(256) NOT NULL,
	outstanding_other varchar(256) NOT NULL,
	paid_this_month_total varchar(256) NOT NULL,
	paid_to_date_total varchar(256) NOT NULL,
	reserve_required_total varchar(256) NOT NULL,
	outstanding_total varchar(256) NOT NULL,
	ncci_injury varchar(256) NOT NULL,
	ncci_loss varchar(256) NOT NULL,
	ncci_settlement varchar(256) NOT NULL,
	ncci_recovery_spec varchar(256) NOT NULL,
	employer varchar(256) NOT NULL,
	"location" varchar(256) NOT NULL,
	claim_no varchar(256) NOT NULL,
	filename varchar(256) NOT NULL,
	uploaded_at varchar(256) NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_mial OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_mial to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_mial to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_mial to rpauser;
GO
GRANT SELECT ON p_and_c.raw_mial to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_mial to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_mial to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_mial to rl_p_and_c_d;
GO