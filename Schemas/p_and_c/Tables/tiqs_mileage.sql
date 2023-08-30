CREATE TABLE p_and_c.tiqs_mileage (
	client varchar(512) NULL,
	reporting_month varchar(512) NULL,
	"year" varchar(512) NULL,
	mileage varchar(512) NULL,
	id varchar(512) NULL,
	uploaded_at date NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.tiqs_mileage OWNER TO mj_admin;
GO

Grant select on table p_and_c.tiqs_mileage to rl_pc_data_analyst;
GO

Grant update, insert, select on table p_and_c.tiqs_mileage to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.tiqs_mileage to rpauser;
GO
GRANT SELECT ON p_and_c.tiqs_mileage to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.tiqs_mileage to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.tiqs_mileage to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.tiqs_mileage to rl_p_and_c_d;
GO