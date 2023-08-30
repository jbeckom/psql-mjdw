DROP TABLE p_and_c.raw_stco CASCADE;
GO

CREATE TABLE p_and_c.raw_stco (
	"Carrier Name" varchar(256) NULL,
	"Claimant Supervisor" varchar(256) NULL,
	"Injury Type" varchar(256) NULL,
	"Claim Description" varchar(4096) NULL,
	"Claim Location City" varchar(256) NULL,
	"Claim Location State" varchar(256) NULL,
	"Claim Number" varchar(256) NULL,
	"Day of Week" varchar(256) NULL,
	"Claim Status" varchar(256) NULL,
	"Claim Type" varchar(256) NULL,
	"Claimant Age" varchar(256) NULL,
	"Claimant First Name" varchar(4096) NULL,
	"Claimant Last Name" varchar(256) NULL,
	"Claimant Occupation" varchar(256) NULL,
	"Job Code" varchar(256) NULL,
	"Class Description" varchar(1024) NULL,
	"Date Closed" varchar(256) NULL,
	"Date of Hire" varchar(256) NULL,
	"Date of Loss" varchar(256) NULL,
	"Date Reported" varchar(256) NULL,
	"Lag Days" varchar(256) NULL,
	"Line of Coverage" varchar(256) NULL,
	"Policy Start Date" varchar(256) NULL,
	"Policy End Date" varchar(256) NULL,
	"Policy Number" varchar(256) NULL,
	"Time of Loss" varchar(256) NULL,
	"Client Name" varchar(256) NULL,
	"Client Location Codes" varchar(256) NULL,
	"CLEE Location" varchar(256) NULL,
	"CLEE Description 1" varchar(256) NULL,
	"CLEE Description 2" varchar(256) NULL,
	"CLEE Description 3" varchar(256) NULL,
	"Nature of Injury" varchar(256) NULL,
	"Detailed Nature of Injury" varchar(256) NULL,
	"Detail Cause of Injury" varchar(256) NULL,
	"Location on Body" varchar(256) NULL,
	"Primary Detailed Body Part" varchar(256) NULL,
	"Reserved Total" varchar(256) NULL,
	"Paid Loss" varchar(256) NULL,
	"Paid Expense" varchar(256) NULL,
	"Reimbursed Total" varchar(256) NULL,
	"Incurred Total" varchar(256) NULL,
	filename varchar(256) NULL,
	uploaded_at varchar(256) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_stco OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_stco to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_stco to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_stco to rpauser;
GO
GRANT SELECT ON p_and_c.raw_stco to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_stco to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_stco to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_stco to rl_p_and_c_d;
GO