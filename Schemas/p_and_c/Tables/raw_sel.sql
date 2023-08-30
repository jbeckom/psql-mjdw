CREATE TABLE p_and_c.raw_sel (
	"LOB" varchar(256) NOT NULL,
	"POLICY NUMBER" varchar(256) NOT NULL,
	"EFF DATE" varchar(256) NOT NULL,
	"CLAIM #" varchar(256) NOT NULL,
	"DOL" varchar(256) NOT NULL,
	"LOSS DESC CATEGORY" varchar(256) NOT NULL,
	"LOSS DESCRIPTION" varchar(256) NOT NULL,
	"INJURY TYPE" varchar(256) NOT NULL,
	"BODY REGION" varchar(256) NULL,
	"CLAIMANT NAME" varchar(256) NOT NULL,
	"FINANCIAL ACCT" varchar(256) NOT NULL,
	"LOSS PAID" varchar(256) NOT NULL,
	"EXPENSE PAID" varchar(256) NOT NULL,
	"LOSS RESERVE" varchar(256) NOT NULL,
	"EXPENSE RESERVE" varchar(256) NOT NULL,
	"RECOVERY" varchar(256) NOT NULL,
	"INCURRED" varchar(256) NOT NULL,
	"CLAIM STATUS" varchar(256) NOT NULL,
	"CLAIM CLOSED DATE" varchar(256) NULL,
	"LOCATION ADDRESS" varchar(256) NULL,
	"DRIVER NAME" varchar(256) NULL,
	"LOCATION CODE" varchar(256) NULL,
	"DEPT. CODE" varchar(256) NULL,
	"ADJUSTER" varchar(256) NOT NULL,
	"ADJUSTER PHONE" varchar(256) NOT NULL,
	"ADJUSTER PHONE EXT" varchar(256) NULL,
	"TOTAL LOSS IND" varchar(256) NOT NULL,
	"LAG TIME" varchar(256) NOT NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_sel OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_sel to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_sel to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_sel to rpauser;
GO
GRANT SELECT ON p_and_c.raw_sel to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_sel to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_sel to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_sel to rl_p_and_c_d;
GO