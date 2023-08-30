CREATE TABLE p_and_c.raw_crum (
	insured_name varchar(256) NOT NULL,
	accident_state varchar(256) NOT NULL,
	accident_description varchar(1024) NOT NULL,
	claim_status varchar(256) NOT NULL,
	date_closed varchar(256) NULL,
	claimant_name varchar(256) NOT NULL,
	policy_number varchar(256) NOT NULL,
	claim_number varchar(256) NOT NULL,
	claim_type varchar(256) NULL,
	damage_type varchar(256) NULL,
	date_of_loss varchar(256) NOT NULL,
	date_reported varchar(256) NULL,
	loc_dept varchar(256) NULL,
	feature_status varchar(256) NULL,
	os_reserve varchar(256) NOT NULL,
	paid varchar(256) NOT NULL,
	alae varchar(256) NOT NULL,
	subro_salvage varchar(256) NOT NULL,
	total_incurred_inc_alae varchar(256) NOT NULL,
	filename varchar(256) NULL,
	uploaded_at varchar(256) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_crum OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_crum to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_crum to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_crum to rpauser;
GO
GRANT SELECT ON p_and_c.raw_crum to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_crum to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_crum to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_crum to rl_p_and_c_d;
GO