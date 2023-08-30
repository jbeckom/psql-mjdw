CREATE TABLE p_and_c.raw_jwf (
	"Claim_Number" varchar(256) NOT NULL,
	"Claimant_Name" varchar(256) NOT NULL,
	"Occupation" varchar(256) NOT NULL,
	"Class_Code" varchar(256) NULL,
	"Org_Level_1" varchar(256) NOT NULL,
	"Org_Level_2" varchar(256) NULL,
	"Org_Level_3" varchar(256) NULL,
	"Org_Level_4" varchar(256) NULL,
	"Sex" varchar(256) NOT NULL,
	"Birth_Date" varchar(256) NOT NULL,
	"Hire_Date" varchar(256) NOT NULL,
	"Incident_Date" varchar(256) NOT NULL,
	"Adjusting_Location_Received_Date" varchar(256) NOT NULL,
	"Claimant_Type" varchar(256) NOT NULL,
	"Claimant_Status" varchar(256) NOT NULL,
	"Closed_Date" varchar(256) NULL,
	"Denied" varchar(256) NOT NULL,
	"Denied_Date" varchar(256) NULL,
	"Denied_Reason" varchar(256) NULL,
	"Incident_Description" varchar(256) NOT NULL,
	"Body_Part" varchar(256) NOT NULL,
	"Claim_Cause" varchar(256) NOT NULL,
	"Incident_Type" varchar(256) NOT NULL,
	"Nature_of_Injury" varchar(256) NOT NULL,
	"Insured_Name" varchar(256) NOT NULL,
	"Insurer_Name" varchar(256) NOT NULL,
	"Policy_Effective_Date" varchar(256) NOT NULL,
	"Policy_Expiration_Date" varchar(256) NOT NULL,
	"Jurisdiction" varchar(256) NOT NULL,
	"Examiner" varchar(256) NOT NULL,
	"Litigated" varchar(256) NOT NULL,
	"Indemnity_Paid" varchar(256) NOT NULL,
	"Indemnity_Reserve" varchar(256) NOT NULL,
	"Indemnity_Incurred" varchar(256) NOT NULL,
	"Indemnity_Recoveries" varchar(256) NOT NULL,
	"Indemnity_Net_Incurred" varchar(256) NOT NULL,
	"Medical_Paid" varchar(256) NOT NULL,
	"Medical_Reserve" varchar(256) NOT NULL,
	"Medical_Incurred" varchar(256) NOT NULL,
	"Medical_Recoveries" varchar(256) NOT NULL,
	"Medical_Net_Incurred" varchar(256) NOT NULL,
	"Rehab_Paid" varchar(256) NOT NULL,
	"Rehab_Reserve" varchar(256) NOT NULL,
	"Rehab_Incurred" varchar(256) NOT NULL,
	"Rehab_Recoveries" varchar(256) NOT NULL,
	"Rehab_Net_Incurred" varchar(256) NOT NULL,
	"Legal_Paid" varchar(256) NOT NULL,
	"Legal_Reserve" varchar(256) NOT NULL,
	"Legal_Incurred" varchar(256) NOT NULL,
	"Legal_Recoveries" varchar(256) NOT NULL,
	"Legal_Net_Incurred" varchar(256) NOT NULL,
	"Other_Paid" varchar(256) NOT NULL,
	"Other_Reserve" varchar(256) NOT NULL,
	"Other_Incurred" varchar(256) NOT NULL,
	"Other_Recoveries" varchar(256) NOT NULL,
	"Other_Net_Incurred" varchar(256) NOT NULL,
	"Total_Paid" varchar(256) NOT NULL,
	"Total_Reserve" varchar(256) NOT NULL,
	"Total_Incurred" varchar(256) NOT NULL,
	"Excess_Recoveries" varchar(256) NOT NULL,
	"Non-Excess_Recoveries" varchar(256) NOT NULL,
	"Total_Recoveries" varchar(256) NOT NULL,
	"Net_Incurred" varchar(256) NOT NULL,
	"Add_Date" varchar(256) NOT NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_jwf OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_jwf to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_jwf to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_jwf to rpauser;
GO
GRANT SELECT ON p_and_c.raw_jwf to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_jwf to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_jwf to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_jwf to rl_p_and_c_d;
GO