CREATE TABLE p_and_c.raw_zic (
	"Accident_Description_Corporate" varchar(256) NOT NULL,
	"Accident_Description_Corp_Code" varchar(256) NOT NULL,
	"Accident_Description_Group" varchar(256) NULL,
	"Accident_Narrative" varchar(256) NOT NULL,
	"Warehouse_Last_Update_-_Formatted" varchar(256) NOT NULL,
	"Body_Part" varchar(256) NOT NULL,
	"Claim_Number" varchar(256) NOT NULL,
	"Handling_Supervisor" varchar(256) NOT NULL,
	"Claim_Level_Coverage" varchar(256) NOT NULL,
	"Claimant_Name" varchar(256) NOT NULL,
	"Claimant_Injury_Occupation" varchar(256) NULL,
	"Claim_Closed_Date_-_Formatted" varchar(256) NOT NULL,
	"Claim_Count" varchar(256) NOT NULL,
	"Coverage" varchar(256) NOT NULL,
	"Customer_Name" varchar(256) NOT NULL,
	"Fld_Value_1" varchar(256) NULL,
	"Fld_Value_10" varchar(256) NULL,
	"Fld_Value_2" varchar(256) NULL,
	"Fld_Value_3" varchar(256) NULL,
	"Fld_Value_4" varchar(256) NULL,
	"Fld_Value_5" varchar(256) NULL,
	"Fld_Value_6" varchar(256) NULL,
	"Fld_Value_7" varchar(256) NULL,
	"Fld_Value_8" varchar(256) NULL,
	"Fld_Value_9" varchar(256) NULL,
	"Date_Reported_to_ZA_-_Formatted" varchar(256) NOT NULL,
	"Date_of_Loss_-_Formatted" varchar(256) NOT NULL,
	"Detail_Loss_Location" varchar(256) NOT NULL,
	"Vehicle_Driver_Name" varchar(256) NULL,
	"Handling_Office" varchar(256) NOT NULL,
	"CIID_Insured_Name" varchar(256) NOT NULL,
	"Jurisdiction_State" varchar(256) NULL,
	"Legal_Activity_Suit_Indicator" varchar(256) NULL,
	"Site_Level_2" varchar(256) NULL,
	"Site_Level_2_Name" varchar(256) NULL,
	"Loss_Location_State" varchar(256) NOT NULL,
	"Loss_Year" varchar(256) NOT NULL,
	"Site_Lowest" varchar(256) NULL,
	"Site_Lowest_Name" varchar(256) NULL,
	"NCCI_Nature_of_Injury" varchar(256) NOT NULL,
	"Site_Level_1" varchar(256) NULL,
	"Site_Level_1_Name" varchar(256) NULL,
	"Policy_Identifier" varchar(256) NOT NULL,
	"Policy_Effective_Date_-_Formatted" varchar(256) NOT NULL,
	"Policy_Year" varchar(256) NOT NULL,
	"Claim_Setup_Type_Description" varchar(256) NOT NULL,
	"Claim_Status_Description" varchar(256) NOT NULL,
	"Sub_Coverage" varchar(256) NOT NULL,
	"Vehicle_Identification_Number" varchar(256) NULL,
	"Net_Incurred_Expense" varchar(256) NOT NULL,
	"Net_Incurred_Indemnity" varchar(256) NOT NULL,
	"Net_Incurred_Indmnty_BI/Md" varchar(256) NOT NULL,
	"Net_Incurred_Indmnty_PD/LT" varchar(256) NOT NULL,
	"Net_Incurred_Total" varchar(256) NOT NULL,
	"Paid_Expense" varchar(256) NOT NULL,
	"Paid_Indemnity" varchar(256) NOT NULL,
	"Paid_Indemnity_BI/Med" varchar(256) NOT NULL,
	"Paid_Indemnity_PD/LT" varchar(256) NOT NULL,
	"Paid_Total" varchar(256) NOT NULL,
	"Claim_Recovery_Total_Expense" varchar(256) NOT NULL,
	"Claim_Recovery_Total_Indemnity" varchar(256) NOT NULL,
	"Claim_Recovery_Indemnity_BI" varchar(256) NOT NULL,
	"Claim_Recovery_Indemnity_PD" varchar(256) NOT NULL,
	"Claim_Recovery_Total" varchar(256) NOT NULL,
	"Reserves_Expense" varchar(256) NOT NULL,
	"Reserves_Indemnity" varchar(256) NOT NULL,
	"Reserves_Indemnity_BI/Med" varchar(256) NOT NULL,
	"Reserves_Indemnity_PD/LT" varchar(256) NOT NULL,
	"Reserves_Total" varchar(256) NOT NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_zic OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_zic to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_zic to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_zic to rpauser;
GO
GRANT SELECT ON p_and_c.raw_zic to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_zic to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_zic to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_zic to rl_p_and_c_d;
GO