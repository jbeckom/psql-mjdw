DROP TABLE IF EXISTS pc_ops.normal_view_log;
GO

CREATE TABLE pc_ops.normal_view_log (
	guid uuid NOT NULL,
	view_name varchar(64) NOT NULL,
	query_timestamp timestamp NOT NULL,
    success boolean not null,
	error_msg varchar(256) NULL,
	CONSTRAINT normal_view_log_pkey PRIMARY KEY (guid)
);
GO

/*** PERMISSIONS ***/
ALTER TABLE pc_ops.normal_view_log OWNER TO mj_admin;
GO

Grant select on table pc_ops.normal_view_log to rl_pc_data_analyst;
GO

Grant insert, select on table pc_ops.normal_view_log to rl_pc_rpa_developer;
GO

Grant insert, select on table pc_ops.normal_view_log to rpauser;
GO
GRANT SELECT ON pc_ops.normal_view_log to rl_pc_ops_r;
GO

GRANT INSERT ON pc_ops.normal_view_log to rl_pc_ops_a;
GO

GRANT UPDATE ON pc_ops.normal_view_log to rl_pc_ops_w;
GO

GRANT DELETE ON pc_ops.normal_view_log to rl_pc_ops_d;
GO