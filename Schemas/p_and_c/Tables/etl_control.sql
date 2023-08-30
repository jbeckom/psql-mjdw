DROP TABLE IF EXISTS p_and_c.etl_control;
CREATE TABLE p_and_c.etl_control (
	input_folder_subpath varchar(256) NULL,
	filename_string varchar(256) NULL,
	raw_db_table varchar(256) NULL DEFAULT 'N/A'::character varying,
	rows_skipped numeric(4) NULL,
	input_headers varchar(4096) NULL,
	input_folder_path text NULL,
	column_delimiter varchar(256) NULL,
	sheet_name varchar(256) NULL,
	active bool NULL,
	test bool not null default false,
	table_headers varchar(4096) NULL,
	"encoding" varchar(10) NOT NULL DEFAULT 'UTF-8'::character varying
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.etl_control OWNER TO mj_admin;
GO

Grant select on table p_and_c.etl_control to rl_pc_data_analyst;
GO

Grant delete, update, insert, select on table p_and_c.etl_control to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.etl_control to rpauser;
GO
GRANT SELECT ON p_and_c.etl_control to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.etl_control to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.etl_control to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.etl_control to rl_p_and_c_d;
GO