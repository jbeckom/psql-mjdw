DROP TABLE IF EXISTS p_and_c.tier_2_safety_answers CASCADE;
GO

CREATE TABLE p_and_c.tier_2_safety_answers (
	id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	"Response_Id" int4 NOT NULL,
	"Group_Name" varchar(256) NULL,
	"Start_Date" varchar(13) NULL,
	"Completion_Date" varchar(13) NOT NULL,
	"BCC_Report_Address" varchar(256) NULL,
	company_name varchar(256) NOT NULL,
	respondent varchar(256) NOT NULL,
	"CEO" int4 NOT NULL,
	"CFO" int4 NOT NULL,
	"President" int4 NOT NULL,
	"Founder" int4 NOT NULL,
	"Vice_President" int4 NOT NULL,
	"Risk_Manager" int4 NOT NULL,
	"Safety_Director" int4 NOT NULL,
	"Senior_Manager" int4 NOT NULL,
	"Manager" int4 NOT NULL,
	"Human_Resources" int4 NOT NULL,
	"Team_Leader" int4 NOT NULL,
	"Supervisor" int4 NOT NULL,
	"Other" int4 NOT NULL,
	"S1_SS1_Q4_A0_ID252612" varchar(4096) NULL,
	"S1_SS1_Q5_A0_ID250473" varchar(4096) NULL,
	ft int4 NOT NULL,
	pt int4 NOT NULL,
	"temp" int4 NOT NULL,
	seasonal int4 NOT NULL,
	ft_s int4 NOT NULL,
	ft_sm int4 NOT NULL,
	ft_m int4 NOT NULL,
	ft_ml int4 NOT NULL,
	ft_l int4 NOT NULL,
	pt_s int4 NOT NULL,
	pt_m int4 NOT NULL,
	pt_ml int4 NOT NULL,
	pt_l int4 NOT NULL,
	temp_s int4 NOT NULL,
	temp_m int4 NOT NULL,
	temp_l int4 NOT NULL,
	seasonal_s int4 NOT NULL,
	seasonal_m int4 NOT NULL,
	seasonal_l int4 NOT NULL,
	less_25_50 int4 NOT NULL,
	less_50_50 int4 NOT NULL,
	more_50_50 int4 NOT NULL,
	unk_50 int4 NOT NULL,
	less8_60 int4 NOT NULL,
	less15_60 int4 NOT NULL,
	more15_60 int4 NOT NULL,
	unk_60 int4 NOT NULL,
	less5_70 int4 NOT NULL,
	less10_70 int4 NOT NULL,
	more10_70 int4 NOT NULL,
	unk_70 int4 NOT NULL,
	"1_80" int4 NOT NULL,
	"2_80" int4 NOT NULL,
	"3more_80" int4 NOT NULL,
	cat_2 int4 NOT NULL,
	high_2 int4 NOT NULL,
	mod_2 int4 NOT NULL,
	neg_2 int4 NOT NULL,
	none_2 int4 NOT NULL,
	cat_3 int4 NOT NULL,
	high_3 int4 NOT NULL,
	mod_3 int4 NOT NULL,
	neg_3 int4 NOT NULL,
	none_3 int4 NOT NULL,
	cat_4 int4 NOT NULL,
	high_4 int4 NOT NULL,
	mod_4 int4 NOT NULL,
	neg_4 int4 NOT NULL,
	none_4 int4 NOT NULL,
	cat_5 int4 NOT NULL,
	high_5 int4 NOT NULL,
	mod_5 int4 NOT NULL,
	neg_5 int4 NOT NULL,
	none_5 int4 NOT NULL,
	cat_6 int4 NOT NULL,
	high_6 int4 NOT NULL,
	mod_6 int4 NOT NULL,
	neg_6 int4 NOT NULL,
	none_6 int4 NOT NULL,
	cat_7 int4 NOT NULL,
	high_7 int4 NOT NULL,
	mod_7 int4 NOT NULL,
	neg_7 int4 NOT NULL,
	none_7 int4 NOT NULL,
	cat_8 int4 NOT NULL,
	high_8 int4 NOT NULL,
	mod_8 int4 NOT NULL,
	neg_8 int4 NOT NULL,
	none_8 int4 NOT NULL,
	cat_9 int4 NOT NULL,
	high_9 int4 NOT NULL,
	mod_9 int4 NOT NULL,
	neg_9 int4 NOT NULL,
	none_9 int4 NOT NULL,
	cat_10 int4 NOT NULL,
	high_10 int4 NOT NULL,
	mod_10 int4 NOT NULL,
	neg_10 int4 NOT NULL,
	none_10 int4 NOT NULL,
	cat_11 int4 NOT NULL,
	high_11 int4 NOT NULL,
	mod_11 int4 NOT NULL,
	neg_11 int4 NOT NULL,
	none_11 int4 NOT NULL,
	cat_12 int4 NOT NULL,
	high_12 int4 NOT NULL,
	mod_12 int4 NOT NULL,
	neg_12 int4 NOT NULL,
	none_12 int4 NOT NULL,
	cat_13 int4 NOT NULL,
	high_13 int4 NOT NULL,
	mod_13 int4 NOT NULL,
	neg_13 int4 NOT NULL,
	none_13 int4 NOT NULL,
	less5_140 int4 NOT NULL,
	less10_140 int4 NOT NULL,
	more10_140 int4 NOT NULL,
	less5_150 int4 NOT NULL,
	less10_150 int4 NOT NULL,
	more10_150 int4 NOT NULL,
	less5_160 int4 NOT NULL,
	less10_160 int4 NOT NULL,
	more10_160 int4 NOT NULL,
	less5_170 int4 NOT NULL,
	less10_170 int4 NOT NULL,
	more10_170 int4 NOT NULL,
	less5_180 int4 NOT NULL,
	less10_180 int4 NOT NULL,
	more10_180 int4 NOT NULL,
	less5_190 int4 NOT NULL,
	less10_190 int4 NOT NULL,
	more10_190 int4 NOT NULL,
	less5_200 int4 NOT NULL,
	less10_200 int4 NOT NULL,
	more10_200 int4 NOT NULL,
	less5_210 int4 NOT NULL,
	less10_210 int4 NOT NULL,
	more10_210 int4 NOT NULL,
	less5_220 int4 NOT NULL,
	less10_220 int4 NOT NULL,
	more10_220 int4 NOT NULL,
	less5_230 int4 NOT NULL,
	less10_230 int4 NOT NULL,
	more10_230 int4 NOT NULL,
	less5_240 int4 NOT NULL,
	less10_240 int4 NOT NULL,
	more10_240 int4 NOT NULL,
	less5_250 int4 NOT NULL,
	less10_250 int4 NOT NULL,
	more10_250 int4 NOT NULL,
	haz_1 varchar(4096) NOT NULL,
	haz_2 varchar(256) NULL,
	haz_3 varchar(256) NULL,
	"S2_SS2_Q270_A0_ID254382" varchar(256) NULL,
	"S2_SS2_Q280_A1_ID254383" varchar(256) NULL,
	"33" varchar(256) NULL,
	above_1_34 varchar(256) NULL,
	saf_10 int4 NOT NULL,
	hr_10 int4 NOT NULL,
	opman_10 int4 NOT NULL,
	rm_10 int4 NOT NULL,
	sr_10 int4 NOT NULL,
	vendor_10 int4 NOT NULL,
	other_10 int4 NOT NULL,
	"S3_SS1_Q20_A1_ID250956" varchar(256) NULL,
	less1_30 int4 NOT NULL,
	less5_30 int4 NOT NULL,
	less10_30 int4 NOT NULL,
	more10_30 int4 NOT NULL,
	less1_40 int4 NOT NULL,
	less5_40 int4 NOT NULL,
	less10_40 int4 NOT NULL,
	more10_40 int4 NOT NULL,
	less10_50 int4 NOT NULL,
	less25_50 int4 NOT NULL,
	less50_50 int4 NOT NULL,
	less75_50 int4 NOT NULL,
	more75_50 int4 NOT NULL,
	yes_60 int4 NOT NULL,
	no_60 int4 NOT NULL,
	part_60 int4 NOT NULL,
	uns_60 int4 NOT NULL,
	"S3_SS1_Q70_A1_ID250961" varchar(256) NULL,
	yes_80 int4 NOT NULL,
	no_80 int4 NOT NULL,
	part_80 int4 NOT NULL,
	uns_80 int4 NOT NULL,
	"S3_SS1_Q90_A1_ID250476" varchar(256) NULL,
	yes_100 int4 NOT NULL,
	no_100 int4 NOT NULL,
	part_100 int4 NOT NULL,
	uns_100 int4 NOT NULL,
	con_110 int4 NOT NULL,
	driv_110 int4 NOT NULL,
	elec_110 int4 NOT NULL,
	fall_110 int4 NOT NULL,
	ghs_110 int4 NOT NULL,
	equip_110 int4 NOT NULL,
	ladd_110 int4 NOT NULL,
	hot_110 int4 NOT NULL,
	loto_110 int4 NOT NULL,
	mach_110 int4 NOT NULL,
	ppe_110 int4 NOT NULL,
	other_110 int4 NOT NULL,
	"S3_SS1_Q120_A0_ID250475" varchar(256) NULL,
	yes_130 int4 NOT NULL,
	no_130 int4 NOT NULL,
	part_130 int4 NOT NULL,
	uns_130 int4 NOT NULL,
	yes_140 int4 NOT NULL,
	no_140 int4 NOT NULL,
	part_140 int4 NOT NULL,
	uns_140 int4 NOT NULL,
	yes_150 int4 NOT NULL,
	no_150 int4 NOT NULL,
	part_150 int4 NOT NULL,
	uns_150 int4 NOT NULL,
	yes_151 int4 NOT NULL,
	no_151 int4 NOT NULL,
	part_151 int4 NOT NULL,
	uns_151 int4 NOT NULL,
	app_160 int4 NOT NULL,
	back_160 int4 NOT NULL,
	drug_160 int4 NOT NULL,
	int_160 int4 NOT NULL,
	phys_160 int4 NOT NULL,
	mvr_160 int4 NOT NULL,
	none_160 int4 NOT NULL,
	yes_170 int4 NOT NULL,
	no_170 int4 NOT NULL,
	part_170 int4 NOT NULL,
	uns_170 int4 NOT NULL,
	ann_180 int4 NOT NULL,
	post_180 int4 NOT NULL,
	post_con_180 int4 NOT NULL,
	pre_180 int4 NOT NULL,
	rand_180 int4 NOT NULL,
	reas_180 int4 NOT NULL,
	zero_181 int4 NOT NULL,
	one_181 int4 NOT NULL,
	six_181 int4 NOT NULL,
	ten_181 int4 NOT NULL,
	yes_182 int4 NOT NULL,
	no_182 int4 NOT NULL,
	part_182 int4 NOT NULL,
	uns_182 int4 NOT NULL,
	yes_190 int4 NOT NULL,
	no_190 int4 NOT NULL,
	part_190 int4 NOT NULL,
	uns_190 int4 NOT NULL,
	yes_200 int4 NOT NULL,
	no_200 int4 NOT NULL,
	part_200 int4 NOT NULL,
	uns_200 int4 NOT NULL,
	yes_210 int4 NOT NULL,
	no_210 int4 NOT NULL,
	part_210 int4 NOT NULL,
	uns_210 int4 NOT NULL,
	yes_20 int4 NOT NULL,
	no_20 int4 NOT NULL,
	part_20 int4 NOT NULL,
	uns_20 int4 NOT NULL,
	at_30 int4 NOT NULL,
	day_30 int4 NOT NULL,
	wk_30 int4 NOT NULL,
	mon_30 int4 NOT NULL,
	qtly_30 int4 NOT NULL,
	ann_30 int4 NOT NULL,
	post_30 int4 NOT NULL,
	mult_30 int4 NOT NULL,
	class_40 int4 NOT NULL,
	online_40 int4 NOT NULL,
	osha10_40 int4 NOT NULL,
	osha30_40 int4 NOT NULL,
	vid_40 int4 NOT NULL,
	cont_40 int4 NOT NULL,
	tool_40 int4 NOT NULL,
	yes_0 int4 NOT NULL,
	no_0 int4 NOT NULL,
	part_0 int4 NOT NULL,
	uns_0 int4 NOT NULL,
	rev_1 int4 NOT NULL,
	pmp_1 int4 NOT NULL,
	root_1 int4 NOT NULL,
	spec_1 int4 NOT NULL,
	tpa_1 int4 NOT NULL,
	none_1 int4 NOT NULL,
	yes_2 int4 NOT NULL,
	no_2 int4 NOT NULL,
	part_2 int4 NOT NULL,
	uns_2 int4 NOT NULL,
	at_3 int4 NOT NULL,
	post_3 int4 NOT NULL,
	rtw_3 int4 NOT NULL,
	exec_3 int4 NOT NULL,
	light_3 int4 NOT NULL,
	ack_3 int4 NOT NULL,
	train_3 int4 NOT NULL,
	pol_3 int4 NOT NULL,
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
	compliant1 int4 NOT NULL,
	reactive1 int4 NOT NULL,
	managed1 int4 NOT NULL,
	embedded1 int4 NOT NULL,
	leading1 int4 NOT NULL,
	compliant2 int4 NOT NULL,
	reactive2 int4 NOT NULL,
	managed2 int4 NOT NULL,
	embedded2 int4 NOT NULL,
	leading2 int4 NOT NULL,
	compliant3 int4 NOT NULL,
	reactive3 int4 NOT NULL,
	managed3 int4 NOT NULL,
	embedded3 int4 NOT NULL,
	leading3 int4 NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.tier_2_safety_answers OWNER TO mj_admin;
GO

Grant select on table p_and_c.tier_2_safety_answers to rl_pc_data_analyst;
GO

Grant update, insert, select on table p_and_c.tier_2_safety_answers to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.tier_2_safety_answers to rpauser;
GO

GRANT SELECT ON p_and_c.tier_2_safety_answers to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.tier_2_safety_answers to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.tier_2_safety_answers to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.tier_2_safety_answers to rl_p_and_c_d;
GO