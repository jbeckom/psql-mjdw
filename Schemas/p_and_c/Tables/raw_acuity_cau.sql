CREATE TABLE p_and_c.raw_acuity_cau (
	"Insured" varchar(256) NOT NULL,
	"Pol_Eff_Date_Year" varchar(256) NOT NULL,
	"State" varchar(256) NOT NULL,
	"City" varchar(256) NULL,
	"Location" varchar(256) NOT NULL,
	"Address" varchar(256) NULL,
	"Claims_Made" varchar(256) NULL,
	"Loss_Date" varchar(256) NOT NULL,
	"Loss_Time" varchar(256) NULL,
	"Received_Date" varchar(256) NOT NULL,
	"Lag_Days" varchar(256) NOT NULL,
	"Claim_Nbr" varchar(256) NOT NULL,
	"Claim_Status" varchar(256) NOT NULL,
	"Day_of_Week" varchar(256) NOT NULL,
	"Name_of_Driver" varchar(256) NULL,
	"Sex" varchar(256) NULL,
	"Age" varchar(256) NULL,
	"Loss_Desc" varchar(4096) NOT NULL,
	"Total_Incurred" varchar(256) NULL,
	"Total_Paid" varchar(256) NULL,
	"Total_Reserve" varchar(256) NULL,
	"Physical_Damage_Incurred" varchar(256) NULL,
	"Physical_Damage_Paid" varchar(256) NULL,
	"Physical_Damage_Reserve" varchar(256) NULL,
	"Recover_Physical_Damage_Incurred" varchar(256) NULL,
	"Recover_Physical_Damage_Paid" varchar(256) NULL,
	"Recover_Physical_Damage_Reserve" varchar(256) NULL,
	"Liability_Incurred" varchar(256) NULL,
	"Liability_Paid" varchar(256) NULL,
	"Liability_Reserve" varchar(256) NULL,
	"Unsdundrsd_Mot_Incurred" varchar(256) NULL,
	"Unsdundrsd_Mot_Paid" varchar(256) NULL,
	"Unsdundrsd_Mot_Reserve" varchar(256) NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL,
	adjuster_name varchar(256) NULL,
	auto_incident_type varchar(256) NULL,
	med_pay_incurred varchar(256) NULL,
	med_pay_paid varchar(256) NULL,
	med_pay_reserve varchar(256) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_acuity_cau OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_acuity_cau to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_acuity_cau to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_acuity_cau to rpauser;
GO
GRANT SELECT ON p_and_c.raw_acuity_cau to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_acuity_cau to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_acuity_cau to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_acuity_cau to rl_p_and_c_d;
GO