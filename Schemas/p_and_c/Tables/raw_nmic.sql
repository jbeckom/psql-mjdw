CREATE TABLE p_and_c.raw_nmic (
	"LOB" varchar(256) NOT NULL,
	"Policy_Number" varchar(256) NOT NULL,
	"Policy_Term" varchar(256) NOT NULL,
	"Named_Insured" varchar(256) NOT NULL,
	"Second_Named_Insured" varchar(256) NOT NULL,
	"Regional_Office" varchar(256) NOT NULL,
	"Report_Run_Date" varchar(256) NOT NULL,
	"Requestor" varchar(256) NOT NULL,
	"Claimant" varchar(256) NOT NULL,
	"Claim_#" varchar(256) NOT NULL,
	"Date_of_Loss" varchar(256) NOT NULL,
	"File_Status" varchar(256) NOT NULL,
	"Loss_Location" varchar(256) NOT NULL,
	"Premises_ID" varchar(256) NOT NULL,
	"Claim_Associate" varchar(256) NOT NULL,
	"Phone" varchar(256) NOT NULL,
	"Email" varchar(256) NOT NULL,
	"Date_Reported" varchar(256) NOT NULL,
	"Net_Incurred" varchar(256) NOT NULL,
	"Loss_Date_Year" varchar(256) NOT NULL,
	"Subro_Status" varchar(256) NOT NULL,
	"Open_Reserve" varchar(256) NOT NULL,
	"Payments" varchar(256) NOT NULL,
	"Expenses" varchar(256) NOT NULL,
	"Recoveries" varchar(256) NOT NULL,
	"Gross_Incurred" varchar(256) NOT NULL,
	"Primary_Rate_State" varchar(256) NOT NULL,
	"State_Loss_Occurred" varchar(256) NOT NULL,
	"Age" varchar(256) NOT NULL,
	"Date_of_Birth" varchar(256) NOT NULL,
	"Body_Part_Category" varchar(256) NOT NULL,
	"Body_Part_Description" varchar(256) NOT NULL,
	"Cause_Category" varchar(256) NOT NULL,
	"Cause_Description" varchar(256) NOT NULL,
	"Injury_Description" varchar(256) NOT NULL,
	"Nature_of_Injury_Description" varchar(256) NOT NULL,
	"Nature_Category" varchar(256) NOT NULL,
	"Type_of_Payment" varchar(256) NOT NULL,
	"Days_to_Close" varchar(256) NOT NULL,
	"Date_Closed" varchar(256) NOT NULL,
	"Day_of_Week" varchar(256) NOT NULL,
	"Days_to_Report" varchar(256) NOT NULL,
	"Deductible_Reimbursements" varchar(256) NOT NULL,
	"Make" varchar(256) NOT NULL,
	"Model" varchar(256) NOT NULL,
	"Year" varchar(256) NOT NULL,
	"Vin" varchar(256) NOT NULL,
	"Driver" varchar(256) NOT NULL,
	"Loss_Description" varchar(4096) NOT NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_nmic OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_nmic to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_nmic to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_nmic to rpauser;
GO
GRANT SELECT ON p_and_c.raw_nmic to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_nmic to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_nmic to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_nmic to rl_p_and_c_d;
GO