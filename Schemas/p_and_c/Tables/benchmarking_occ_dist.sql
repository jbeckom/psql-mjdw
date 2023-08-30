DROP TABLE p_and_c.benchmarking_occ_dist;
GO

create table p_and_c.benchmarking_occ_dist (
id uuid primary key,
client_id varchar(16) not null,
occ_type varchar(16),
occ_value varchar(16),
lob varchar(64),
percent_below varchar(8),
program_count varchar(8),
table_id uuid not null,
processed_date timestamp not null
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.benchmarking_occ_dist OWNER TO mj_admin;
GO

Grant select on table p_and_c.benchmarking_occ_dist to rl_pc_data_analyst;
GO

Grant update, insert, select on table p_and_c.benchmarking_occ_dist to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.benchmarking_occ_dist to rpauser;
GO
GRANT SELECT ON p_and_c.benchmarking_occ_dist to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.benchmarking_occ_dist to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.benchmarking_occ_dist to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.benchmarking_occ_dist to rl_p_and_c_d;
GO