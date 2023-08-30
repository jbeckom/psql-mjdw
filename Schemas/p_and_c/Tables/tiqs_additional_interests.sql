DROP TABLE p_and_c.tiqs_additional_interests;
GO

CREATE TABLE p_and_c.tiqs_additional_interests (
	client varchar(512) NULL,
	location_number varchar(512) NULL,
	address varchar(512) NULL,
	city varchar(512) NULL,
	state varchar(512) NULL,
	zip_code varchar(512) NULL,
	country varchar(512) NULL,
	"name" varchar(1024) NULL,
	interest varchar(8192) NULL,
	"30_days_notice" varchar(512) NULL,
	additional_insured varchar(4096) NULL,
	loss_payee varchar(512) NULL,
	lender_loss_payable varchar(512) NULL,
	mortgagee varchar(512) NULL,
	loan_number varchar(512) NULL,
	id varchar(512) NULL,
	uploaded_at date NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.tiqs_additional_interests OWNER TO mj_admin;
GO

Grant select on table p_and_c.tiqs_additional_interests to rl_pc_data_analyst;
GO

Grant update, insert, select on table p_and_c.tiqs_additional_interests to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.tiqs_additional_interests to rpauser;
GO
GRANT SELECT ON p_and_c.tiqs_additional_interests to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.tiqs_additional_interests to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.tiqs_additional_interests to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.tiqs_additional_interests to rl_p_and_c_d;
GO