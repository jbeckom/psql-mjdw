CREATE TABLE p_and_c.raw_lmi_gli (
	"Client" varchar(256) NULL,
	"Cause" varchar(256) NULL,
	"Claim Number" varchar(256) NULL,
	"Status" varchar(256) NULL,
	"Claimant Name" varchar(256) NULL,
	"Loss Date" varchar(256) NULL,
	"Carrier Report Date" varchar(256) NULL,
	"Location" varchar(256) NULL,
	"Exposure Group" varchar(256) NULL,
	"Coverage State" varchar(256) NULL,
	"Accident Description Code" varchar(256) NULL,
	"Accident State" varchar(256) NULL,
	"Close Date" varchar(256) NULL,
	"Reopen Date" varchar(256) NULL,
	"Litigation Status" varchar(256) NULL,
	"Accident Description" varchar(256) NULL,
	"Carrier" varchar(256) NULL,
	"Case manager" varchar(256) NULL,
	"Case Manager Email" varchar(256) NULL,
	"Case Manager Extension" varchar(256) NULL,
	"Case Manager Phone Number" varchar(256) NULL,
	"Claim ID" varchar(256) NULL,
	"Date Added to RISKTRAC" varchar(256) NULL,
	"Contract Effective Date" varchar(256) NULL,
	"Carrier Report Lag Days" varchar(256) NULL,
	"Inc BIMP" varchar(256) NULL,
	"Inc PD" varchar(256) NULL,
	"Inc Expense" varchar(256) NULL,
	"Total Incurred" varchar(256) NULL,
	"Paid BIMP" varchar(256) NULL,
	"Paid PD" varchar(256) NULL,
	"Paid Expense" varchar(256) NULL,
	"Total Paid" varchar(256) NULL,
	"BIMP OR" varchar(256) NULL,
	"PD OR" varchar(256) NULL,
	"Expense OR" varchar(256) NULL,
	"Outstanding Reserve" varchar(256) NULL,
	"Applied Recovery" varchar(256) NULL,
	filename varchar(256) NULL,
	uploaded_at date NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_lmi_gli OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_lmi_gli to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_lmi_gli to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_lmi_gli to rpauser;
GO
GRANT SELECT ON p_and_c.raw_lmi_gli to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_lmi_gli to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_lmi_gli to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_lmi_gli to rl_p_and_c_d;
GO