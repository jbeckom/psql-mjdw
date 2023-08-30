CREATE TABLE p_and_c.raw_auto_owners (
	"date" varchar(256) NOT NULL,
	policy_branch varchar(256) NOT NULL,
	policy_number varchar(256) NOT NULL,
	policy_prefix varchar(256) NOT NULL,
	original_effective_date varchar(256) NOT NULL,
	policy_type varchar(256) NOT NULL,
	named_insured varchar(256) NOT NULL,
	address varchar(256) NOT NULL,
	term varchar(256) NOT NULL,
	claim_number varchar(256) NOT NULL,
	policy_term varchar(256) NOT NULL,
	loss_date varchar(256) NOT NULL,
	close_date varchar(256) NOT NULL,
	coverage varchar(256) NOT NULL,
	allocated_expense varchar(256) NOT NULL,
	pending_reserve_amount varchar(256) NULL,
	recovery_amount varchar(256) NOT NULL,
	paid_amount varchar(256) NOT NULL,
	fault varchar(256) NOT NULL,
	description varchar(256) NOT NULL,
	vehicle_description varchar(256) NOT NULL,
	driver varchar(256) NULL,
	total_allocated_expense varchar(256) NOT NULL,
	total_pending_reserve_amount varchar(256) NOT NULL,
	total_recovery_amount varchar(256) NOT NULL,
	total_paid_amount varchar(256) NOT NULL,
	filename varchar(256) NOT NULL,
	uploaded_at date NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_auto_owners OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_auto_owners to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_auto_owners to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_auto_owners to rpauser;
GO
GRANT SELECT ON p_and_c.raw_auto_owners to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_auto_owners to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_auto_owners to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_auto_owners to rl_p_and_c_d;
GO