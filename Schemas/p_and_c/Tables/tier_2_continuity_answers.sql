DROP TABLE IF EXISTS p_and_c.tier_2_continuity_answers CASCADE;
GO

CREATE TABLE p_and_c.tier_2_continuity_answers (
	id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	"Response_Id" int4 NOT NULL,
	"Group_Name" varchar(256) NULL,
	"Start_Date" date NULL,
	"Completion_Date" date NOT NULL,
	"BCC_Report_Address" varchar(256) NULL,
	company_name varchar(256) NOT NULL,
	respondent varchar(256) NOT NULL,
	respondent_email varchar(256) NOT NULL,
	"Board_Member" int4 NOT NULL,
	"CEO" int4 NOT NULL,
	"CFO" int4 NOT NULL,
	"COO" int4 NOT NULL,
	"CIO" int4 NOT NULL,
	"CSuite" int4 NOT NULL,
	"President" int4 NOT NULL,
	"Founder" int4 NOT NULL,
	"Vice_President" int4 NOT NULL,
	"Risk_Manager" int4 NOT NULL,
	"Safety_Director" int4 NOT NULL,
	"Senior_Manager" int4 NOT NULL,
	"Manager" int4 NOT NULL,
	"Team_Leader" int4 NOT NULL,
	"Supervisor" int4 NOT NULL,
	"Other" int4 NOT NULL,
	rare_0 int4 NOT NULL,
	unli_0 int4 NOT NULL,
	poss_0 int4 NOT NULL,
	like_0 int4 NOT NULL,
	cert_0 int4 NOT NULL,
	rare_1 int4 NOT NULL,
	unli_1 int4 NOT NULL,
	poss_1 int4 NOT NULL,
	like_1 int4 NOT NULL,
	cert_1 int4 NOT NULL,
	rare_10 int4 NOT NULL,
	unli_10 int4 NOT NULL,
	poss_10 int4 NOT NULL,
	like_10 int4 NOT NULL,
	cert_10 int4 NOT NULL,
	rare_20 int4 NOT NULL,
	unli_20 int4 NOT NULL,
	poss_20 int4 NOT NULL,
	like_20 int4 NOT NULL,
	cert_20 int4 NOT NULL,
	rare_30 int4 NOT NULL,
	unli_30 int4 NOT NULL,
	poss_30 int4 NOT NULL,
	like_30 int4 NOT NULL,
	cert_30 int4 NOT NULL,
	rare_40 int4 NOT NULL,
	unli_40 int4 NOT NULL,
	poss_40 int4 NOT NULL,
	like_40 int4 NOT NULL,
	cert_40 int4 NOT NULL,
	rare_50 int4 NOT NULL,
	unli_50 int4 NOT NULL,
	poss_50 int4 NOT NULL,
	like_50 int4 NOT NULL,
	cert_50 int4 NOT NULL,
	rare_60 int4 NOT NULL,
	unli_60 int4 NOT NULL,
	poss_60 int4 NOT NULL,
	like_60 int4 NOT NULL,
	cert_60 int4 NOT NULL,
	rare_70 int4 NOT NULL,
	unli_70 int4 NOT NULL,
	poss_70 int4 NOT NULL,
	like_70 int4 NOT NULL,
	cert_70 int4 NOT NULL,
	rare_80 int4 NOT NULL,
	unli_80 int4 NOT NULL,
	poss_80 int4 NOT NULL,
	like_80 int4 NOT NULL,
	cert_80 int4 NOT NULL,
	rare_90 int4 NOT NULL,
	unli_90 int4 NOT NULL,
	poss_90 int4 NOT NULL,
	like_90 int4 NOT NULL,
	cert_90 int4 NOT NULL,
	"S2_SS1_Q92_A0_ID269710" varchar(256) NOT NULL,
	yes_0 int4 NOT NULL,
	no_0 int4 NOT NULL,
	part_0 int4 NOT NULL,
	uns_0 int4 NOT NULL,
	yes_1 int4 NOT NULL,
	no_1 int4 NOT NULL,
	part_1 int4 NOT NULL,
	uns_1 int4 NOT NULL,
	hr_2 int4 NOT NULL,
	day_2 int4 NOT NULL,
	days_2 int4 NOT NULL,
	wk_2 int4 NOT NULL,
	unsure_2 int4 NOT NULL,
	yes_10 int4 NOT NULL,
	no_10 int4 NOT NULL,
	part_10 int4 NOT NULL,
	uns_10 int4 NOT NULL,
	na_11 int4 NOT NULL,
	low_11 int4 NOT NULL,
	med_11 int4 NOT NULL,
	high_11 int4 NOT NULL,
	na_12 int4 NOT NULL,
	low_12 int4 NOT NULL,
	med_12 int4 NOT NULL,
	high_12 int4 NOT NULL,
	na_13 int4 NOT NULL,
	low_13 int4 NOT NULL,
	med_13 int4 NOT NULL,
	high_13 int4 NOT NULL,
	na_14 int4 NOT NULL,
	low_14 int4 NOT NULL,
	med_14 int4 NOT NULL,
	high_14 int4 NOT NULL,
	na_15 int4 NOT NULL,
	low_15 int4 NOT NULL,
	med_15 int4 NOT NULL,
	high_15 int4 NOT NULL,
	high_10 int4 NOT NULL,
	mod_10 int4 NOT NULL,
	min_10 int4 NOT NULL,
	na_10 int4 NOT NULL,
	high_20 int4 NOT NULL,
	mod_20 int4 NOT NULL,
	min_20 int4 NOT NULL,
	na_20 int4 NOT NULL,
	yes_1_2 int4 NOT NULL,
	no_1_2 int4 NOT NULL,
	part_1_2 int4 NOT NULL,
	uns_1_2 int4 NOT NULL,
	yes_2 int4 NOT NULL,
	no_2 int4 NOT NULL,
	part_2 int4 NOT NULL,
	uns_2 int4 NOT NULL,
	yes_3 int4 NOT NULL,
	no_3 int4 NOT NULL,
	part_3 int4 NOT NULL,
	uns_3 int4 NOT NULL,
	yes_4 int4 NOT NULL,
	no_4 int4 NOT NULL,
	part_4 int4 NOT NULL,
	uns_4 int4 NOT NULL,
	not_10 int4 NOT NULL,
	neg_10 int4 NOT NULL,
	mod_10_2 int4 NOT NULL,
	sig_10 int4 NOT NULL,
	cri_10 int4 NOT NULL,
	not_20 int4 NOT NULL,
	neg_20 int4 NOT NULL,
	mod_20_2 int4 NOT NULL,
	sig_20 int4 NOT NULL,
	cri_20 int4 NOT NULL,
	not_30 int4 NOT NULL,
	neg_30 int4 NOT NULL,
	mod_30 int4 NOT NULL,
	sig_30 int4 NOT NULL,
	cri_30 int4 NOT NULL,
	not_40 int4 NOT NULL,
	neg_40 int4 NOT NULL,
	mod_40 int4 NOT NULL,
	sig_40 int4 NOT NULL,
	cri_40 int4 NOT NULL,
	not_50 int4 NOT NULL,
	neg_50 int4 NOT NULL,
	mod_50 int4 NOT NULL,
	sig_50 int4 NOT NULL,
	cri_50 int4 NOT NULL,
	yes_10_1 int4 NOT NULL,
	no_10_1 int4 NOT NULL,
	part_10_1 int4 NOT NULL,
	uns_10_1 int4 NOT NULL,
	yes_cont int4 NOT NULL,
	no_cont int4 NOT NULL,
	part_cont int4 NOT NULL,
	uns_cont int4 NOT NULL,
	finance int4 NOT NULL,
	gen_coun int4 NOT NULL,
	it int4 NOT NULL,
	risk_man int4 NOT NULL,
	other int4 NOT NULL,
	yes_20 int4 NOT NULL,
	no_20 int4 NOT NULL,
	part_20 int4 NOT NULL,
	uns_20 int4 NOT NULL,
	walk_30 int4 NOT NULL,
	tab_30 int4 NOT NULL,
	fun_30 int4 NOT NULL,
	full_30 int4 NOT NULL,
	none_30 int4 NOT NULL,
	evac_40 int4 NOT NULL,
	equip_40 int4 NOT NULL,
	call_40 int4 NOT NULL,
	none_40 int4 NOT NULL,
	yes_50 int4 NOT NULL,
	no_50 int4 NOT NULL,
	part_50 int4 NOT NULL,
	uns_50 int4 NOT NULL,
	yes_text int4 NOT NULL,
	no_text int4 NOT NULL,
	part_text int4 NOT NULL,
	uns_text int4 NOT NULL,
	yes_60 int4 NOT NULL,
	no_60 int4 NOT NULL,
	part_60 int4 NOT NULL,
	uns_60 int4 NOT NULL,
	yes_70 int4 NOT NULL,
	no_70 int4 NOT NULL,
	part_70 int4 NOT NULL,
	uns_70 int4 NOT NULL,
	yes_80 int4 NOT NULL,
	no_80 int4 NOT NULL,
	part_80 int4 NOT NULL,
	uns_80 int4 NOT NULL,
	yes_1_4 int4 NOT NULL,
	no_1_4 int4 NOT NULL,
	part_1_4 int4 NOT NULL,
	uns_1_4 int4 NOT NULL,
	yes_2_4 int4 NOT NULL,
	no_2_4 int4 NOT NULL,
	part_2_4 int4 NOT NULL,
	uns_2_4 int4 NOT NULL,
	yes_3_4 int4 NOT NULL,
	no_3_4 int4 NOT NULL,
	part_3_4 int4 NOT NULL,
	uns_3_4 int4 NOT NULL,
	yes_4_4 int4 NOT NULL,
	no_4_4 int4 NOT NULL,
	part_4_4 int4 NOT NULL,
	uns_4_4 int4 NOT NULL,
	yes_5 int4 NOT NULL,
	no_5 int4 NOT NULL,
	part_5 int4 NOT NULL,
	uns_5 int4 NOT NULL,
	yes_6 int4 NOT NULL,
	no_6 int4 NOT NULL,
	part_6 int4 NOT NULL,
	uns_6 int4 NOT NULL,
	na_6 int4 NOT NULL,
	yes_7 int4 NOT NULL,
	no_7 int4 NOT NULL,
	part_7 int4 NOT NULL,
	uns_7 int4 NOT NULL,
	yes_8 int4 NOT NULL,
	no_8 int4 NOT NULL,
	part_8 int4 NOT NULL,
	uns_8 int4 NOT NULL,
	yes_9 int4 NOT NULL,
	no_9 int4 NOT NULL,
	part_9 int4 NOT NULL,
	uns_9 int4 NOT NULL,
	on_10 int4 NOT NULL,
	und5_10 int4 NOT NULL,
	und25_10 int4 NOT NULL,
	over25_10 int4 NOT NULL,
	yes_10_2 int4 NOT NULL,
	no_10_2 int4 NOT NULL,
	part_10_2 int4 NOT NULL,
	uns_10_2 int4 NOT NULL,
	yes_20_2 int4 NOT NULL,
	no_20_2 int4 NOT NULL,
	part_20_2 int4 NOT NULL,
	uns_20_2 int4 NOT NULL,
	yes_30 int4 NOT NULL,
	no_30 int4 NOT NULL,
	part_30 int4 NOT NULL,
	uns_30 int4 NOT NULL,
	yes_1_3 int4 NOT NULL,
	no_1_3 int4 NOT NULL,
	part_1_3 int4 NOT NULL,
	uns_1_3 int4 NOT NULL,
	yes_2_3 int4 NOT NULL,
	no_2_3 int4 NOT NULL,
	part_2_3 int4 NOT NULL,
	uns_2_3 int4 NOT NULL,
	yes_3_3 int4 NOT NULL,
	no_3_3 int4 NOT NULL,
	part_3_3 int4 NOT NULL,
	uns_3_3 int4 NOT NULL,
	yes_4_3 int4 NOT NULL,
	no_4_3 int4 NOT NULL,
	part_4_3 int4 NOT NULL,
	uns_4_3 int4 NOT NULL,
	yes_0_5 int4 NOT NULL,
	no_0_5 int4 NOT NULL,
	part_0_5 int4 NOT NULL,
	uns_0_5 int4 NOT NULL,
	yes_1_5 int4 NOT NULL,
	no_1_5 int4 NOT NULL,
	part_1_5 int4 NOT NULL,
	uns_1_5 int4 NOT NULL,
	fund_2 int4 NOT NULL,
	pr_2 int4 NOT NULL,
	chain_2 int4 NOT NULL,
	stake_2 int4 NOT NULL,
	yes_3_5 int4 NOT NULL,
	no_3_5 int4 NOT NULL,
	part_3_5 int4 NOT NULL,
	uns_3_5 int4 NOT NULL,
	yes_4_5 int4 NOT NULL,
	no_4_5 int4 NOT NULL,
	part_4_5 int4 NOT NULL,
	uns_4_5 int4 NOT NULL,
	yes_5_5 int4 NOT NULL,
	no_5_5 int4 NOT NULL,
	part_5_5 int4 NOT NULL,
	uns_5_5 int4 NOT NULL,
	yes_1_6 int4 NOT NULL,
	no_1_6 int4 NOT NULL,
	part_1_6 int4 NOT NULL,
	uns_1_6 int4 NOT NULL,
	yes_2_6 int4 NOT NULL,
	no_2_6 int4 NOT NULL,
	part_2_6 int4 NOT NULL,
	uns_2_6 int4 NOT NULL,
	yes_3_6 int4 NOT NULL,
	no_3_6 int4 NOT NULL,
	part_3_6 int4 NOT NULL,
	uns_3_6 int4 NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.tier_2_continuity_answers OWNER TO mj_admin;
GO

Grant select on table p_and_c.tier_2_continuity_answers to rl_pc_data_analyst;
GO

Grant update, insert, select on table p_and_c.tier_2_continuity_answers to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.tier_2_continuity_answers to rpauser;
GO

GRANT SELECT ON p_and_c.tier_2_continuity_answers to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.tier_2_continuity_answers to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.tier_2_continuity_answers to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.tier_2_continuity_answers to rl_p_and_c_d;
GO