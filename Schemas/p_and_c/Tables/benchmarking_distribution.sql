CREATE TABLE p_and_c.benchmarking_distribution (
	client_id varchar(256) NOT NULL,
	policy_start_date date NOT NULL,
	coverage_type_id varchar(256) NOT NULL,
	occurrence_type_id int4 NOT NULL,
	range_min int4 NOT NULL,
	range_max int4 NOT NULL,
	percent_of_counts numeric(4,1) NOT NULL,
	percent_cumulative numeric(4,1) NULL,
	uploaded_at varchar(256) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.benchmarking_distribution OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.benchmarking_distribution to rl_pc_data_analyst;
GO

Grant update, insert, select on table p_and_c.benchmarking_distribution to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.benchmarking_distribution to rpauser;
GO


GRANT SELECT ON p_and_c.benchmarking_distribution to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.benchmarking_distribution to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.benchmarking_distribution to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.benchmarking_distribution to rl_p_and_c_d;
GO