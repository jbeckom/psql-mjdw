CREATE TABLE p_and_c.raw_lmi_war (
	client_id varchar(256) NULL,
	lob varchar(256) NULL,
	valuation_date varchar(256) NULL,
	account_number varchar(256) NULL,
	claim_number varchar(256) NULL,
	loss_date varchar(256) NULL,
	jurisdiction_state varchar(256) NULL,
	nature_of_injury varchar(256) NULL,
	supp_nature_of_injury varchar(256) NULL,
	claim_id varchar(256) NULL,
	report_date varchar(256) NULL,
	location_code_desc varchar(256) NULL,
	part_of_body varchar(256) NULL,
	supp_part_of_body varchar(256) NULL,
	claimant_name varchar(256) NULL,
	close_date varchar(256) NULL,
	status varchar(256) NULL,
	tenure varchar(256) NULL,
	catalyst varchar(256) NULL,
	"policy" varchar(256) NULL,
	effective_date varchar(256) NULL,
	cause varchar(256) NULL,
	inc_indem varchar(256) NULL,
	paid_indem varchar(256) NULL,
	inc_med varchar(256) NULL,
	paid_med varchar(256) NULL,
	inc_exp varchar(256) NULL,
	paid_exp varchar(256) NULL,
	total_inc varchar(256) NULL,
	total_paid varchar(256) NULL,
	os_reserve varchar(256) NULL,
	filename varchar(256) NOT NULL,
	uploaded_at varchar(256) NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_lmi_war OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_lmi_war to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_lmi_war to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_lmi_war to rpauser;
GO
GRANT SELECT ON p_and_c.raw_lmi_war to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_lmi_war to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_lmi_war to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_lmi_war to rl_p_and_c_d;
GO