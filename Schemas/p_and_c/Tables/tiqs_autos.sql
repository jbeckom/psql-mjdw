CREATE TABLE p_and_c.tiqs_autos (
	client varchar(512) NULL,
	named_insured varchar(512) NULL,
	department varchar(512) NULL,
	insured_number varchar(512) NULL,
	"year" varchar(512) NULL,
	make varchar(512) NULL,
	model varchar(512) NULL,
	vin varchar(512) NULL,
	licensing_state varchar(512) NULL,
	garage_city varchar(512) NULL,
	city varchar(512) NULL,
	garage_state varchar(512) NULL,
	garage_zip_code varchar(512) NULL,
	garage_country varchar(512) NULL,
	cost_new varchar(512) NULL,
	stated_value varchar(512) NULL,
	attached_equipment_value varchar(512) NULL,
	vehicle_type varchar(512) NULL,
	use varchar(512) NULL,
	gross_vehicle_weight varchar(512) NULL,
	radius varchar(512) NULL,
	class_code varchar(512) NULL,
	owned_leased varchar(512) NULL,
	liability varchar(512) NULL,
	med_pay varchar(512) NULL,
	um_uim varchar(512) NULL,
	pip varchar(512) NULL,
	comp_ded varchar(512) NULL,
	coll_ded varchar(512) NULL,
	theft_ded varchar(512) NULL,
	additional_interest varchar(512) NULL,
	additional_interest_address varchar(512) NULL,
	additional_interest_city varchar(512) NULL,
	additional_interest_state varchar(512) NULL,
	additional_interest_zipcode varchar(512) NULL,
	interest_type varchar(512) NULL,
	title_name varchar(512) NULL,
	plated varchar(512) NULL,
	layup varchar(512) NULL,
	notes varchar(512) NULL,
	id varchar(512) NULL,
	uploaded_at date NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.tiqs_autos OWNER TO mj_admin;
GO

Grant select on table p_and_c.tiqs_autos to rl_pc_data_analyst;
GO

Grant update, insert, select on table p_and_c.tiqs_autos to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.tiqs_autos to rpauser;
GO
GRANT SELECT ON p_and_c.tiqs_autos to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.tiqs_autos to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.tiqs_autos to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.tiqs_autos to rl_p_and_c_d;
GO