CREATE TABLE p_and_c.raw_mitsui_email_non_wc (
	"Insured_name" varchar(256) NOT NULL,
	"Coverage" varchar(256) NULL,
	"MedInd" varchar(256) NOT NULL,
	"Lit" varchar(256) NULL,
	"Policy_Number" varchar(256) NOT NULL,
	"Claim_Number" varchar(256) NOT NULL,
	"Exp_Date" varchar(256) NOT NULL,
	"Claim_Year" varchar(256) NULL,
	"Loc_1" varchar(256) NOT NULL,
	"Loc_2" varchar(256) NULL,
	"Loc_3" varchar(256) NULL,
	"Loc_4" varchar(256) NULL,
	"Date_of_Loss" varchar(256) NOT NULL,
	"Claimant_Name" varchar(256) NOT NULL,
	"_Res" varchar(256) NULL,
	"_Paid" varchar(256) NULL,
	"_Recov" varchar(256) NULL,
	"_Incurred" varchar(256) NOT NULL,
	"Status" varchar(256) NOT NULL,
	"State" varchar(256) NOT NULL,
	"Claim_Description" varchar(256) NOT NULL,
	"Action" varchar(256) NULL,
	"Nature_of_Injury" varchar(256) NULL,
	"Cause_of_Injury" varchar(256) NULL,
	"Body_Part" varchar(256) NULL,
	"Date_Reported" varchar(256) NOT NULL,
	"Date_Entered" varchar(256) NULL,
	"Date_Closed" varchar(256) NULL,
	"Date_Last_Act" varchar(256) NOT NULL,
	"Date_Last_Pay" varchar(256) NULL,
	"Med_Res" varchar(256) NOT NULL,
	"Med_Paid" varchar(256) NOT NULL,
	"Med_Recov" varchar(256) NULL,
	"Ind_Res" varchar(256) NOT NULL,
	"Ind_Paid" varchar(256) NOT NULL,
	"Ind_Recov" varchar(256) NULL,
	"DCC_Res" varchar(256) NOT NULL,
	"DCC_Paid" varchar(256) NOT NULL,
	"DCC_Recov" varchar(256) NULL,
	"Deductible" varchar(256) NOT NULL,
	"Agent_Name" varchar(256) NULL,
	"Marketing" varchar(256) NULL,
	"Claims" varchar(256) NULL,
	"Eff_Date" varchar(256) NOT NULL,
	"Account_NR" varchar(256) NULL,
	"As_of_Date" varchar(256) NULL,
	"Auto_Loss_Type_Code" varchar(256) NULL,
	"Auto_Loss_Type_Desc" varchar(256) NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL,
	"Policy_Year" varchar(256) NULL,
	"Claimant_Number" varchar(256) NULL,
	"Incdnt_Cnt" varchar(256) NULL,
	"Loc_1_desc" varchar(256) NULL,
	"Loc_2_desc" varchar(256) NULL,
	"Loc_3_desc" varchar(256) NULL,
	"Loc_4_desc" varchar(256) NULL,
	"Age" varchar(256) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_mitsui_email_non_wc OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_mitsui_email_non_wc to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_mitsui_email_non_wc to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_mitsui_email_non_wc to rpauser;
GO
GRANT SELECT ON p_and_c.raw_mitsui_email_non_wc to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_mitsui_email_non_wc to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_mitsui_email_non_wc to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_mitsui_email_non_wc to rl_p_and_c_d;
GO