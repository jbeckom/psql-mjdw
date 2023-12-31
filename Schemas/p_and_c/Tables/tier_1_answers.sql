DROP TABLE IF EXISTS p_and_c.tier_1_answers CASCADE;
GO

CREATE TABLE p_and_c.tier_1_answers (
	id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	response_id int4 NOT NULL,
	group_name varchar(256) NULL,
	start_date date NULL,
	completion_date date NOT NULL,
	bcc_report_address varchar(256) NULL,
	company_name varchar(256) NULL,
	respondent_name varchar(256) NULL,
	respondent_email varchar(256) NULL,
	president int4 NOT NULL,
	coo int4 NOT NULL,
	cfo int4 NOT NULL,
	cio int4 NOT NULL,
	risk_manager int4 NOT NULL,
	safety_mgr int4 NOT NULL,
	hr int4 NOT NULL,
	general_counsel int4 NOT NULL,
	controller int4 NOT NULL,
	other int4 NOT NULL,
	yes0 int4 NOT NULL,
	no0 int4 NOT NULL,
	yes1 int4 NOT NULL,
	no1 int4 NOT NULL,
	centralized int4 NOT NULL,
	decentralized int4 NOT NULL,
	na int4 NOT NULL,
	yes2 int4 NOT NULL,
	no2 int4 NOT NULL,
	partially2 int4 NOT NULL,
	unknown2 int4 NOT NULL,
	assessments int4 NOT NULL,
	audits int4 NOT NULL,
	standards int4 NOT NULL,
	maturity_model int4 NOT NULL,
	registers int4 NOT NULL,
	none0 int4 NOT NULL,
	yes3 int4 NOT NULL,
	no3 int4 NOT NULL,
	partially3 int4 NOT NULL,
	unknown3 int4 NOT NULL,
	highest_risk varchar(4096) NULL,
	yes4 int4 NOT NULL,
	no4 int4 NOT NULL,
	partially4 int4 NOT NULL,
	unknown4 int4 NOT NULL,
	claims_mgmt_title varchar(256) NULL,
	yes5 int4 NOT NULL,
	no5 int4 NOT NULL,
	partially5 int4 NOT NULL,
	unknown5 int4 NOT NULL,
	claim_reviews int4 NOT NULL,
	preferred_medical_providers int4 NOT NULL,
	rtw int4 NOT NULL,
	root_cause_analysis int4 NOT NULL,
	special_handling_instructions int4 NOT NULL,
	none1 int4 NOT NULL,
	rm_comments varchar(4096) NULL,
	yes6 int4 NOT NULL,
	no6 int4 NOT NULL,
	partially6 int4 NOT NULL,
	unknown6 int4 NOT NULL,
	yes7 int4 NOT NULL,
	no7 int4 NOT NULL,
	partially7 int4 NOT NULL,
	unknown7 int4 NOT NULL,
	yes8 int4 NOT NULL,
	no8 int4 NOT NULL,
	partially8 int4 NOT NULL,
	unknown8 int4 NOT NULL,
	yes9 int4 NOT NULL,
	no9 int4 NOT NULL,
	partially9 int4 NOT NULL,
	unknown9 int4 NOT NULL,
	yes10 int4 NOT NULL,
	no10 int4 NOT NULL,
	partially10 int4 NOT NULL,
	unknown10 int4 NOT NULL,
	bc_comments varchar(4096) NULL,
	yes11 int4 NOT NULL,
	no11 int4 NOT NULL,
	partially11 int4 NOT NULL,
	unknown11 int4 NOT NULL,
	yes12 int4 NOT NULL,
	no12 int4 NOT NULL,
	partially12 int4 NOT NULL,
	unknown12 int4 NOT NULL,
	yes13 int4 NOT NULL,
	no13 int4 NOT NULL,
	partially13 int4 NOT NULL,
	unknown13 int4 NOT NULL,
	yes14 int4 NOT NULL,
	no14 int4 NOT NULL,
	partially14 int4 NOT NULL,
	unknown14 int4 NOT NULL,
	yes15 int4 NOT NULL,
	no15 int4 NOT NULL,
	partially15 int4 NOT NULL,
	unknown15 int4 NOT NULL,
	contractual_comments varchar(4096) NULL,
	yes16 int4 NOT NULL,
	no16 int4 NOT NULL,
	partially16 int4 NOT NULL,
	unknown16 int4 NOT NULL,
	yes17 int4 NOT NULL,
	no17 int4 NOT NULL,
	partially17 int4 NOT NULL,
	unknown17 int4 NOT NULL,
	yes18 int4 NOT NULL,
	no18 int4 NOT NULL,
	partially18 int4 NOT NULL,
	unknown18 int4 NOT NULL,
	yes19 int4 NOT NULL,
	no19 int4 NOT NULL,
	partially19 int4 NOT NULL,
	unknown19 int4 NOT NULL,
	yes20 int4 NOT NULL,
	no20 int4 NOT NULL,
	partially20 int4 NOT NULL,
	unknown20 int4 NOT NULL,
	cyber_comments varchar(4096) NULL,
	yes21 int4 NOT NULL,
	no21 int4 NOT NULL,
	partially21 int4 NOT NULL,
	unknown21 int4 NOT NULL,
	yes22 int4 NOT NULL,
	no22 int4 NOT NULL,
	partially22 int4 NOT NULL,
	unknown22 int4 NOT NULL,
	yes23 int4 NOT NULL,
	no23 int4 NOT NULL,
	partially23 int4 NOT NULL,
	unknown23 int4 NOT NULL,
	yes24 int4 NOT NULL,
	no24 int4 NOT NULL,
	partially24 int4 NOT NULL,
	unknown24 int4 NOT NULL,
	yes25 int4 NOT NULL,
	no25 int4 NOT NULL,
	partially25 int4 NOT NULL,
	unknown25 int4 NOT NULL,
	ee_practices_comments varchar(4096) NULL,
	yes26 int4 NOT NULL,
	no26 int4 NOT NULL,
	partially26 int4 NOT NULL,
	unknown26 int4 NOT NULL,
	yes27 int4 NOT NULL,
	no27 int4 NOT NULL,
	partially27 int4 NOT NULL,
	unknown27 int4 NOT NULL,
	yes28 int4 NOT NULL,
	no28 int4 NOT NULL,
	partially28 int4 NOT NULL,
	unknown28 int4 NOT NULL,
	yes29 int4 NOT NULL,
	no29 int4 NOT NULL,
	partially29 int4 NOT NULL,
	unknown29 int4 NOT NULL,
	yes30 int4 NOT NULL,
	no30 int4 NOT NULL,
	partially30 int4 NOT NULL,
	unknown30 int4 NOT NULL,
	fleet_comments varchar(4096) NULL,
	yes31 int4 NOT NULL,
	no31 int4 NOT NULL,
	partially31 int4 NOT NULL,
	unknown31 int4 NOT NULL,
	yes32 int4 NOT NULL,
	no32 int4 NOT NULL,
	partially32 int4 NOT NULL,
	unknown32 int4 NOT NULL,
	yes33 int4 NOT NULL,
	no33 int4 NOT NULL,
	partially33 int4 NOT NULL,
	unknown33 int4 NOT NULL,
	yes34 int4 NOT NULL,
	no34 int4 NOT NULL,
	partially34 int4 NOT NULL,
	unknown34 int4 NOT NULL,
	yes35 int4 NOT NULL,
	no35 int4 NOT NULL,
	partially35 int4 NOT NULL,
	unknown35 int4 NOT NULL,
	safety_comments varchar(4096) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.tier_1_answers OWNER TO mj_admin;
GO

Grant select on table p_and_c.tier_1_answers to rl_pc_data_analyst;
GO

Grant update, insert, select on table p_and_c.tier_1_answers to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.tier_1_answers to rpauser;
GO

GRANT SELECT ON p_and_c.tier_1_answers to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.tier_1_answers to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.tier_1_answers to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.tier_1_answers to rl_p_and_c_d;
GO