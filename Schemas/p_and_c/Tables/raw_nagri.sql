CREATE TABLE p_and_c.raw_nagri (
	claim varchar(256) NOT NULL,
	claimant varchar(256) NOT NULL,
	claimant_name varchar(256) NOT NULL,
	claimant_address varchar(256) NULL,
	claimant_address2 varchar(256) NULL,
	claimant_address3 varchar(256) NULL,
	claimant_city varchar(256) NULL,
	claimant_state varchar(256) NOT NULL,
	claimant_zip_code varchar(256) NULL,
	account varchar(256) NOT NULL,
	"policy" varchar(256) NOT NULL,
	effective_year varchar(256) NOT NULL,
	effective_date varchar(256) NOT NULL,
	expiration_date varchar(256) NOT NULL,
	insured_name varchar(256) NOT NULL,
	insured_address varchar(256) NOT NULL,
	insured_address2 varchar(256) NULL,
	insured_address3 varchar(256) NULL,
	insured_city varchar(256) NOT NULL,
	insured_state varchar(256) NOT NULL,
	insured_zip_code varchar(256) NOT NULL,
	aslob varchar(256) NOT NULL,
	line_of_business varchar(256) NOT NULL,
	accident_date varchar(256) NOT NULL,
	accident_day_of_week varchar(256) NOT NULL,
	report_date varchar(256) NOT NULL,
	time_of_loss varchar(256) NOT NULL,
	type_of_loss varchar(256) NULL,
	company_type_of_loss varchar(256) NULL,
	claim_description varchar(256) NOT NULL,
	examiner varchar(256) NOT NULL,
	risk_code varchar(256) NULL,
	risk_center varchar(256) NULL,
	date_of_birth varchar(256) NULL,
	date_of_hire varchar(256) NULL,
	date_reported_to_employer varchar(256) NULL,
	date_of_disability varchar(256) NULL,
	return_to_work_date varchar(256) NULL,
	sex varchar(256) NULL,
	class_code varchar(256) NOT NULL,
	class_description varchar(256) NULL,
	occupation varchar(256) NULL,
	body_part varchar(256) NULL,
	body_group varchar(256) NULL,
	cause_of_injury varchar(256) NULL,
	cause_group varchar(256) NULL,
	nature_of_injury varchar(256) NULL,
	nature_group varchar(256) NULL,
	type_of_injury varchar(256) NULL,
	driver varchar(256) NULL,
	claim_status varchar(256) NOT NULL,
	closed_date varchar(256) NULL,
	accident_state varchar(256) NOT NULL,
	jurisdiction_state varchar(256) NULL,
	indemnity_paid varchar(256) NULL,
	medical_paid varchar(256) NULL,
	employers_liability_paid varchar(256) NULL,
	expense_paid varchar(256) NULL,
	indemnity_reserve varchar(256) NOT NULL,
	medical_reserve varchar(256) NOT NULL,
	employers_liability_reserve varchar(256) NOT NULL,
	expense_reserve varchar(256) NOT NULL,
	deductible_billed varchar(256) NULL,
	deductible_paid varchar(256) NULL,
	"recovery" varchar(256) NULL,
	salvage varchar(256) NULL,
	subrogation varchar(256) NULL,
	file_name varchar(256) NOT NULL,
	uploaded_at varchar(256) NOT NULL,
	gross_incurred_loss varchar(256) NULL,
	claim_count varchar(256) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_nagri OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_nagri to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_nagri to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_nagri to rpauser;
GO
GRANT SELECT ON p_and_c.raw_nagri to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_nagri to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_nagri to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_nagri to rl_p_and_c_d;
GO