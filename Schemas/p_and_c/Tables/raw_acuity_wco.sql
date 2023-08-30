CREATE TABLE p_and_c.raw_acuity_wco (
	"Insured" varchar(256) NOT NULL,
	"Pol_Eff_Date_Year" varchar(256) NOT NULL,
	"State" varchar(256) NOT NULL,
	"Location" varchar(256) NOT NULL,
	"Loss_Date" varchar(256) NOT NULL,
	"Loss_Time" varchar(256) NULL,
	"Received_Date" varchar(256) NOT NULL,
	"Lag_Days" varchar(256) NOT NULL,
	"Clmt_Name" varchar(256) NOT NULL,
	"Claim_Nbr" varchar(256) NOT NULL,
	"Claim_Status" varchar(256) NOT NULL,
	"Day_of_Week" varchar(256) NOT NULL,
	"Sex" varchar(256) NOT NULL,
	"Age" varchar(256) NOT NULL,
	"Employed" varchar(256) NOT NULL,
	"Occupation" varchar(256) NOT NULL,
	"Loss_Desc" varchar(256) NOT NULL,
	"Acc_Type" varchar(256) NOT NULL,
	"Body_Part" varchar(256) NULL,
	"Nature_of_Inj" varchar(256) NULL,
	"Cause_Type" varchar(256) NOT NULL,
	"Total_Incurred" varchar(256) NOT NULL,
	"Total_Paid" varchar(256) NOT NULL,
	"Total_Reserve" varchar(256) NOT NULL,
	"Indemnity_Incurred" varchar(256) NOT NULL,
	"Indemnity_Paid" varchar(256) NOT NULL,
	"Indemnity_Reserve" varchar(256) NOT NULL,
	"Medical_Incurred" varchar(256) NOT NULL,
	"Medical_Paid" varchar(256) NOT NULL,
	"Medical_Reserve" varchar(256) NOT NULL,
	"Other_Recovery_Incurred" varchar(256) NOT NULL,
	"Other_Recovery_Paid" varchar(256) NOT NULL,
	"Other_Recovery_Reserve" varchar(256) NOT NULL,
	"Expense_Incurred" varchar(256) NULL,
	"Expense_Paid" varchar(256) NULL,
	"Expense_Reserve" varchar(256) NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL,
	adjuster_name varchar(256) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_acuity_wco OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_acuity_wco to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_acuity_wco to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_acuity_wco to rpauser;
GO
GRANT SELECT ON p_and_c.raw_acuity_wco to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_acuity_wco to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_acuity_wco to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_acuity_wco to rl_p_and_c_d;
GO