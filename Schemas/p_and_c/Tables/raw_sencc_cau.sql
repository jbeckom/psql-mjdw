CREATE TABLE p_and_c.raw_sencc_cau (
	"Policy_Year" varchar(256) NOT NULL,
	"Loc_Code" varchar(256) NOT NULL,
	"Dept_Code" varchar(256) NULL,
	"Loss_Date" varchar(256) NOT NULL,
	"Claim_#" varchar(256) NOT NULL,
	"Driver_Name" varchar(256) NOT NULL,
	"Claim_Type" varchar(256) NOT NULL,
	"Claim_Status" varchar(256) NOT NULL,
	"Close_Date" varchar(256) NOT NULL,
	"Paid_Loss" varchar(256) NOT NULL,
	"Paid_Expense" varchar(256) NOT NULL,
	"Reserve" varchar(256) NOT NULL,
	"Incurred" varchar(256) NOT NULL,
	"Claim_Count" varchar(256) NOT NULL,
	"Accident_State" varchar(256) NOT NULL,
	"Account_#" varchar(256) NOT NULL,
	"Adjuster_#" varchar(256) NOT NULL,
	"Adjuster_Name" varchar(256) NOT NULL,
	"BI_Coverage_Status" varchar(256) NULL,
	"BI_Incurred" varchar(256) NOT NULL,
	"BI_Paid_Expense" varchar(256) NOT NULL,
	"BI_Paid_Loss" varchar(256) NOT NULL,
	"BI_Reserve" varchar(256) NOT NULL,
	"Claim_Complexity" varchar(256) NOT NULL,
	"Closed_Claim_Count" varchar(256) NOT NULL,
	"Collision_Incurred" varchar(256) NOT NULL,
	"Collision_Paid_Expense" varchar(256) NOT NULL,
	"Collision_Paid_Loss" varchar(256) NOT NULL,
	"Collision_Reserve" varchar(256) NOT NULL,
	"Collision_Status" varchar(256) NOT NULL,
	"Comprehensive_Incurred" varchar(256) NOT NULL,
	"Comprehensive_Paid_Expense" varchar(256) NOT NULL,
	"Comprehensive_Paid_Loss" varchar(256) NOT NULL,
	"Comprehensive_Reserve" varchar(256) NOT NULL,
	"Comprehensive_Status" varchar(256) NULL,
	"Date_Reported_to_Sentry" varchar(256) NOT NULL,
	"Dept_Description" varchar(256) NULL,
	"Dept_Name" varchar(256) NULL,
	"Description" varchar(1000) NULL,
	"Employer_Lag_Days" varchar(256) NOT NULL,
	"Expense_Est" varchar(256) NOT NULL,
	"Foreign_Claim_#" varchar(256) NULL,
	"Incurred_incl_TPA" varchar(256) NOT NULL,
	"Incurred_Minus_Paid_Expense" varchar(256) NOT NULL,
	"Line_of_Business" varchar(256) NOT NULL,
	"Loc_Description" varchar(256) NULL,
	"Loc_Name" varchar(256) NOT NULL,
	"Location_City" varchar(256) NOT NULL,
	"Location_State" varchar(256) NOT NULL,
	"Loss_Date_-_Calendar_Year" varchar(256) NOT NULL,
	"Loss_Date_-_Fiscal_Year" varchar(256) NOT NULL,
	"Loss_Day_of_Week" varchar(256) NOT NULL,
	"MTD_Incurred" varchar(256) NOT NULL,
	"MTD_Paid_Expense" varchar(256) NOT NULL,
	"MTD_Paid_Loss" varchar(256) NOT NULL,
	"MTD_Paid_Loss_+_Expense" varchar(256) NOT NULL,
	"MTD_Reserve" varchar(256) NOT NULL,
	"Negligence_-_Auto" varchar(256) NOT NULL,
	"Open_Claim_Count" varchar(256) NOT NULL,
	"Paid_Expense_incl_TPA" varchar(256) NOT NULL,
	"Paid_Loss_+_Expense" varchar(256) NOT NULL,
	"Paid_Loss_+_Expense_incl_TPA" varchar(256) NOT NULL,
	"Paid_Loss_Incl_TPA" varchar(256) NOT NULL,
	"Policy_#" varchar(256) NOT NULL,
	"Policy_Description" varchar(256) NOT NULL,
	"Policy_Effective_Date" varchar(256) NOT NULL,
	"Policy_Expiration_Date" varchar(256) NOT NULL,
	"Property_Damage_Incurred" varchar(256) NOT NULL,
	"Property_Damage_Paid_Expense" varchar(256) NOT NULL,
	"Property_Damage_Paid_Loss" varchar(256) NOT NULL,
	"Property_Damage_Reserve" varchar(256) NOT NULL,
	"Property_Damage_Status" varchar(256) NOT NULL,
	"Record_Only" varchar(256) NOT NULL,
	"Record_Only_Claim_Count" varchar(256) NOT NULL,
	"Reopen_Date" varchar(256) NULL,
	"Sentry_Lag_Days" varchar(256) NOT NULL,
	"SIC_Code" varchar(256) NOT NULL,
	"Total_Lag_Days" varchar(256) NOT NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL,
	"Legacy_Policy_#" varchar(256) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_sencc_cau OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_sencc_cau to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_sencc_cau to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_sencc_cau to rpauser;
GO
GRANT SELECT ON p_and_c.raw_sencc_cau to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_sencc_cau to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_sencc_cau to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_sencc_cau to rl_p_and_c_d;
GO