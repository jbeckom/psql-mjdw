DROP TABLE p_and_c.raw_fcci_detail CASCADE;
GO

CREATE TABLE p_and_c.raw_fcci_detail (
	"LOB" varchar(256) NOT NULL,
	"Policy_Period" varchar(256) NOT NULL,
	"Policy_Number" varchar(256) NOT NULL,
	"Claim_Number" varchar(256) NOT NULL,
	"Coverage_Type" varchar(256) NULL,
	"Claim_Adjuster" varchar(256) NOT NULL,
	"Date_of_Loss" varchar(256) NOT NULL,
	"Reported_Date" varchar(256) NULL,
	"Status" varchar(256) NOT NULL,
	"Claimant_Name" varchar(256) NOT NULL,
	"Insured_Driver" varchar(256) NULL,
	"Claim_Description" varchar(4096) NOT NULL,
	"Accident_Description" varchar(4096) NULL,
	"Nature_of_Injury" varchar(256) NULL,
	"Body_Part" varchar(256) NULL,
	"Hire_Date" varchar(256) NULL,
	"Claimant_Occupation" varchar(256) NULL,
	"Paid_Loss_(Indemnity)" varchar(256) NOT NULL,
	"Paid_Expenses" varchar(256) NOT NULL,
	"Paid_Medical" varchar(256) NOT NULL,
	"Reserves" varchar(256) NOT NULL,
	"Deductible" varchar(256) NOT NULL,
	"Salvage" varchar(256) NOT NULL,
	"Subrogation" varchar(256) NOT NULL,
	"Recoveries*" varchar(256) NOT NULL,
	"Gross_Incurred" varchar(256) NOT NULL,
	"Net_Incurred" varchar(256) NOT NULL,
	"Business_Department" varchar(256) NULL,
	"Risk_Location" varchar(256) NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_fcci_detail OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_fcci_detail to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_fcci_detail to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_fcci_detail to rpauser;
GO
GRANT SELECT ON p_and_c.raw_fcci_detail to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_fcci_detail to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_fcci_detail to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_fcci_detail to rl_p_and_c_d;
GO