DROP TABLE p_and_c.raw_allianz CASCADE;
GO

CREATE TABLE p_and_c.raw_allianz (
	"Program Number" varchar(256) NOT NULL,
	"Policy Country" varchar(256) NOT NULL,
	"Policy Reference" varchar(256) NOT NULL,
	"Sub-Line of Business" varchar(256) NOT NULL,
	"Local Insured" varchar(256) NOT NULL,
	"Claim Reference" varchar(256) NOT NULL,
	"Date of Loss" varchar(256) NOT NULL,
	"Date Reported" varchar(256) NOT NULL,
	"Loss Description" varchar(1024) NOT NULL,
	"Loss Area" varchar(256) NOT NULL,
	"Original Currency" varchar(256) NOT NULL,
	"Indemnity Paid 100" varchar(256) NOT NULL,
	"Fees Paid 100" varchar(256) NOT NULL,
	"Total Paid 100" varchar(256) NOT NULL,
	"Indemnity Outstanding 100" varchar(256) NOT NULL,
	"Fees Outstanding 100" varchar(256) NOT NULL,
	"Total Outstanding 100" varchar(256) NOT NULL,
	"Other Recoveries 100" varchar(256) NOT NULL,
	"Total Incurred 100" varchar(256) NOT NULL,
	"Rate of Exchange" varchar(256) NOT NULL,
	"Total Incurred Report Currency 100" varchar(256) NOT NULL,
	"Claim Status" varchar(256) NOT NULL,
	"Deductible Currency" varchar(256) NULL,
	"Deductible Amount" varchar(256) NOT NULL,
	"AGCS Share" varchar(256) NOT NULL,
	"Cause of Loss" varchar(256) NOT NULL,
	"Further Loss Details" varchar(256) NOT NULL,
	"Broker Reference 1" varchar(256) NULL,
	"Broker Reference 2" varchar(256) NULL,
	"UW Year" varchar(256) NOT NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_allianz OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_allianz to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_allianz to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_allianz to rpauser;
GO
GRANT SELECT ON p_and_c.raw_allianz to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_allianz to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_allianz to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_allianz to rl_p_and_c_d;
GO