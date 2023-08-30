CREATE OR REPLACE VIEW p_and_c.ce_accts_payroll
AS SELECT b.client_id,
    b.policy_start_date,
    sum(a.payroll)::numeric(18,0) AS payroll
   FROM p_and_c.all_payroll a
     LEFT JOIN p_and_c.all_policies b ON a.policy_id = b.policy_id
  GROUP BY b.client_id, b.policy_start_date;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.ce_accts_payroll OWNER TO mj_admin;
GO

Grant select on table p_and_c.ce_accts_payroll to rl_pc_data_analyst;
GO

Grant select on table p_and_c.ce_accts_payroll to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.ce_accts_payroll to rpauser;
GO
GRANT SELECT ON p_and_c.ce_accts_payroll to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.ce_accts_payroll to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.ce_accts_payroll to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.ce_accts_payroll to rl_p_and_c_d;
GO