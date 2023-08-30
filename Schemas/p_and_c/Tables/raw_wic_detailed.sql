CREATE TABLE p_and_c.raw_wic_detailed (
	"Policy_Number" varchar(256) NOT NULL,
	"Claim_Number" varchar(256) NOT NULL,
	"Loss_Date" varchar(256) NOT NULL,
	"Claim_Days_Open" varchar(256) NULL,
	"Primary_Feature_Claimant_Name" varchar(256) NULL,
	"Injured_Worker_Date_of_Hire" varchar(256) NULL,
	"Claim_Description_*" varchar(4096) NULL,
	"Record_Only_Indicator" varchar(256) NULL,
	"Claim_Medical_Only_Indicator" varchar(256) NULL,
	"Claim_Type" varchar(256) NULL,
	"Claim_Loss_Cause" varchar(256) NULL,
	"Claim_Detailed_Loss_Cause" varchar(256) NULL,
	"Involved_Insured_Driver" varchar(256) NULL,
	"Policy_Effective_Date" varchar(256) NULL,
	"Claim_Loss_Status" varchar(256) NULL,
	"Claim_Closed_Date" varchar(256) NULL,
	"Claim_Litigation_Indicator" varchar(256) NULL,
	"Loss_Date_to_Claim_Reported_Date_(days)" varchar(256) NULL,
	"Customer_Location_Code" varchar(256) NULL,
	"Customer_Defined_Attribute" varchar(256) NULL,
	"Cumulative_Paid_Loss:_Medical" varchar(256) NULL,
	"Outstanding_Case_Loss_Reserve:_Medical" varchar(256) NULL,
	"Cumulative_Paid_Loss:_Non-Medical" varchar(256) NULL,
	"Outstanding_Case_Loss_Reserve:_Non-Medical" varchar(256) NULL,
	"Cumulative_Paid_Loss" varchar(256) NULL,
	"Outstanding_Case_Loss_Reserve" varchar(256) NULL,
	"Cumulative_Deductible_Recoveries" varchar(256) NULL,
	"Cumulative_Case_Incurred_Loss" varchar(256) NULL,
	"Deductible_Amount" varchar(256) NULL,
	"Claim_Owner" varchar(256) NULL,
	"Named_Insured" varchar(256) NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL,
	"Claim_Description_**" varchar(4096) NULL,
	customer_defined_attribute varchar(256) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_wic_detailed OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_wic_detailed to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_wic_detailed to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_wic_detailed to rpauser;
GO
GRANT SELECT ON p_and_c.raw_wic_detailed to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_wic_detailed to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_wic_detailed to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_wic_detailed to rl_p_and_c_d;
GO