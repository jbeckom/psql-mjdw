CREATE TABLE p_and_c.raw_obam (
	accident_location varchar(256) NULL,
	accident_state varchar(256) NULL,
	account_number varchar(256) NOT NULL,
	age varchar(256) NULL,
	alloc_exp_rsv varchar(256) NOT NULL,
	attaching_date varchar(256) NOT NULL,
	bill_of_lading_date varchar(256) NULL,
	broker_id varchar(256) NOT NULL,
	broker_name varchar(256) NOT NULL,
	cause_of_accident varchar(256) NULL,
	cause_of_accident_1 varchar(256) NULL,
	cause_of_accident_2 varchar(256) NULL,
	cause_of_accident_3 varchar(256) NULL,
	cause_of_accident_description_1 varchar(256) NULL,
	cause_of_accident_description_2 varchar(256) NULL,
	cause_of_accident_description_3 varchar(256) NULL,
	cert_number varchar(256) NOT NULL,
	claim_declaration varchar(256) NULL,
	claim_description varchar(256) NULL,
	claim_number varchar(256) NULL,
	claim_status varchar(256) NULL,
	claim_suffix varchar(256) NULL,
	claim_total varchar(256) NOT NULL,
	claimant_name varchar(256) NULL,
	claimant_number varchar(256) NULL,
	claimant_reference_number varchar(256) NULL,
	closed_date varchar(256) NULL,
	"comments" varchar(256) NULL,
	creation_date varchar(256) NULL,
	customer_city varchar(256) NULL,
	customer_location varchar(256) NULL,
	customer_number varchar(256) NOT NULL,
	customer_state varchar(256) NULL,
	date_of_loss varchar(256) NULL,
	date_reported varchar(256) NULL,
	deductible_recovery varchar(256) NOT NULL,
	description varchar(256) NULL,
	driver_first_name varchar(256) NULL,
	driver_last_name varchar(256) NULL,
	expenses_paid varchar(256) NOT NULL,
	expiration_date varchar(256) NOT NULL,
	full_claim_number varchar(256) NULL,
	incident varchar(256) NULL,
	insured_merchandise varchar(256) NULL,
	insured_name varchar(256) NOT NULL,
	job_description varchar(256) NULL,
	legal_expenses varchar(256) NOT NULL,
	location_description varchar(256) NULL,
	location_id varchar(256) NOT NULL,
	loss_paid varchar(256) NOT NULL,
	loss_reserve varchar(256) NOT NULL,
	loss_type varchar(256) NULL,
	loss_type_description varchar(256) NULL,
	major_line varchar(256) NULL,
	major_line_description varchar(256) NULL,
	ncci_description_1 varchar(256) NULL,
	ncci_description_2 varchar(256) NULL,
	ncci_description_3 varchar(256) NULL,
	net_incurred varchar(256) NOT NULL,
	no_of_days varchar(256) NULL,
	occupation_code varchar(256) NULL,
	packing_description varchar(256) NULL,
	platform_period varchar(256) NULL,
	policy_indicator varchar(256) NOT NULL,
	policy_issued_company varchar(256) NULL,
	policy_number varchar(256) NOT NULL,
	policy_period_id varchar(256) NOT NULL,
	producer_code varchar(256) NULL,
	producer_office_code varchar(256) NULL,
	pyramid varchar(256) NULL,
	recovery_amount varchar(256) NOT NULL,
	reference_number varchar(256) NULL,
	reopened_date varchar(256) NULL,
	sic_code varchar(256) NOT NULL,
	state varchar(256) NULL,
	subro varchar(256) NULL,
	suffix_status varchar(256) NULL,
	suit varchar(256) NULL,
	time_elapsed varchar(256) NOT NULL,
	trip_from varchar(256) NULL,
	trip_from_description varchar(256) NULL,
	trip_to varchar(256) NULL,
	trip_to_description varchar(256) NULL,
	type_of_loss varchar(256) NULL,
	unit_department varchar(256) NULL,
	use_ncci_description varchar(256) NOT NULL,
	vessel_warehouse varchar(256) NULL,
	"void" varchar(256) NULL,
	file_name varchar(256) NOT NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_obam OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_obam to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_obam to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_obam to rpauser;
GO
GRANT SELECT ON p_and_c.raw_obam to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_obam to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_obam to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_obam to rl_p_and_c_d;
GO