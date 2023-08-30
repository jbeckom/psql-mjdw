CREATE TABLE p_and_c.raw_1000005 (
	"Claim_#" varchar(256) NOT NULL,
	"Benefit_Type" varchar(256) NOT NULL,
	"Quarterly_Ending_Date" varchar(256) NOT NULL,
	"Medical_Risk_Cost" varchar(256) NOT NULL,
	"Indemnity_Risk_Cost" varchar(256) NOT NULL,
	"MIRA_Reserves_Risk" varchar(256) NOT NULL,
	"MIRA_Medical_Reserves_Cost" varchar(256) NOT NULL,
	"MIRA_Indemnity_Reserves_Cost" varchar(256) NOT NULL,
	"Risk_Total_Unlimited_Charges" varchar(256) NOT NULL,
	"Medical_Surplus_Cost" varchar(256) NOT NULL,
	"Indemnity_Surplus_Cost" varchar(256) NOT NULL,
	"MIRA_Reserves_Surplus" varchar(256) NOT NULL,
	"Surplus_Total_Unlimited_Charge" varchar(256) NOT NULL,
	"MIRA_Reserve_Code" varchar(256) NOT NULL,
	"Subrogation_Amount" varchar(256) NOT NULL,
	"Handicap_Percent" varchar(256) NOT NULL,
	"Appealed_to_IC/Court" varchar(256) NOT NULL,
	"Non-at-fault_Motor_Vehicle_Accident" varchar(256) NOT NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_1000005 OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_1000005 to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_1000005 to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_1000005 to rpauser;
GO
GRANT SELECT ON p_and_c.raw_1000005 to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_1000005 to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_1000005 to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_1000005 to rl_p_and_c_d;
GO