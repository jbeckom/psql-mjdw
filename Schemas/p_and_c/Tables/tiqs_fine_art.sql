CREATE TABLE p_and_c.tiqs_fine_art (
	client varchar(512) NULL,
	artist varchar(512) NULL,
	title_description varchar(512) NULL,
	"date" varchar(512) NULL,
	medium varchar(512) NULL,
	dimensions varchar(512) NULL,
	"condition" varchar(512) NULL,
	edition varchar(512) NULL,
	purchase_date varchar(512) NULL,
	display_location varchar(512) NULL,
	display_address varchar(512) NULL,
	display_city varchar(512) NULL,
	display_state varchar(512) NULL,
	display_zip_code varchar(512) NULL,
	purchase_price varchar(512) NULL,
	value varchar(512) NULL,
	appraisal_date varchar(512) NULL,
	appraised_by varchar(512) NULL,
	"owner" varchar(512) NULL,
	id varchar(512) NULL,
	uploaded_at date NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.tiqs_fine_art OWNER TO mj_admin;
GO

Grant select on table p_and_c.tiqs_fine_art to rl_pc_data_analyst;
GO

Grant update, insert, select on table p_and_c.tiqs_fine_art to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.tiqs_fine_art to rpauser;
GO
GRANT SELECT ON p_and_c.tiqs_fine_art to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.tiqs_fine_art to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.tiqs_fine_art to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.tiqs_fine_art to rl_p_and_c_d;
GO