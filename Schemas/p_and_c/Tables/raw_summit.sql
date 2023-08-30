CREATE TABLE p_and_c.raw_summit (
	insured varchar(256) NOT NULL,
	policy_number varchar(256) NOT NULL,
	injured_worker varchar(256) NOT NULL,
	claim_number varchar(256) NOT NULL,
	job_title varchar(256) NOT NULL,
	work_location varchar(256) NOT NULL,
	hire_date varchar(256) NOT NULL,
	work_code varchar(256) NOT NULL,
	description varchar(4096) NOT NULL,
	date_of_injury varchar(256) NOT NULL,
	reported_to_carrier varchar(256) NOT NULL,
	returned_to_work varchar(256) NULL,
	cause_of_injury varchar(256) NOT NULL,
	body_part varchar(256) NOT NULL,
	nature_of_injury varchar(256) NOT NULL,
	adjustor varchar(256) NOT NULL,
	claim_type varchar(256) NOT NULL,
	claim_status varchar(256) NOT NULL,
	closed_date varchar(256) NOT NULL,
	deductible varchar(256) NULL,
	comp_medical varchar(256) NULL,
	billed_to_date varchar(256) NOT NULL,
	billed_this_month varchar(256) NOT NULL,
	remaining varchar(256) NOT NULL,
	paid_this_month_indemnity varchar(256) NOT NULL,
	paid_this_month_medical varchar(256) NOT NULL,
	paid_this_month_other varchar(256) NOT NULL,
	paid_to_date_indemnity varchar(256) NOT NULL,
	paid_to_date_medical varchar(256) NOT NULL,
	paid_to_date_other varchar(256) NOT NULL,
	reserves_indemnity varchar(256) NOT NULL,
	reserves_medical varchar(256) NOT NULL,
	reserves_other varchar(256) NOT NULL,
	total_incurred_indemnity varchar(256) NOT NULL,
	total_incurred_medical varchar(256) NOT NULL,
	total_incurred_other varchar(256) NOT NULL,
	file_name varchar(256) NOT NULL,
	uploaded_at varchar(256) NOT NULL,
	policy_period varchar(256) NULL,
	date_reopened varchar(256) NULL,
	agree_to_compensate varchar(256) NULL,
	date_of_total_denial varchar(256) NULL,
	employer_agree_w_description varchar(256) NULL,
	years_employed varchar(256) NULL,
	independent_contractor varchar(256) NULL,
	subcontractor varchar(256) NULL,
	drug_screen_completed varchar(256) NULL,
	light_duty_avail varchar(256) NULL,
	job_status varchar(256) NULL,
	job_status_eff_date varchar(256) NULL,
	workplace_id varchar(256) NULL,
	workplace_name varchar(256) NULL,
	total_paid_this_month varchar(256) NULL,
	total_paid_to_date varchar(256) NULL,
	total_reserves varchar(256) NULL,
	total_all_incurred varchar(256) NULL,
	subrogation varchar(256) NULL,
	subrogation_type varchar(256) NULL,
	additional_subrogation varchar(256) NULL,
	recovery_received varchar(256) NULL,
	adjustor_email varchar(256) NULL,
	adjustor_phone_number varchar(256) NULL,
	employer_contact_name varchar(256) NULL,
	employer_phone_number varchar(256) NULL,
	date_reported_to_employer varchar(256) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_summit OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_summit to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_summit to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_summit to rpauser;
GO
GRANT SELECT ON p_and_c.raw_summit to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_summit to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_summit to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_summit to rl_p_and_c_d;
GO