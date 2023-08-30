CREATE TABLE p_and_c.raw_gb (
	"Company" varchar(256) NOT NULL,
	"ACC_ADDRS" varchar(256) NOT NULL,
	"ACC_CITY" varchar(256) NOT NULL,
	"ACC_DAY" varchar(256) NOT NULL,
	"ACCID_NUM" varchar(256) NOT NULL,
	"ACC_TIME" varchar(256) NOT NULL,
	"ACCID_YEAR" varchar(256) NOT NULL,
	"ADJ_NAME" varchar(256) NOT NULL,
	"ATT_RP_FLG" varchar(256) NOT NULL,
	"BRNCH_NAME" varchar(256) NOT NULL,
	"CLAIM_NUM" varchar(256) NOT NULL,
	"STATE_CLM" varchar(256) NOT NULL,
	"CLM_PERIOD" varchar(256) NOT NULL,
	"CLM_SIC" varchar(256) NOT NULL,
	"CLM_STATUS" varchar(256) NOT NULL,
	"CLMNT_AGE" varchar(256) NOT NULL,
	"CLMNT_ADDR" varchar(256) NOT NULL,
	"CLMNT_NAME" varchar(256) NOT NULL,
	"CLMNT_OCCP" varchar(256) NOT NULL,
	"CLMNT_SEX" varchar(256) NOT NULL,
	"CLMNT_ST" varchar(256) NOT NULL,
	"CLMNT_ZIP" varchar(256) NOT NULL,
	"DIAG_CODE" varchar(256) NULL,
	"COV_CODE" varchar(256) NOT NULL,
	"LITIG_FLAG" varchar(256) NOT NULL,
	"LOSS_NATBI" varchar(256) NOT NULL,
	"NCCI_INJ" varchar(256) NOT NULL,
	"NCCI_JOB" varchar(256) NOT NULL,
	"LOSS_COV" varchar(256) NOT NULL,
	"POB_CODE" varchar(256) NOT NULL,
	"PPO_CODE" varchar(256) NOT NULL,
	"TYPE_CODE" varchar(256) NOT NULL,
	"COMP_RATE" varchar(256) NOT NULL,
	"ACC_DATE" varchar(256) NOT NULL,
	"ATT_DATE" varchar(256) NULL,
	"BIRTH_DATE" varchar(256) NOT NULL,
	"CLM_DNL_DT" varchar(256) NULL,
	"CLM_ST_DT" varchar(256) NOT NULL,
	"CLM_VLD_DT" varchar(256) NOT NULL,
	"CLOSE_DATE" varchar(256) NULL,
	"HIRE_DATE" varchar(256) NOT NULL,
	"POLEF_DATE" varchar(256) NOT NULL,
	"RPTD_DATE" varchar(256) NOT NULL,
	"DTRPTDCLNT" varchar(256) NOT NULL,
	"RTW_DATE" varchar(256) NULL,
	"REPSENDATE" varchar(256) NULL,
	"LOSS_DESC" varchar(256) NOT NULL,
	"NL_DESC_BI" varchar(256) NOT NULL,
	"NL_DESC_PD" varchar(256) NULL,
	"POB_DESC" varchar(256) NOT NULL,
	"SRCE_DESC" varchar(256) NOT NULL,
	"TYPE_DESC" varchar(256) NOT NULL,
	"EMP_STATUS" varchar(256) NOT NULL,
	"INDEMNITY_PAID" varchar(256) NOT NULL,
	"MEDICAL_PAID" varchar(256) NOT NULL,
	"REHAB_PAID" varchar(256) NOT NULL,
	"BI_PAID" varchar(256) NOT NULL,
	"PD_PAID" varchar(256) NOT NULL,
	"EXPENSE_PAID" varchar(256) NOT NULL,
	"INDEMNITY_RECOVERY" varchar(256) NOT NULL,
	"MEDICAL_RECOVERY" varchar(256) NOT NULL,
	"REHAB_RECOVERY" varchar(256) NOT NULL,
	"BI_RECOVERY" varchar(256) NOT NULL,
	"PD_RECOVERY" varchar(256) NOT NULL,
	"EXPENSE_RECOVERY" varchar(256) NOT NULL,
	"INDEMNITY_RESERVE" varchar(256) NOT NULL,
	"MEDICAL_RESERVE" varchar(256) NOT NULL,
	"REHAB_RESERVE" varchar(256) NOT NULL,
	"BI_RESERVE" varchar(256) NOT NULL,
	"PD_RESERVE" varchar(256) NOT NULL,
	"EXPENSE_RESERVE" varchar(256) NOT NULL,
	"LEN_OF_SVC" varchar(256) NOT NULL,
	"PAYMENTS" varchar(256) NOT NULL,
	"RECOVERIES" varchar(256) NOT NULL,
	"REMAIN_RES" varchar(256) NOT NULL,
	"BENEFIT_ST" varchar(256) NOT NULL,
	"SRGRY_FLAG" varchar(256) NOT NULL,
	"TOT_EXPER" varchar(256) NOT NULL,
	"TYPE_LOSS" varchar(256) NOT NULL,
	"UNITNAME_2" varchar(256) NOT NULL,
	"LEVEL_2" varchar(256) NOT NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_gb OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_gb to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_gb to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_gb to rpauser;
GO
GRANT SELECT ON p_and_c.raw_gb to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_gb to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_gb to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_gb to rl_p_and_c_d;
GO