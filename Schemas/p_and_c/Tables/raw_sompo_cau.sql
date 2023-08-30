CREATE TABLE p_and_c.raw_sompo_cau (
	named_insured varchar(256) NULL,
	business_unit varchar(256) NULL,
	loc_code varchar(256) NULL,
	los_desc varchar(256) NULL,
	policy_effective_year varchar(256) NULL,
	"policy" varchar(256) NULL,
	claim_number_tpa varchar(256) NULL,
	"claim_#_wins" varchar(256) NULL,
	"legacy_claim_#" varchar(256) NULL,
	suffix varchar(256) NULL,
	status varchar(256) NULL,
	accident_date varchar(256) NULL,
	report_date varchar(256) NULL,
	closed_date varchar(256) NULL,
	claimant_name varchar(256) NULL,
	coverage_name varchar(256) NULL,
	type_loss varchar(256) NULL,
	driver_name varchar(256) NULL,
	"body_part/damage" varchar(256) NULL,
	"cause_of_inj/situation" varchar(256) NULL,
	nature_of_injury varchar(256) NULL,
	accident_description varchar(1024) NULL,
	state varchar(256) NULL,
	indemnity_paid varchar(256) NULL,
	indemnity_reserve varchar(256) NULL,
	medical_paid varchar(256) NULL,
	medical_reserve varchar(256) NULL,
	expense_paid varchar(256) NULL,
	expense_reserve varchar(256) NULL,
	subro_recovery varchar(256) NULL,
	claim_recovery varchar(256) NULL,
	salvage_recovery varchar(256) NULL,
	deductible_reimbursement varchar(256) NULL,
	total_paid varchar(256) NULL,
	"total_o/s_reserve" varchar(256) NULL,
	gross_incurred varchar(256) NULL,
	incident_claim varchar(256) NULL,
	file_name varchar(256) NULL,
	uploaded_at date NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_sompo_cau OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_sompo_cau to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_sompo_cau to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_sompo_cau to rpauser;
GO
GRANT SELECT ON p_and_c.raw_sompo_cau to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_sompo_cau to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_sompo_cau to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_sompo_cau to rl_p_and_c_d;
GO