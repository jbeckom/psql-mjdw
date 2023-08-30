CREATE TABLE p_and_c.raw_icw (
	"Insured Name" varchar(256) NOT NULL,
	"Policy No" varchar(256) NOT NULL,
	"Policy Year" varchar(256) NOT NULL,
	"Expiration Date" varchar(256) NOT NULL,
	"Claim Num" varchar(256) NOT NULL,
	"Claimant Name" varchar(256) NOT NULL,
	"Examiner Name" varchar(256) NOT NULL,
	"In Litigation?" varchar(256) NOT NULL,
	"Litigation Date" varchar(256) NULL,
	"Status" varchar(256) NOT NULL,
	"Sub Status" varchar(256) NULL,
	"Claim Type" varchar(256) NOT NULL,
	"State" varchar(256) NOT NULL,
	"DOI" varchar(256) NOT NULL,
	"Open Date" varchar(256) NOT NULL,
	"ReOpen Date" varchar(256) NULL,
	"Date of Loss" varchar(256) NOT NULL,
	"Notice Date" varchar(256) NOT NULL,
	"Closed Date" varchar(256) NULL,
	"Accident Description" varchar(256) NOT NULL,
	"Medical (Paid)" varchar(256) NOT NULL,
	"Indemnity (Paid)" varchar(256) NOT NULL,
	"Voc Rehab (Paid)" varchar(256) NOT NULL,
	"Expense (Paid)" varchar(256) NOT NULL,
	"Recoveries (Paid)" varchar(256) NOT NULL,
	"Total Paid" varchar(256) NOT NULL,
	"Medical (Incurred)" varchar(256) NOT NULL,
	"Indemnity (Incurred)" varchar(256) NOT NULL,
	"Voc Rehab (Incurred)" varchar(256) NOT NULL,
	"Expense (Incurred)" varchar(256) NOT NULL,
	"Recoveries (Incurred)" varchar(256) NOT NULL,
	"Total Incurred" varchar(256) NOT NULL,
	"Medical (Remaining Rsvs.)" varchar(256) NOT NULL,
	"Indemnity (Remaining Rsvs.)" varchar(256) NOT NULL,
	"Voc Rehab (Remaining Rsvs.)" varchar(256) NOT NULL,
	"Expense (Remaining Rsvs.)" varchar(256) NOT NULL,
	"Total (Remaining Rsvs.)" varchar(256) NOT NULL,
	"Subro (Paid)" varchar(256) NOT NULL,
	"Division Name" varchar(256) NOT NULL,
	"Division Code" varchar(256) NOT NULL,
	"Location Name" varchar(256) NOT NULL,
	"Location Number" varchar(256) NOT NULL,
	"Occupation Description" varchar(256) NOT NULL,
	"Class Code" varchar(256) NOT NULL,
	"Hire Date" varchar(256) NULL,
	"Birth Date" varchar(256) NOT NULL,
	"Age At Injury" varchar(256) NOT NULL,
	"Description of Injury" varchar(256) NOT NULL,
	"Inj Cause Code" varchar(256) NOT NULL,
	"Injury Cause Desc" varchar(256) NOT NULL,
	"Body Part Code" varchar(256) NOT NULL,
	"Body Part Desc" varchar(256) NOT NULL,
	"Nature Injury Code" varchar(256) NOT NULL,
	"Nature Of Injury" varchar(256) NOT NULL,
	"TTD (Paid)" varchar(256) NOT NULL,
	"TPD Paid" varchar(256) NOT NULL,
	"PPD Paid" varchar(256) NOT NULL,
	"Recoveries" varchar(256) NOT NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_icw OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_icw to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_icw to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_icw to rpauser;
GO
GRANT SELECT ON p_and_c.raw_icw to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_icw to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_icw to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_icw to rl_p_and_c_d;
GO