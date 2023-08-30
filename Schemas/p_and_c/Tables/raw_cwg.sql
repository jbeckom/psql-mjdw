CREATE TABLE p_and_c.raw_cwg (
	"Textbox1" varchar(256) NOT NULL,
	"Textbox2" varchar(256) NOT NULL,
	"Textbox99" varchar(256) NOT NULL,
	"InsuredName1" varchar(256) NOT NULL,
	"Textbox239" varchar(256) NOT NULL,
	"PolicySymbol1" varchar(256) NOT NULL,
	"AgencyName1" varchar(256) NOT NULL,
	"Textbox83" varchar(256) NOT NULL,
	"Textbox79" varchar(256) NOT NULL,
	"Textbox114" varchar(256) NOT NULL,
	"Textbox87" varchar(256) NOT NULL,
	"Textbox94" varchar(256) NOT NULL,
	"Textbox88" varchar(256) NOT NULL,
	"Textbox98" varchar(256) NOT NULL,
	"Textbox109" varchar(256) NOT NULL,
	"Textbox110" varchar(256) NOT NULL,
	"Textbox111" varchar(256) NOT NULL,
	"Textbox112" varchar(256) NOT NULL,
	"ClaimantName" varchar(256) NULL,
	"TypeOfLoss2" varchar(256) NULL,
	"CoverageType2" varchar(256) NULL,
	"LastReserveDate" varchar(256) NULL,
	"PremClassCode" varchar(256) NULL,
	"CoverageItem" varchar(256) NULL,
	"GrossPaidLosses" varchar(256) NULL,
	"GrossExpenses" varchar(256) NULL,
	"OutstandingReserves" varchar(256) NULL,
	"GrossIncurred" varchar(256) NULL,
	"Recoveries2" varchar(256) NULL,
	"DeductibleReimb" varchar(256) NULL,
	"NetIncurred2" varchar(256) NULL,
	"Textbox133" varchar(256) NOT NULL,
	"GrossExpenses1" varchar(256) NOT NULL,
	"OutstandingReserves1" varchar(256) NOT NULL,
	"GrossIncurred1" varchar(256) NOT NULL,
	"Recoveries3" varchar(256) NOT NULL,
	"DeductibleReimb1" varchar(256) NOT NULL,
	"Textbox141" varchar(256) NOT NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_cwg OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_cwg to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_cwg to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_cwg to rpauser;
GO
GRANT SELECT ON p_and_c.raw_cwg to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_cwg to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_cwg to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_cwg to rl_p_and_c_d;
GO