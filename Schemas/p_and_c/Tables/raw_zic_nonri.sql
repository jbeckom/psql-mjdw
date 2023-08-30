CREATE TABLE p_and_c.raw_zic_nonri (
	"Customer_Name" varchar(256) NOT NULL,
	"Policy_Year_Value" varchar(256) NOT NULL,
	"Policy_Symbol" varchar(256) NOT NULL,
	"Policy_Year" varchar(256) NOT NULL,
	"Loss_Year" varchar(256) NOT NULL,
	"Coverage" varchar(256) NOT NULL,
	"Site_Lowest_Name" varchar(256) NULL,
	"Claim_Number" varchar(256) NOT NULL,
	"Date_of_Loss_-_Formatted" varchar(256) NOT NULL,
	"Claimant_Name" varchar(256) NOT NULL,
	"Claim_Status_Description" varchar(256) NOT NULL,
	"Paid_Total" varchar(256) NOT NULL,
	"Net_Incurred_Total" varchar(256) NOT NULL,
	"Warehouse_Last_Update_-_Formatted" varchar(256) NOT NULL,
	"Policy_Identifier" varchar(256) NOT NULL,
	"Date_Reported_to_ZA_-_Formatted" varchar(256) NOT NULL,
	"Accident_Desc_Corp_-_HO_use" varchar(256) NOT NULL,
	"Claim_Closed_Date_-_Formatted" varchar(256) NOT NULL,
	"CIID_Insured_Name" varchar(256) NOT NULL,
	"Reserves_Indemnity" varchar(256) NOT NULL,
	"Paid_Expense" varchar(256) NOT NULL,
	"Reserves_Expense" varchar(256) NOT NULL,
	"Sub_Coverage" varchar(256) NOT NULL,
	"Loss_Location_State" varchar(256) NOT NULL,
	"Paid_Indemnity_BI/Med" varchar(256) NOT NULL,
	"Paid_Indemnity_PD/LT" varchar(256) NOT NULL,
	"UPC_Code" varchar(256) NOT NULL,
	filename varchar(256) NULL,
	uploaded_at varchar(256) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_zic_nonri OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_zic_nonri to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_zic_nonri to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_zic_nonri to rpauser;
GO
GRANT SELECT ON p_and_c.raw_zic_nonri to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_zic_nonri to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_zic_nonri to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_zic_nonri to rl_p_and_c_d;
GO