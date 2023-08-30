CREATE TABLE p_and_c.raw_ahict (
	"LOB" varchar(256) NOT NULL,
	"CLIENT_CODE" varchar(256) NOT NULL,
	"CLIENT_NAME" varchar(256) NOT NULL,
	"CLIENT_LOCATION" varchar(256) NOT NULL,
	"PROFIT_CENTER" varchar(256) NULL,
	"AGENT" varchar(256) NULL,
	"INSURED" varchar(256) NOT NULL,
	"INSURED_STATE" varchar(256) NULL,
	"POLICY_NBR" varchar(256) NOT NULL,
	"RISK_ST" varchar(256) NULL,
	"RISK_NBR" varchar(256) NULL,
	"CERTIFICATE_NBR" varchar(256) NULL,
	"EFF_DATE" varchar(256) NOT NULL,
	"EXP_DATE" varchar(256) NOT NULL,
	"CLAIM_NBR" varchar(256) NOT NULL,
	"CLAIM_TYPE" varchar(256) NOT NULL,
	"PREV_CLAIM_NBR" varchar(256) NULL,
	"ACC_DATE" varchar(256) NOT NULL,
	"ACC_DESC" varchar(4096) NOT NULL,
	"ACC_CODE" varchar(256) NOT NULL,
	"ACC_LOCATION" varchar(256) NOT NULL,
	"ACC_CITY" varchar(256) NULL,
	"ACC_STATE" varchar(256) NOT NULL,
	"JURISDICTION_STATE" varchar(256) NULL,
	"CLAIM_STATUS" varchar(256) NOT NULL,
	"CLAIM_ADJUSTER" varchar(256) NOT NULL,
	"CLAIM_TEAM" varchar(256) NOT NULL,
	"DT_REPORTED" varchar(256) NOT NULL,
	"DT_OPEN" varchar(256) NOT NULL,
	"DT_CLOSED" varchar(256) NULL,
	"DT_REOPEN" varchar(256) NULL,
	"CATASTROPHE_NBR" varchar(256) NULL,
	"RESERVE_NBR" varchar(256) NOT NULL,
	"PARTY_NBR" varchar(256) NOT NULL,
	"RESERVE_ADJUSTER" varchar(256) NOT NULL,
	"RESERVE_TEAM" varchar(256) NOT NULL,
	"LINE_CODE" varchar(256) NOT NULL,
	"COVERAGE_CODE" varchar(256) NOT NULL,
	"RESERVE_DT_OPEN" varchar(256) NOT NULL,
	"RESERVE_DT_CLOSED" varchar(256) NULL,
	"RESERVE_DT_REOPEN" varchar(256) NULL,
	"RESERVE_CLAIMANT_NAME" varchar(256) NOT NULL,
	"IND_PAID" varchar(256) NOT NULL,
	"MED_PAID" varchar(256) NOT NULL,
	"EXP_PAID" varchar(256) NOT NULL,
	"IND_RESERVE" varchar(256) NOT NULL,
	"MED_RESERVE" varchar(256) NOT NULL,
	"EXP_RESERVE" varchar(256) NOT NULL,
	"SUBRO_REC" varchar(256) NOT NULL,
	"SALVAGE_REC" varchar(256) NOT NULL,
	"DEDUCT_REC" varchar(256) NOT NULL,
	"RESERVE_STATUS" varchar(256) NOT NULL,
	"DRIVER" varchar(256) NULL,
	"LOC_UNIT_CODE" varchar(256) NULL,
	"GROSS_IND_PAID" varchar(256) NOT NULL,
	"GROSS_MED_PAID" varchar(256) NOT NULL,
	"GROSS_EXP_PAID" varchar(256) NOT NULL,
	"IS_LITIGATION" varchar(256) NOT NULL,
	"CARRIER_NAME" varchar(256) NOT NULL,
	"TIME_STAMP" varchar(256) NOT NULL,
	"VIN" varchar(256) NULL,
	"YEAR" varchar(256) NULL,
	"MAKE" varchar(256) NULL,
	"MODEL" varchar(256) NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_ahict OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_ahict to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_ahict to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_ahict to rpauser;
GO
GRANT SELECT ON p_and_c.raw_ahict to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_ahict to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_ahict to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_ahict to rl_p_and_c_d;
GO