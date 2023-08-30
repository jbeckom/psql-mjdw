CREATE TABLE p_and_c.raw_hartford (
	name_insured varchar(256) NOT NULL,
	report_period varchar(256) NOT NULL,
	date_produced varchar(256) NOT NULL,
	"policy" varchar(256) NOT NULL,
	lob varchar(256) NOT NULL,
	valued_as_of varchar(256) NOT NULL,
	producer varchar(256) NOT NULL,
	producer_code varchar(256) NOT NULL,
	producing_regional varchar(256) NOT NULL,
	policy_term varchar(256) NOT NULL,
	policy_type varchar(256) NOT NULL,
	loss_date varchar(256) NOT NULL,
	date_reported varchar(256) NOT NULL,
	date_closed varchar(256) NULL,
	claim_number varchar(256) NOT NULL,
	risk_state varchar(256) NOT NULL,
	class_code varchar(256) NULL,
	paid_losses varchar(256) NOT NULL,
	paid_expense varchar(256) NOT NULL,
	open_losses varchar(256) NOT NULL,
	open_expense varchar(256) NOT NULL,
	total_inc_loss_and_exp varchar(256) NOT NULL,
	recovery_pending_wco_med_only varchar(256) NULL,
	claimantdriverlocation_of_property varchar(256) NOT NULL,
	age varchar(256) NOT NULL,
	length_employment varchar(256) NULL,
	accident_code varchar(256) NOT NULL,
	location_of_accidentclaim_descclmt_occupation varchar(256) NOT NULL,
	filename varchar(256) NOT NULL,
	uploaded_at varchar(256) NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_hartford OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_hartford to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_hartford to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_hartford to rpauser;
GO
GRANT SELECT ON p_and_c.raw_hartford to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_hartford to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_hartford to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_hartford to rl_p_and_c_d;
GO