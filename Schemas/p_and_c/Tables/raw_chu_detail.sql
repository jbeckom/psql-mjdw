CREATE TABLE p_and_c.raw_chu_detail (
	"Accident_Date" varchar(256) NOT NULL,
	"Reported_Date" varchar(256) NOT NULL,
	"Lag" varchar(256) NOT NULL,
	"Policy_Number" varchar(256) NULL,
	"Claim_Reference_Number" varchar(256) NULL,
	"Occurrence_Number" varchar(256) NOT NULL,
	"Claimant" varchar(256) NOT NULL,
	"R" varchar(256) NULL,
	"Birthdate" varchar(256) NULL,
	"Age" varchar(256) NULL,
	"Hire_Date" varchar(256) NULL,
	"Exp" varchar(256) NULL,
	"Occupation" varchar(256) NOT NULL,
	"Location_Name" varchar(256) NOT NULL,
	"City" varchar(256) NOT NULL,
	"Loss_Description" varchar(256) NOT NULL,
	"Causation" varchar(256) NOT NULL,
	"Acc._Type" varchar(256) NOT NULL,
	"Body_Part" varchar(256) NOT NULL,
	"Total_Paid" varchar(256) NOT NULL,
	"Total_Incurred" varchar(256) NOT NULL,
	"Claim_Status" varchar(256) NOT NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_chu_detail OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_chu_detail to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_chu_detail to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_chu_detail to rpauser;
GO
GRANT SELECT ON p_and_c.raw_chu_detail to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_chu_detail to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_chu_detail to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_chu_detail to rl_p_and_c_d;
GO