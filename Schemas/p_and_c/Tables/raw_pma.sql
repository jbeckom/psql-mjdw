CREATE TABLE p_and_c.raw_pma (
	"Primary_Account_Name" varchar(256) NOT NULL,
	"Account_Number" varchar(256) NOT NULL,
	"Policy_Number" varchar(256) NOT NULL,
	"Effective_Date" varchar(256) NOT NULL,
	"Expiration_Date" varchar(256) NOT NULL,
	"Location_Code" varchar(256) NOT NULL,
	"Location_Name" varchar(256) NOT NULL,
	"Claim_Number" varchar(256) NOT NULL,
	"Foreign_Claim_Number" varchar(256) NULL,
	"Full_Name" varchar(256) NOT NULL,
	"Accident_Date" varchar(256) NOT NULL,
	"Received_Date" varchar(256) NOT NULL,
	"Claim_TypeStatus" varchar(256) NOT NULL,
	"Claim_Type" varchar(256) NOT NULL,
	"Claim_Status" varchar(256) NOT NULL,
	"Claim_Status_Date" varchar(256) NOT NULL,
	"In_Suit_Flag" varchar(256) NOT NULL,
	"Accident_State" varchar(256) NOT NULL,
	"Ncci_Part_Desc" varchar(256) NOT NULL,
	"Ncci_Injury_Desc" varchar(256) NOT NULL,
	"Ncci_Cause_Desc" varchar(256) NOT NULL,
	"Ncci_Cd_Cat_Descrp" varchar(256) NOT NULL,
	"Job_Description" varchar(256) NULL,
	"Accident_Description" varchar(4096) NOT NULL,
	"Birth_Date" varchar(256) NULL,
	"Hire_Date" varchar(256) NULL,
	"Reopen_Flag" varchar(256) NOT NULL,
	"AsOfDate" varchar(256) NOT NULL,
	"Medical_Incurred" varchar(256) NOT NULL,
	"Medical_Paid" varchar(256) NOT NULL,
	"Medical_Reserve" varchar(256) NOT NULL,
	"Indemnity_Incurred" varchar(256) NULL,
	"Indemnity_Paid" varchar(256) NULL,
	"Indemnity_Reserve" varchar(256) NULL,
	"Expense_Incurred" varchar(256) NULL,
	"Expense_Paid" varchar(256) NULL,
	"Expense_Reserve" varchar(256) NULL,
	"Vocational_Rehabilitation_Incurred" varchar(256) NULL,
	"Vocational_Rehabilitation_Paid" varchar(256) NULL,
	"Vocational_Rehabilitation_Reserve" varchar(256) NULL,
	"Total_Incurred" varchar(256) NOT NULL,
	"Total_Paid" varchar(256) NOT NULL,
	"Total_Reserve" varchar(256) NOT NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_pma OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_pma to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_pma to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_pma to rpauser;
GO
GRANT SELECT ON p_and_c.raw_pma to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_pma to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_pma to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_pma to rl_p_and_c_d;
GO