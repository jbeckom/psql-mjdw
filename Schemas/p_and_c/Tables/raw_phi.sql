CREATE TABLE p_and_c.raw_phi (
	"AccountNumber" varchar(256) NULL,
	"AccountName" varchar(256) NULL,
	"PolicyNumber" varchar(256) NULL,
	"EffectiveDate" varchar(256) NULL,
	"ExpirationDate" varchar(256) NULL,
	"ProducerStatus" varchar(256) NULL,
	"ClaimNumber" varchar(256) NULL,
	"ClaimantName" varchar(256) NULL,
	"TypeOfLoss" varchar(256) NULL,
	"Status" varchar(256) NULL,
	"LossDate" varchar(256) NULL,
	"OpenDate" varchar(256) NULL,
	"ClosedDate" varchar(256) NULL,
	"TotalLossPaid" varchar(256) NULL,
	"TotalExpensePaid" varchar(256) NULL,
	"SubroSalvageRecovered" varchar(256) NULL,
	"RepName" varchar(256) NULL,
	"LossReserves" varchar(256) NULL,
	"ExpenseReserves" varchar(256) NULL,
	filename varchar(256) NULL,
	uploaded_at date NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_phi OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_phi to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_phi to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_phi to rpauser;
GO
GRANT SELECT ON p_and_c.raw_phi to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_phi to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_phi to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_phi to rl_p_and_c_d;
GO