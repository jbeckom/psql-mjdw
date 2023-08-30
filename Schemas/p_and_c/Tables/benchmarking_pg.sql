DROP TABLE p_and_c.benchmarking_pg CASCADE;
GO

create table p_and_c.benchmarking_pg (
id uuid primary key,
client_id varchar(16) not null,
lob varchar(64) not null,
exposure_type varchar(64),
exposure_range varchar(64),
industry varchar(128),
pg_size varchar(8),
processed_date timestamp not null
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.benchmarking_pg OWNER TO mj_admin;
GO

Grant select on table p_and_c.benchmarking_pg to rl_pc_data_analyst;
GO

Grant update, insert, select on table p_and_c.benchmarking_pg to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.benchmarking_pg to rpauser;
GO
GRANT SELECT ON p_and_c.benchmarking_pg to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.benchmarking_pg to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.benchmarking_pg to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.benchmarking_pg to rl_p_and_c_d;
GO