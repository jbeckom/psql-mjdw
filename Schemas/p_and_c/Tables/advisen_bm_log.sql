DROP TABLE p_and_c.advisen_bm_log;
GO

CREATE TABLE p_and_c.advisen_bm_log (
	trigger_date date NOT NULL,
	"name" varchar(256) NOT NULL,
	website varchar(256) NULL,
	address varchar(256) NULL,
	city varchar(256) NULL,
	state varchar(256) NULL,
	industry varchar(256) NULL,
	"type" varchar(256) NULL,
	revenue int8 NULL,
	employees int4 NULL,
	sic_code int4 NULL,
	gli_limit int4 NULL,
	gli_retention int4 NULL,
	gli_date date NULL,
	umbrella_limit int4 NULL,
	umbrella_retention int4 NULL,
	umbrella_date date NULL,
	do_limit int4 NULL,
	do_retention int4 NULL,
	do_date date NULL,
	prop_limit int4 NULL,
	prop_retention int4 NULL,
	prop_date date NULL,
	wco_limit int4 NULL,
	wco_retention int4 NULL,
	wco_date date NULL,
	prof_limit int4 NULL,
	prof_retention int4 NULL,
	prof_date date NULL,
	epl_limit int4 NULL,
	epl_retention int4 NULL,
	epl_date date NULL,
	fid_limit int4 NULL,
	fid_retention int4 NULL,
	fid_date date NULL,
	crm_limit int4 NULL,
	crm_retention int4 NULL,
	crm_date date NULL,
	cau_limit int4 NULL,
	cau_retention int4 NULL,
	cau_date date NULL,
	cyb_limit int4 NULL,
	cyb_retention int4 NULL,
	cyb_date date NULL,
	extra_limit_1 int4 NULL,
	extra_retention_1 int4 NULL,
	extra_date_1 date NULL,
	extra_limit_2 int4 NULL,
	extra_retention_2 int4 NULL,
	extra_date_2 date NULL,
	extra_limit_3 int4 NULL,
	extra_retention_3 int4 NULL,
	extra_date_3 date NULL,
	extra_limit_4 int4 NULL,
	extra_retention_4 int4 NULL,
	extra_date_4 date NULL,
	extra_lob_1 varchar(256) NULL,
	extra_lob_2 varchar(256) NULL,
	extra_lob_3 varchar(256) NULL,
	extra_lob_4 varchar(256) NULL,
	extra_lob_cnt int4 NULL,
	data_complete bool NULL DEFAULT false,
	request_sent bool NULL DEFAULT false,
	request_confirmed bool NULL DEFAULT false,
	results_received bool NULL DEFAULT false,
	results_saved bool NULL DEFAULT false,
	request_timestamp timestamp(0) NULL,
	client_id varchar(256) NULL,
	unique_id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	gli_premium int4 NULL,
	umbrella_premium int4 NULL,
	do_premium int4 NULL,
	prop_premium int4 NULL,
	wco_premium int4 NULL,
	prof_premium int4 NULL,
	epl_premium int4 NULL,
	fid_premium int4 NULL,
	crm_premium int4 NULL,
	cau_premium int4 NULL,
	cyb_premium int4 NULL,
	extra_premium_1 int4 NULL,
	extra_premium_2 int4 NULL,
	extra_premium_3 int4 NULL,
	extra_premium_4 int4 NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.advisen_bm_log OWNER TO mj_admin;
GO

Grant update, select on table p_and_c.advisen_bm_log to rl_pc_data_analyst;
GO

Grant update, insert, select on table p_and_c.advisen_bm_log to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.advisen_bm_log to rpauser;
GO

GRANT SELECT ON p_and_c.advisen_bm_log to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.advisen_bm_log to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.advisen_bm_log to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.advisen_bm_log to rl_p_and_c_d;
GO