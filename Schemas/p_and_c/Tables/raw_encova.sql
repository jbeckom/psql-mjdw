Drop Table p_and_c.raw_encova CASCADE;
GO

CREATE TABLE p_and_c.raw_encova (
	agency_name varchar(256) NOT NULL,
	agency_number varchar(256) NOT NULL,
	report_as_of varchar(256) NOT NULL,
	policyholder_name varchar(256) NOT NULL,
	policy_number varchar(256) NOT NULL,
	term varchar(256) NOT NULL,
	claim_number varchar(256) NOT NULL,
	loss_date varchar(256) NOT NULL,
	status varchar(256) NOT NULL,
	close_date varchar(256) NULL,
	line_of_business varchar(256) NULL,
	loss_description varchar(1024) NULL,
	claimant varchar(256) NULL,
	outstanding_loss_reserve varchar(256) NULL,
	incurred_loss varchar(256) NULL,
	incident_location varchar(256) NULL,
	loss_cause varchar(256) NULL,
	injured_person varchar(256) NULL,
	injury_illness_description varchar(256) NULL,
	result_in_death varchar(256) NULL,
	contents varchar(256) NULL,
	loss_party varchar(256) NULL,
	vehicle_type varchar(256) NULL,
	make varchar(256) NULL,
	model varchar(256) NULL,
	loss_occurred varchar(256) NULL,
	properties varchar(256) NULL,
	"type" varchar(256) NULL,
	"name" varchar(256) NULL,
	filename varchar(256) NULL,
	uploaded_at varchar(256) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_encova OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_encova to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_encova to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_encova to rpauser;
GO
GRANT SELECT ON p_and_c.raw_encova to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_encova to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_encova to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_encova to rl_p_and_c_d;
GO