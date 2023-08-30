CREATE TABLE p_and_c.etl_logging (
	input_folder_subpath varchar(4096) NULL,
	filename_string varchar(4096) NULL,
	raw_db_table varchar(4096) NULL,
	rows_skipped int4 NULL,
	client_lookup_field varchar(4096) NULL,
	input_headers varchar(4096) NULL,
	input_folder_path varchar(4096) NULL,
	column_delimiter varchar(4096) NULL,
	row_delimiter varchar(4096) NULL,
	fixed_width bool NULL,
	table_headers varchar(4096) NULL,
	sheet_name varchar(4096) NULL,
	columns_skipped int4 NULL,
	filename_extension varchar(4096) NULL,
	active bool NULL,
	by_reference bool NULL,
	success bool NULL,
	rows_affected int4 NULL,
	error_message varchar(4096) NULL,
	execution_block varchar(4096) NULL,
	"timestamp" timestamp NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.etl_logging OWNER TO mj_admin;
GO

Grant select on table p_and_c.etl_logging to rl_pc_data_analyst;
GO

Grant update, insert, select on table p_and_c.etl_logging to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.etl_logging to rpauser;
GO
GRANT SELECT ON p_and_c.etl_logging to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.etl_logging to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.etl_logging to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.etl_logging to rl_p_and_c_d;
GO