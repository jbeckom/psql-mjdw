CREATE TABLE p_and_c.auto_classes_primary (
	primary_class_code bpchar(3) NOT NULL,
	weight_class varchar NOT NULL,
	business_use varchar NOT NULL,
	radius varchar NOT NULL,
	fleet varchar NOT NULL
);
GO


/*** PERMISSIONS ***/
ALTER TABLE p_and_c.auto_classes_primary OWNER TO mj_admin;
GO

Grant select on table p_and_c.auto_classes_primary to rl_pc_data_analyst;
GO

Grant select on table p_and_c.auto_classes_primary to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.auto_classes_primary to rpauser;
GO

GRANT SELECT ON p_and_c.auto_classes_primary to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.auto_classes_primary to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.auto_classes_primary to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.auto_classes_primary to rl_p_and_c_d;
GO