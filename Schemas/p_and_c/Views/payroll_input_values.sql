CREATE OR REPLACE VIEW p_and_c.payroll_input_values
AS SELECT a.client_id,
    generate_series(0::numeric, 2::numeric * floor((a.payroll + 99999::numeric) / 100000::numeric) * 100000::numeric, 100000::numeric) AS payroll_options,
    a.policy_year
   FROM ( SELECT b_1.client_id,
            date_part('year'::text, b_1.policy_start_date) AS policy_year,
            sum(a_2.payroll) AS payroll
           FROM p_and_c.all_payroll a_2
             LEFT JOIN p_and_c.all_policies b_1 ON a_2.policy_id = b_1.policy_id
          GROUP BY b_1.client_id, (date_part('year'::text, b_1.policy_start_date))) a
     LEFT JOIN ( SELECT b_1.client_id,
            date_part('year'::text, b_1.policy_start_date) AS policy_year,
            sum(a_2.payroll) AS payroll
           FROM p_and_c.all_payroll a_2
             LEFT JOIN p_and_c.all_policies b_1 ON a_2.policy_id = b_1.policy_id
          GROUP BY b_1.client_id, (date_part('year'::text, b_1.policy_start_date))) b ON a.client_id::text = b.client_id::text AND b.policy_year > a.policy_year
  WHERE b.policy_year IS NULL AND a.policy_year IS NOT NULL;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.payroll_input_values OWNER TO mj_admin;
GO

Grant select on table p_and_c.payroll_input_values to rl_pc_data_analyst;
GO

Grant select on table p_and_c.payroll_input_values to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.payroll_input_values to rpauser;
GO
GRANT SELECT ON p_and_c.payroll_input_values to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.payroll_input_values to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.payroll_input_values to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.payroll_input_values to rl_p_and_c_d;
GO