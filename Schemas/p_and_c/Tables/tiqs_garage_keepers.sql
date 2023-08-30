CREATE TABLE p_and_c.tiqs_garage_keepers (
	client varchar(512) NULL,
	address varchar(512) NULL,
	city varchar(512) NULL,
	state varchar(512) NULL,
	zip_code varchar(512) NULL,
	country varchar(512) NULL,
	"limit" varchar(512) NULL,
	deductible varchar(512) NULL,
	registration_plates varchar(512) NULL,
	notes varchar(512) NULL,
	comp_deductible varchar(512) NULL,
	id varchar(512) NULL,
	uploaded_at date NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.tiqs_garage_keepers OWNER TO mj_admin;
GO

Grant select on table p_and_c.tiqs_garage_keepers to rl_pc_data_analyst;
GO

Grant update, insert, select on table p_and_c.tiqs_garage_keepers to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.tiqs_garage_keepers to rpauser;
GO
GRANT SELECT ON p_and_c.tiqs_garage_keepers to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.tiqs_garage_keepers to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.tiqs_garage_keepers to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.tiqs_garage_keepers to rl_p_and_c_d;
GO