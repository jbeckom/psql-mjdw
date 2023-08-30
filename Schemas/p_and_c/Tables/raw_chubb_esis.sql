CREATE TABLE p_and_c.raw_chubb_esis (
	"Clnt_Id" varchar(256) NOT NULL,
	"Clm_ID" varchar(256) NOT NULL,
	"File_ID" varchar(256) NOT NULL,
	"CRIS_Account_Num" varchar(256) NOT NULL,
	"CRIS_Claim_Num" varchar(256) NOT NULL,
	"Employee_Name" varchar(256) NOT NULL,
	"Soc_Sec_Num" varchar(256) NOT NULL,
	"Employee_Occ" varchar(256) NOT NULL,
	"State_Code" varchar(256) NOT NULL,
	"CRIS_LOC_Code" varchar(256) NOT NULL,
	"Site_code" varchar(256) NOT NULL,
	"Coverage_Grp_Code" varchar(256) NOT NULL,
	"Coverage_Code" varchar(256) NOT NULL,
	"Status_Code" varchar(256) NOT NULL,
	"Accident_Date" varchar(256) NOT NULL,
	"Entry_Date" varchar(256) NOT NULL,
	"Report_Date" varchar(256) NOT NULL,
	"Activity_Date" varchar(256) NOT NULL,
	"Close_Date" varchar(256) NULL,
	"Res_Med" varchar(256) NOT NULL,
	"Paid_Med" varchar(256) NOT NULL,
	"Res_Exp" varchar(256) NOT NULL,
	"Paid_Exp" varchar(256) NOT NULL,
	"Res_Comp" varchar(256) NOT NULL,
	"Paid_Comp" varchar(256) NOT NULL,
	"Recovery" varchar(256) NOT NULL,
	"Carrier_Code" varchar(256) NOT NULL,
	"Acc_Desc" varchar(256) NOT NULL,
	"Claim_Type_Code" varchar(256) NOT NULL,
	"Cause_Code" varchar(256) NOT NULL,
	"Hazard_Code" varchar(256) NOT NULL,
	"Injury_Code" varchar(256) NOT NULL,
	"Policy_Num" varchar(256) NOT NULL,
	"Sex" varchar(256) NULL,
	"Age" varchar(256) NULL,
	"Jurisdiction_Code" varchar(256) NOT NULL,
	"Aim_Code" varchar(256) NOT NULL,
	"Process_Aim" varchar(256) NOT NULL,
	"Avg_Week_Wage" varchar(256) NOT NULL,
	"Job_Class_Code" varchar(256) NULL,
	"Hire_Date" varchar(256) NULL,
	"Plant_Division" varchar(256) NOT NULL,
	"Special_Analysis" varchar(256) NULL,
	"BCO_Code" varchar(256) NOT NULL,
	"Legal_Ind" varchar(256) NOT NULL,
	"TCM_Ind" varchar(256) NOT NULL,
	"FCM_Ind" varchar(256) NOT NULL,
	"Int_Disab_ind" varchar(256) NOT NULL,
	"UR_Ind" varchar(256) NOT NULL,
	"Claims_made_date" varchar(256) NULL,
	"Birth_Date" varchar(256) NULL,
	"Death_date" varchar(256) NULL,
	"Emp_Aw_Date" varchar(256) NULL,
	"Comp_Rate" varchar(256) NOT NULL,
	"Denial_Ind" varchar(256) NULL,
	"Denial_Desc" varchar(256) NULL,
	"Policy_Inception_Date" varchar(256) NOT NULL,
	"Policy_Expiration_Date" varchar(256) NOT NULL,
	"Prior_TPA_Claim_Number" varchar(256) NULL,
	"Medicare_Ind" varchar(256) NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_chubb_esis OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_chubb_esis to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_chubb_esis to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_chubb_esis to rpauser;
GO
GRANT SELECT ON p_and_c.raw_chubb_esis to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_chubb_esis to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_chubb_esis to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_chubb_esis to rl_p_and_c_d;
GO