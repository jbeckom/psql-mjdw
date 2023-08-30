CREATE TABLE p_and_c.benchmarking_report (
	client_id varchar(256) NOT NULL,
	policy_start_date date NOT NULL,
	industries varchar(256) NOT NULL,
	coverage_type varchar(256) NOT NULL,
	company_exposure_benchmarking_range_min int4 NOT NULL,
	company_exposure_benchmarking_range_max int8 NOT NULL,
	company_exposure_benchmarking_range_id varchar(256) NOT NULL,
	peer_group_size int4 NOT NULL,
	program_count_limit int4 NULL,
	"limit" int4 NULL,
	percent_below_or_equal_to_limit numeric(4,1) NULL,
	program_count_retention int4 NULL,
	retention int4 NULL,
	percent_below_or_equal_to_retention numeric(4,1) NULL,
	uploaded_at varchar(256) NULL,
	percent_below_or_equal_to_premium numeric(4,1) NULL,
	premium int4 NULL,
	program_count_premium int4 NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.benchmarking_report OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.benchmarking_report to rl_pc_data_analyst;
GO

Grant update, insert, select on table p_and_c.benchmarking_report to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.benchmarking_report to rpauser;
GO

GRANT SELECT ON p_and_c.benchmarking_report to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.benchmarking_report to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.benchmarking_report to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.benchmarking_report to rl_p_and_c_d;
GO