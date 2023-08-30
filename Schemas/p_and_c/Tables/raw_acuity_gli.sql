CREATE TABLE p_and_c.raw_acuity_gli (
	"Insured" varchar(256) NOT NULL,
	"Pol_Eff_Date_Year" varchar(256) NOT NULL,
	"State" varchar(256) NOT NULL,
	"City" varchar(256) NOT NULL,
	"Location" varchar(256) NOT NULL,
	"Address" varchar(256) NOT NULL,
	"Claims_Made" varchar(256) NULL,
	"Loss_Date" varchar(256) NOT NULL,
	"Loss_Time" varchar(256) NULL,
	"Received_Date" varchar(256) NOT NULL,
	"Lag_Days" varchar(256) NOT NULL,
	"Claim_Nbr" varchar(256) NOT NULL,
	"Claim_Status" varchar(256) NOT NULL,
	"Day_of_Week" varchar(256) NOT NULL,
	"Clmt_Name" varchar(256) NOT NULL,
	"Sex" varchar(256) NULL,
	"Age" varchar(256) NULL,
	"Loss_Desc" varchar(4096) NOT NULL,
	"Damage_or_Injury" varchar(256) NULL,
	"Total_Incurred" varchar(256) NOT NULL,
	"Total_Paid" varchar(256) NOT NULL,
	"Total_Reserve" varchar(256) NOT NULL,
	"Premises_Oper_Incurred" varchar(256) NOT NULL,
	"Premises_Oper_Paid" varchar(256) NOT NULL,
	"Premises_Oper_Reserve" varchar(256) NOT NULL,
	"Medical_Payment_Incurred" varchar(256) NOT NULL,
	"Medical_Payment_Paid" varchar(256) NOT NULL,
	"Medical_Payment_Reserve" varchar(256) NOT NULL,
	"Personal_Injury_Incurred" varchar(256) NULL,
	"Personal_Injury_Paid" varchar(256) NULL,
	"Personal_Injury_Reserve" varchar(256) NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL,
	adjuster_name varchar(256) NULL,
	employee_ben_incurred varchar(256) NULL,
	employee_ben_paid varchar(256) NULL,
	employee_ben_reserve varchar NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_acuity_gli OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_acuity_gli to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_acuity_gli to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_acuity_gli to rpauser;
GO
GRANT SELECT ON p_and_c.raw_acuity_gli to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_acuity_gli to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_acuity_gli to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_acuity_gli to rl_p_and_c_d;
GO