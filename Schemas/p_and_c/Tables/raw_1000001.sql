CREATE TABLE p_and_c.raw_1000001 (
	"Program No" varchar(256) NULL,
	"Program Name" varchar(256) NULL,
	"Branch No" varchar(256) NULL,
	"Claim Office" varchar(256) NULL,
	"Occurrence Number" varchar(256) NULL,
	"Claim Number" varchar(256) NULL,
	"Insurer Name" varchar(256) NULL,
	"S/I" varchar(256) NULL,
	"Insurer Code" varchar(256) NULL,
	"Loss State" varchar(256) NULL,
	"Benefit State" varchar(256) NULL,
	"Garage State" varchar(256) NULL,
	"Premium State" varchar(256) NULL,
	"Claimant Name" varchar(256) NULL,
	"Occupation" varchar(256) NULL,
	"Loss Date" varchar(256) NULL,
	"Reported Date" varchar(256) NULL,
	"Claim Status Code" varchar(256) NULL,
	"Claim Status Description" varchar(256) NULL,
	"Closed/Reopened Date" varchar(256) NULL,
	"Privacy Claim" varchar(256) NULL,
	"Litigation Ind" varchar(256) NULL,
	"LOB Code" varchar(256) NULL,
	"Minor Cov Cd" varchar(256) NULL,
	"Minor Cov Description" varchar(256) NULL,
	"Ind/PD PTD" varchar(256) NULL,
	"Ind/PD Outsd" varchar(256) NULL,
	"Ind/PD Inc" varchar(256) NULL,
	"Med/BI PTD" varchar(256) NULL,
	"Med/BI Outsd" varchar(256) NULL,
	"Med/BI Inc" varchar(256) NULL,
	"Legal PTD" varchar(256) NULL,
	"Legal Outsd" varchar(256) NULL,
	"Legal Inc" varchar(256) NULL,
	"Non-Legal PTD" varchar(256) NULL,
	"Non-Legal Outsd" varchar(256) NULL,
	"Non-Legal Inc" varchar(256) NULL,
	"Total PTD" varchar(256) NULL,
	"Total Outsd" varchar(256) NULL,
	"Total Inc (Gross)" varchar(256) NULL,
	"Ind/PD Recov" varchar(256) NULL,
	"Med/BI Recov" varchar(256) NULL,
	"Legal Recov" varchar(256) NULL,
	"Non-Legal Recov" varchar(256) NULL,
	"Legacy Recov" varchar(256) NULL,
	"Total Recov" varchar(256) NULL,
	"Cause Description" varchar(256) NULL,
	"Injury Desc" varchar(256) NULL,
	"Body Part" varchar(256) NULL,
	"Controverted" varchar(256) NULL,
	"Denial Date" varchar(256) NULL,
	"Recision Date" varchar(256) NULL,
	"Level 2 Code" varchar(256) NULL,
	"Level 2 Name" varchar(256) NULL,
	"Level 3 Code" varchar(256) NULL,
	"Level 3 Name" varchar(256) NULL,
	"Level 4 Code" varchar(256) NULL,
	"Level 4 Name" varchar(256) NULL,
	"Level 5 Code" varchar(256) NULL,
	"Level 5 Name" varchar(256) NULL,
	"Level 6 Code" varchar(256) NULL,
	"Level 6 Name" varchar(256) NULL,
	"Level 7 Code" varchar(256) NULL,
	"Level 7 Name" varchar(256) NULL,
	"Location Code" varchar(256) NULL,
	"Location Description" varchar(256) NULL,
	"NCCI Class Code" varchar(256) NULL,
	"NCCI Inj Code" varchar(256) NULL,
	"NCCI Inj Desc" varchar(256) NULL,
	"Experience Period" varchar(256) NULL,
	"Adjuster" varchar(256) NULL,
	"Client Clm No" varchar(256) NULL,
	"Fed/State Clm No" varchar(256) NULL,
	"Policy Number" varchar(256) NULL,
	"Juris Days Lost" varchar(256) NULL,
	"Clmt Age" varchar(256) NULL,
	"Clmt Sex" varchar(256) NULL,
	"Clmt Empl No" varchar(256) NULL,
	"Clmt Job Code" varchar(256) NULL,
	"Avg Wkly Wage" varchar(256) NULL,
	"Insured Driver Last Name" varchar(256) NULL,
	"Client Program Status" varchar(256) NULL,
	"CP Term Date" varchar(256) NULL,
	"Claims Made Date" varchar(256) NULL,
	"Geo Region Code" varchar(256) NULL,
	"Cat Code" varchar(256) NULL,
	"MCO Number" varchar(256) NULL,
	"Insurer Cat Cd" varchar(256) NULL,
	filename varchar(256) NOT NULL,
	uploaded_at varchar(256) NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_1000001 OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_1000001 to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_1000001 to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_1000001 to rpauser;
GO
GRANT SELECT ON p_and_c.raw_1000001 to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_1000001 to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_1000001 to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_1000001 to rl_p_and_c_d;
GO