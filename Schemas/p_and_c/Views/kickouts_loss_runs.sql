CREATE OR REPLACE VIEW p_and_c.kickouts_loss_runs
AS SELECT DISTINCT a.policy_id::character varying AS sg_pol_seq,
    a.client_id AS sg_client_code
   FROM p_and_c.all_policies a
     LEFT JOIN p_and_c.loss_run_control b ON a.policy_id = b.sg_pol_seq
  WHERE b.sg_pol_seq IS NULL AND a.policy_start_date > '2015-01-01'::date AND a.policy_start_date <= CURRENT_DATE;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.kickouts_loss_runs OWNER TO mj_admin;
GO

Grant select on table p_and_c.kickouts_loss_runs to rl_pc_data_analyst;
GO

Grant select on table p_and_c.kickouts_loss_runs to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.kickouts_loss_runs to rpauser;
GO
GRANT SELECT ON p_and_c.kickouts_loss_runs to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.kickouts_loss_runs to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.kickouts_loss_runs to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.kickouts_loss_runs to rl_p_and_c_d;
GO