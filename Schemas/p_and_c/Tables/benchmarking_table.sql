DROP TABLE p_and_c.benchmarking_table;
GO

create table p_and_c.benchmarking_table (
id uuid primary key,
range_usd varchar(32),
percent_counts varchar(16),
cumulative_percent varchar(16),
table_id uuid,
processed_date timestamp not null
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.benchmarking_table OWNER TO mj_admin;
GO

Grant select on table p_and_c.benchmarking_table to rl_pc_data_analyst;
GO

Grant update, insert, select on table p_and_c.benchmarking_table to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.benchmarking_table to rpauser;
GO
GRANT SELECT ON p_and_c.benchmarking_table to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.benchmarking_table to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.benchmarking_table to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.benchmarking_table to rl_p_and_c_d;
GO