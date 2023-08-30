DROP TABLE p_and_c.raw_sompo_gli CASCADE;
GO

CREATE TABLE p_and_c.raw_sompo_gli (
	named_insured varchar(256) NULL,
	policy_effective_year int NULL,
	"policy_#" varchar(256) NULL,
	"tpa_claim_#" varchar(256) NULL,
	"claim_#" varchar(256) NULL,
	"legacy_claim_#" varchar(256) NULL,
	suffix varchar(256) NULL,
	status varchar(256) NULL,
	accident_date date NULL,
	report_date date NULL,
	closed_date date NULL,
	claimant_name varchar(256) NULL,
	accident_description varchar(1024) NULL,
	loc_code varchar(256) NULL,
	location_description varchar(256) NULL,
	state varchar(256) NULL,
	indemnity_paid varchar(256) NULL,
	indemnity_reserve varchar(256) NULL,
	expense_paid varchar(256) NULL,
	expense_reserve varchar(256) NULL,
	subro_recovery varchar(256) NULL,
	claim_recovery varchar(256) NULL,
	salvage_recovery varchar(256) NULL,
	total_paid varchar(256) NULL,
	"total_o/s_reserve" varchar(256) NULL,
	net_incurred varchar(256) NULL,
	incident_claim varchar(256) NULL,
	filename varchar(256) NULL,
	uploaded_at date NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_sompo_gli OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_sompo_gli to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_sompo_gli to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_sompo_gli to rpauser;
GO
GRANT SELECT ON p_and_c.raw_sompo_gli to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_sompo_gli to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_sompo_gli to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_sompo_gli to rl_p_and_c_d;
GO