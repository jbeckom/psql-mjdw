CREATE TABLE p_and_c.raw_lmi_cau_liab (
	"Client" varchar(256) NOT NULL,
	"Accident Description Code" varchar(256) NOT NULL,
	"Claim Number" varchar(256) NOT NULL,
	"Status" varchar(256) NOT NULL,
	"Claimant Name" varchar(256) NOT NULL,
	"Loss Date" varchar(256) NULL,
	"Carrier Report Date" varchar(256) NOT NULL,
	"Exposure Group" varchar(256) NULL,
	"Garage State" varchar(256) NOT NULL,
	"Insured Driver Name" varchar(256) NULL,
	"Location" varchar(256) NOT NULL,
	"Accident State" varchar(256) NOT NULL,
	"Close Date" varchar(256) NULL,
	"Reopen Date" varchar(256) NULL,
	"Litigation Status" varchar(256) NULL,
	"Accident Description" varchar(256) NULL,
	"At Fault" varchar(256) NULL,
	"Carrier" varchar(256) NOT NULL,
	"Case manager" varchar(256) NULL,
	"Case Manager Email" varchar(256) NULL,
	"Case Manager Extension" varchar(256) NULL,
	"Case Manager Phone Number" varchar(256) NOT NULL,
	"Cause" varchar(256) NULL,
	"Claim ID" varchar(256) NOT NULL,
	"Date Added to RISKTRAC" varchar(256) NOT NULL,
	"Contract Effective Date" varchar(256) NOT NULL,
	"Carrier Report Lag Days" varchar(256) NOT NULL,
	"Inc BIMPNF" varchar(256) NOT NULL,
	"Inc PD" varchar(256) NOT NULL,
	"Inc Expense" varchar(256) NOT NULL,
	"Total Incurred" varchar(256) NOT NULL,
	"Paid BIMPNF" varchar(256) NOT NULL,
	"Paid PD" varchar(256) NOT NULL,
	"Paid Expense" varchar(256) NOT NULL,
	"Total Paid" varchar(256) NOT NULL,
	"BIMPNF OR" varchar(256) NOT NULL,
	"PD OR" varchar(256) NOT NULL,
	"Expense OR" varchar(256) NOT NULL,
	"Outstanding Reserve" varchar(256) NOT NULL,
	"Applied Recovery" varchar(256) NOT NULL,
	filename varchar(256) NOT NULL,
	uploaded_at varchar(256) NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_lmi_cau_liab OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_lmi_cau_liab to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_lmi_cau_liab to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_lmi_cau_liab to rpauser;
GO
GRANT SELECT ON p_and_c.raw_lmi_cau_liab to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_lmi_cau_liab to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_lmi_cau_liab to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_lmi_cau_liab to rl_p_and_c_d;
GO