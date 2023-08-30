CREATE TABLE p_and_c.raw_lmi_wco (
	"Client" varchar(256) NULL,
	"Cause" varchar(256) NULL,
	"Claim Number" varchar(256) NULL,
	"Status" varchar(256) NULL,
	"Claimant Name" varchar(256) NULL,
	"Loss Date" varchar(256) NULL,
	"Carrier Report Date" varchar(256) NULL,
	"Location" varchar(256) NULL,
	"Accident State" varchar(256) NULL,
	"Catalyst" varchar(256) NULL,
	"Date Closed" varchar(256) NULL,
	"Date of Hire" varchar(256) NULL,
	"Date Reopened" varchar(256) NULL,
	"Litigation Status" varchar(256) NULL,
	"Lost Time Days" varchar(256) NULL,
	"Nature of Injury" varchar(256) NULL,
	"Part of Body" varchar(256) NULL,
	"Accident Description" varchar(256) NULL,
	"Bureau State" varchar(256) NULL,
	"Carrier" varchar(256) NULL,
	"Case Manager Name" varchar(256) NULL,
	"Case Manager Email" varchar(256) NULL,
	"Case Manager Extension" varchar(256) NULL,
	"Case Manager Phone Number" varchar(256) NULL,
	"Claim ID" varchar(256) NULL,
	"Add Date" varchar(256) NULL,
	"Contract Effective Date" varchar(256) NULL,
	"Employer Report Date" varchar(256) NULL,
	"Escalation Risk" varchar(256) NULL,
	"Escalation Risk Date" varchar(256) NULL,
	"Carrier Report Lag Days" varchar(256) NULL,
	"Employer Report Lag Days" varchar(256) NULL,
	"NCCI Nature of Injury" varchar(256) NULL,
	"NCCI Part of Body" varchar(256) NULL,
	"Severity Risk" varchar(256) NULL,
	"Incurred Medical" varchar(256) NULL,
	"Incurred Indemnity" varchar(256) NULL,
	"Incurred Expense" varchar(256) NULL,
	"Total Incurred" varchar(256) NULL,
	"Paid Medical" varchar(256) NULL,
	"Paid Indemnity" varchar(256) NULL,
	"Paid Expense" varchar(256) NULL,
	"Total Paid" varchar(256) NULL,
	"Medical OR" varchar(256) NULL,
	"Indemnity OR" varchar(256) NULL,
	"Expense OR" varchar(256) NULL,
	"Outstanding Reserve" varchar(256) NULL,
	"Applied Recovery" varchar(256) NULL,
	filename varchar(256) NULL,
	uploaded_at date NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_lmi_wco OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_lmi_wco to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_lmi_wco to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_lmi_wco to rpauser;
GO
GRANT SELECT ON p_and_c.raw_lmi_wco to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_lmi_wco to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_lmi_wco to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_lmi_wco to rl_p_and_c_d;
GO