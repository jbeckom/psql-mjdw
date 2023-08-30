CREATE TABLE p_and_c.raw_sompo_wc (
	named_insured varchar(256) NULL,
	run_date varchar(256) NULL,
	business_unit varchar(256) NULL,
	loc_code varchar(256) NULL,
	loc_desc varchar(256) NULL,
	effective_year varchar(256) NULL,
	"policy" varchar(256) NULL,
	claim_number_tpa varchar(256) NULL,
	claim_number_wins varchar(256) NULL,
	suffix varchar(256) NULL,
	status varchar(256) NULL,
	accident_date varchar(256) NULL,
	report_date varchar(256) NULL,
	closed_date varchar(256) NULL,
	claimant_name varchar(256) NULL,
	coverage varchar(256) NULL,
	driver_name varchar(256) NULL,
	body_part_and_damage varchar(256) NULL,
	cause_of_injury_and_situation varchar(256) NULL,
	nature_of_injury varchar(256) NULL,
	accident_description varchar(256) NULL,
	state varchar(256) NULL,
	ind_paid varchar(256) NULL,
	ind_reserve varchar(256) NULL,
	med_paid varchar(256) NULL,
	med_reserve varchar(256) NULL,
	exp_paid varchar(256) NULL,
	exp_reserve varchar(256) NULL,
	subro_recovery varchar(256) NULL,
	claim_recovery varchar(256) NULL,
	salvage_recovery varchar(256) NULL,
	deductible_reimbursement varchar(256) NULL,
	total_paid varchar(256) NULL,
	total_os_reserve varchar(256) NULL,
	gross_incurred varchar(256) NULL,
	incident_claim varchar(256) NULL,
	file_name varchar(256) NOT NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_sompo_wc OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_sompo_wc to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_sompo_wc to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_sompo_wc to rpauser;
GO
GRANT SELECT ON p_and_c.raw_sompo_wc to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_sompo_wc to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_sompo_wc to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_sompo_wc to rl_p_and_c_d;
GO