CREATE TABLE p_and_c.raw_aig_intelli (
	"Policy Prefix" varchar(256) NULL,
	"Policy-Asco-Mod" varchar(256) NULL,
	"Policy Name" varchar(256) NULL,
	"Policy Term" varchar(256) NULL,
	"Policy Year" varchar(256) NULL,
	"U/W Division" varchar(256) NULL,
	"Handling Office" varchar(256) NULL,
	"Claimant Name" varchar(256) NULL,
	"Claim #" varchar(256) NULL,
	"OneClaim #" varchar(256) NULL,
	"Feature #" varchar(256) NULL,
	"State/Terr/Country" varchar(256) NULL,
	"Benefit State" varchar(256) NULL,
	"Loss Date" varchar(256) NULL,
	"Report Date" varchar(256) NULL,
	"Receipt Date" varchar(256) NULL,
	"Closed Date" varchar(256) NULL,
	"LOB" varchar(256) NULL,
	"Loss Type" varchar(256) NULL,
	"Status" varchar(256) NULL,
	"Accident/Loss Description" varchar(256) NULL,
	"Major Class Code Description" varchar(256) NULL,
	"Ind/BI Paid" varchar(256) NULL,
	"Med/PD Paid" varchar(256) NULL,
	"Alloc Exp Paid" varchar(256) NULL,
	"Salvage" varchar(256) NULL,
	"Subrogation" varchar(256) NULL,
	"Other Recoveries" varchar(256) NULL,
	"Total Paid" varchar(256) NULL,
	"Total Recoveries" varchar(256) NULL,
	"Total Reserves" varchar(256) NULL,
	"Total Incurred" varchar(256) NULL,
	"Currency" varchar(256) NULL,
	"Valuation Date" varchar(256) NULL,
	"Source" varchar(256) NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_aig_intelli OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_aig_intelli to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_aig_intelli to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_aig_intelli to rpauser;
GO
GRANT SELECT ON p_and_c.raw_aig_intelli to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_aig_intelli to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_aig_intelli to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_aig_intelli to rl_p_and_c_d;
GO