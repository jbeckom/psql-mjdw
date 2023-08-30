CREATE TABLE p_and_c.raw_copic (
	"Claimant_Name" varchar(256) NOT NULL,
	"Claim_Number" varchar(256) NOT NULL,
	"Accident_Date" varchar(256) NOT NULL,
	"Reported_Date" varchar(256) NOT NULL,
	"Claim_Type" varchar(256) NOT NULL,
	"Claim_Status" varchar(256) NOT NULL,
	"Claim_State" varchar(256) NOT NULL,
	"Indemnity_Paid" varchar(256) NOT NULL,
	"Medical_Paid" varchar(256) NOT NULL,
	"Remaining_Indemnity_Reserve" varchar(256) NOT NULL,
	"Remaining_Medical_Reserve" varchar(256) NOT NULL,
	"Indemnity/Medical_Incurred" varchar(256) NOT NULL,
	"Claim_Accepted_Date" varchar(256) NULL,
	"Claim_Closed_Date" varchar(256) NULL,
	"Claimant_Hired_Date" varchar(256) NULL,
	"Claimant_Age_on_Accident_Date" varchar(256) NOT NULL,
	"Months_Employed" varchar(256) NULL,
	"Workclass_Code" varchar(256) NOT NULL,
	"Risk_Location_Number" varchar(256) NULL,
	"Injury_Hour_of_Day" varchar(256) NOT NULL,
	"Nature_of_Injury" varchar(256) NOT NULL,
	"Part_of_Body" varchar(256) NOT NULL,
	"Cause_of_Loss" varchar(256) NOT NULL,
	"Cause_of_Loss_Category" varchar(256) NULL,
	"State" varchar(256) NOT NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_copic OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_copic to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_copic to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_copic to rpauser;
GO
GRANT SELECT ON p_and_c.raw_copic to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_copic to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_copic to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_copic to rl_p_and_c_d;
GO