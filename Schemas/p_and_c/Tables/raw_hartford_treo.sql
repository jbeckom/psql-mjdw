CREATE TABLE p_and_c.raw_hartford_treo (
	"LOB_Code" varchar(256) NOT NULL,
	"Line_of_Business" varchar(256) NOT NULL,
	"Line_of_Business_Detail" varchar(256) NULL,
	"Account_Name" varchar(256) NOT NULL,
	"Insured_Name" varchar(256) NOT NULL,
	"Policy_Period" varchar(256) NOT NULL,
	"Policy_Effective_Date" varchar(256) NOT NULL,
	"Policy_Expiration_Date" varchar(256) NOT NULL,
	"Policy_Number" varchar(256) NOT NULL,
	"Claim_Number" varchar(256) NOT NULL,
	"Legal_Action" varchar(256) NULL,
	"Litigation_Status" varchar(256) NULL,
	"Claimant/Insured_Driver_Name" varchar(256) NOT NULL,
	"Claimant_Name" varchar(256) NOT NULL,
	"Claimant_Occupation" varchar(256) NULL,
	"Claimant_Birth_Date" varchar(256) NULL,
	"Driver_Name_-_Insured" varchar(256) NULL,
	"Driver_Birth_Date_-_Insured" varchar(256) NULL,
	"Driver_License_#_-_Insured" varchar(256) NULL,
	"Vehicle_ID_Number_-_Insured" varchar(256) NULL,
	"Vehicle_Year_-_Insured" varchar(256) NULL,
	"Vehicle_Make_-_Insured" varchar(256) NULL,
	"Claimant_Gender" varchar(256) NULL,
	"Supervisor_Name" varchar(256) NULL,
	"Average_Weekly_Wage" varchar(256) NULL,
	"Claimant_Hire_Date" varchar(256) NULL,
	"NAICS_Code" varchar(256) NULL,
	"Nature_of_Injury_Code" varchar(256) NULL,
	"Nature_of_Injury_Description" varchar(256) NULL,
	"NCCI_Codes" varchar(256) NULL,
	"WC_Claim_Type" varchar(256) NULL,
	"WC_Body_Part_Code" varchar(256) NULL,
	"WC_Body_Part_Description" varchar(256) NULL,
	"WC_Cause_of_Injury_Code" varchar(256) NULL,
	"WC_Cause_of_Injury_Description" varchar(256) NULL,
	"WC_Nature_of_Injury_Code" varchar(256) NULL,
	"WC_Nature_of_Injury_Description" varchar(256) NULL,
	"Impaired_Part_of_Body" varchar(256) NULL,
	"Impairment_Percentage" varchar(256) NULL,
	"Injured_Body_Area" varchar(256) NULL,
	"Injured_Body_Part_Code" varchar(256) NULL,
	"Injured_Body_Part" varchar(256) NULL,
	"Injury_Category" varchar(256) NOT NULL,
	"Injury_Severity_Code" varchar(256) NOT NULL,
	"Injury_Severity_Description" varchar(256) NULL,
	"Disability_Type(s)" varchar(256) NULL,
	"Comp_Coverage_Code" varchar(256) NULL,
	"Claim_Description_Code" varchar(256) NOT NULL,
	"Coverage_Identification_Code" varchar(256) NULL,
	"Claim_Type" varchar(256) NOT NULL,
	"BI/PD_Indicator" varchar(256) NULL,
	"Catastrophe_Year" varchar(256) NOT NULL,
	"Catastrophe_Code" varchar(256) NULL,
	"Location_Code_(Current)" varchar(256) NULL,
	"Hierarchy_of_Locations_-_Level_2_(Current)" varchar(256) NOT NULL,
	"Hierarchy_of_Locations_-_Level_3_(Current)" varchar(256) NULL,
	"Hierarchy_of_Locations_-_Level_4_(Current)" varchar(256) NULL,
	"Accident_Date" varchar(256) NOT NULL,
	"Accident_Time" varchar(256) NOT NULL,
	"Reported_Date" varchar(256) NOT NULL,
	"Reported_to_Employer_Date" varchar(256) NULL,
	"Reported_to_Carrier_Date" varchar(256) NOT NULL,
	"Closed_Date" varchar(256) NULL,
	"Date_of_Death" varchar(256) NULL,
	"Initial_Disability_Start_Date" varchar(256) NULL,
	"Last_Disability_End_Date" varchar(256) NULL,
	"Released_to_work_Date" varchar(256) NULL,
	"Claim_Status" varchar(256) NOT NULL,
	"Accident_City/Town" varchar(256) NOT NULL,
	"Accident_State" varchar(256) NOT NULL,
	"Accident_ZIP_Code" varchar(256) NULL,
	"Location_Name/Location_Code_(Current)" varchar(256) NOT NULL,
	"Loss_Location_Address" varchar(256) NOT NULL,
	"Benefit_State" varchar(256) NOT NULL,
	"Risk_State" varchar(256) NOT NULL,
	"Accident_Description" varchar(256) NOT NULL,
	"Accident_Description_-_Details" varchar(4096) NOT NULL,
	"Claim_Description" varchar(256) NOT NULL,
	"Indemnity_Paid" varchar(256) NOT NULL,
	"Medical_Paid" varchar(256) NOT NULL,
	"Expense_Paid" varchar(256) NOT NULL,
	"Total_Paid" varchar(256) NOT NULL,
	"Indemnity_Outstanding" varchar(256) NOT NULL,
	"Medical_Outstanding" varchar(256) NOT NULL,
	"Expense_Outstanding" varchar(256) NOT NULL,
	"Total_Outstanding" varchar(256) NOT NULL,
	"Indemnity_Incurred" varchar(256) NOT NULL,
	"Medical_Incurred" varchar(256) NOT NULL,
	"Expense_Incurred" varchar(256) NOT NULL,
	"Total_Incurred" varchar(256) NOT NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_hartford_treo OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_hartford_treo to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_hartford_treo to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_hartford_treo to rpauser;
GO
GRANT SELECT ON p_and_c.raw_hartford_treo to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_hartford_treo to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_hartford_treo to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_hartford_treo to rl_p_and_c_d;
GO