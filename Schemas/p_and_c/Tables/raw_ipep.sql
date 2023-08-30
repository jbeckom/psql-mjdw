DROP TABLE p_and_c.raw_ipep CASCADE;
GO

CREATE TABLE p_and_c.raw_ipep (
	hire_date varchar (256) NULL,
	adjusting_loc_received_date varchar(256) NOT NULL,
	begin_date varchar(256) NOT NULL,
	birth_date varchar(256) NOT NULL,
	body_part_desc varchar(256) NOT NULL,
	catastrophe_desc varchar(256) NULL,
	claimant_comment varchar(256) NULL,
	claimant_id varchar(256) NOT NULL,
	claimant_name varchar(256) NOT NULL,
	claimant_status_desc varchar(256) NOT NULL,
	claimant_type_desc varchar(256) NOT NULL,
	claim_cause_desc varchar(256) NOT NULL,
	claim_id varchar(256) NOT NULL,
	claim_number varchar(256) NOT NULL,
	claim_total varchar(256) NOT NULL,
	class_code varchar(256) NOT NULL,
	client_code varchar(256) NOT NULL,
	closed_date varchar(256) NULL,
	deductible_amount varchar(256) NOT NULL,
	denied varchar(256) NOT NULL,
	end_date varchar(256) NOT NULL,
	end_status varchar(256) NOT NULL,
	end_type varchar(256) NOT NULL,
	estimated_excess_recovery varchar(256) NULL,
	estimated_subro_recovery varchar(256) NULL,
	examiner_code varchar(256) NOT NULL,
	examiner_desc varchar(256) NOT NULL,
	fiscal_year_desc varchar(256) NOT NULL,
	incident_date varchar(256) NOT NULL,
	incident_desc varchar(256) NOT NULL,
	incident_name varchar(256) NULL,
	incident_reported_date varchar(256) NULL,
	injury_illness_desc varchar(256) NOT NULL,
	insurance_type varchar(256) NOT NULL,
	insurance_type_desc varchar(256) NOT NULL,
	insured_group_desc varchar(256) NOT NULL,
	insured_group_id varchar(256) NOT NULL,
	insured_name1 varchar(256) NOT NULL,
	insured_type_code varchar(256) NOT NULL,
	insurer_name varchar(256) NOT NULL,
	jurisdiction_code varchar(256) NOT NULL,
	jurisdiction_desc varchar(256) NOT NULL,
	label1 varchar(256) NOT NULL,
	label2 varchar(256) NOT NULL,
	label3 varchar(256) NOT NULL,
	label4 varchar(256) NOT NULL,
	label5 varchar(256) NOT NULL,
	label6 varchar(256) NOT NULL,
	litigated varchar(256) NOT NULL,
	nature_of_injury_desc varchar(256) NOT NULL,
	org1_code varchar(256) NULL,
	org1_code_alternate varchar(256) NULL,
	org1_desc varchar(256) NULL,
	org1_desc_alternate varchar(256) NULL,
	org2_code varchar(256) NULL,
	org2_code_alternate varchar(256) NULL,
	org2_desc varchar(256) NULL,
	org2_desc_alternate varchar(256) NULL,
	org3_code varchar(256) NULL,
	org3_code_alternate varchar(256) NULL,
	org3_desc varchar(256) NULL,
	org3_desc_alternate varchar(256) NULL,
	org4_code varchar(256) NULL,
	org4_code_alternate varchar(256) NULL,
	org4_desc varchar(256) NULL,
	org4_desc_alternate varchar(256) NULL,
	org5_code varchar(256) NULL,
	org5_code_alternate varchar(256) NULL,
	org5_desc varchar(256) NULL,
	org5_desc_alternate varchar(256) NULL,
	org6_code varchar(256) NULL,
	org6_code_alternate varchar(256) NULL,
	org6_desc varchar(256) NULL,
	org6_desc_alternate varchar(256) NULL,
	payment_amount varchar(256) NOT NULL,
	payment_amount1 varchar(256) NOT NULL,
	payment_amount1_period varchar(256) NOT NULL,
	payment_amount2 varchar(256) NOT NULL,
	payment_amount2_period varchar(256) NOT NULL,
	payment_amount3 varchar(256) NOT NULL,
	payment_amount3_period varchar(256) NOT NULL,
	payment_amount4 varchar(256) NOT NULL,
	payment_amount4_period varchar(256) NOT NULL,
	payment_amount5 varchar(256) NOT NULL,
	payment_amount5_period varchar(256) NOT NULL,
	payment_amount6 varchar(256) NOT NULL,
	payment_amount6_period varchar(256) NOT NULL,
	payment_amount_period varchar(256) NOT NULL,
	payment_no_reserve varchar(256) NOT NULL,
	payment_no_reserve1 varchar(256) NOT NULL,
	payment_no_reserve2 varchar(256) NOT NULL,
	payment_no_reserve3 varchar(256) NOT NULL,
	payment_no_reserve4 varchar(256) NOT NULL,
	payment_no_reserve5 varchar(256) NOT NULL,
	payment_no_reserve6 varchar(256) NOT NULL,
	payment_no_reserve_period varchar(256) NOT NULL,
	policy_effective_date varchar(256) NOT NULL,
	policy_expiration_date varchar(256) NOT NULL,
	policy_kind_code varchar(256) NULL,
	policy_kind_desc varchar(256) NULL,
	policy_number varchar(256) NOT NULL,
	policy_period_desc varchar(256) NOT NULL,
	policy_symbol varchar(256) NOT NULL,
	report_period_id varchar(256) NOT NULL,
	reserve_amount varchar(256) NOT NULL,
	reserve_amount1 varchar(256) NOT NULL,
	reserve_amount2 varchar(256) NOT NULL,
	reserve_amount3 varchar(256) NOT NULL,
	reserve_amount4 varchar(256) NOT NULL,
	reserve_amount5 varchar(256) NOT NULL,
	reserve_amount6 varchar(256) NOT NULL,
	reserve_amount_period varchar(256) NOT NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_ipep OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_ipep to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_ipep to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_ipep to rpauser;
GO
GRANT SELECT ON p_and_c.raw_ipep to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_ipep to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_ipep to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_ipep to rl_p_and_c_d;
GO