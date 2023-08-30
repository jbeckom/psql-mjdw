CREATE OR REPLACE VIEW p_and_c.all_employee_headcount
AS SELECT a.policy_id,
    a.city,
    a.state,
    a.zip,
    a.class_code,
    a.audited,
    a.uploaded_at,
    a.employee_headcount
   FROM ( SELECT a_1.policy_id,
            a_1.city,
            a_1.state,
            a_1.zip,
            a_1.class_code,
            a_1.audited,
            a_1.uploaded_at,
            a_1.employee_headcount
           FROM ( SELECT a_2.policy_id,
                    a_2.city,
                    a_2.state,
                    a_2.zip,
                    a_2.class_code,
                    a_2.audited,
                    a_2.uploaded_at,
                    (COALESCE(a_2.employee_headcount_full_time, 0::numeric) + COALESCE(a_2.employee_headcount_part_time, 0::numeric) + COALESCE(a_2.employee_headcount_temp, 0::numeric))::numeric(18,0) AS employee_headcount
                   FROM p_and_c.payroll a_2
                     LEFT JOIN p_and_c.states b_2 ON a_2.state = b_2.code) a_1
             LEFT JOIN ( SELECT a_2.policy_id,
                    a_2.city,
                    a_2.state,
                    a_2.zip,
                    a_2.class_code,
                    a_2.audited,
                    a_2.uploaded_at,
                    (COALESCE(a_2.employee_headcount_full_time, 0::numeric) + COALESCE(a_2.employee_headcount_part_time, 0::numeric) + COALESCE(a_2.employee_headcount_temp, 0::numeric))::numeric(18,0) AS employee_headcount
                   FROM p_and_c.payroll a_2
                     LEFT JOIN p_and_c.states b_2 ON a_2.state = b_2.code) b_1 ON a_1.policy_id = b_1.policy_id AND a_1.state = b_1.state AND a_1.class_code = b_1.class_code AND a_1.audited::integer < b_1.audited::integer
          WHERE b_1.audited IS NULL AND a_1.audited IS NOT NULL) a
     LEFT JOIN ( SELECT a_1.policy_id,
            a_1.city,
            a_1.state,
            a_1.zip,
            a_1.class_code,
            a_1.audited,
            a_1.uploaded_at,
            a_1.employee_headcount
           FROM ( SELECT a_2.policy_id,
                    a_2.city,
                    a_2.state,
                    a_2.zip,
                    a_2.class_code,
                    a_2.audited,
                    a_2.uploaded_at,
                    (COALESCE(a_2.employee_headcount_full_time, 0::numeric) + COALESCE(a_2.employee_headcount_part_time, 0::numeric) + COALESCE(a_2.employee_headcount_temp, 0::numeric))::numeric(18,0) AS employee_headcount
                   FROM p_and_c.payroll a_2
                     LEFT JOIN p_and_c.states b_2 ON a_2.state = b_2.code) a_1
             LEFT JOIN ( SELECT a_2.policy_id,
                    a_2.city,
                    a_2.state,
                    a_2.zip,
                    a_2.class_code,
                    a_2.audited,
                    a_2.uploaded_at,
                    (COALESCE(a_2.employee_headcount_full_time, 0::numeric) + COALESCE(a_2.employee_headcount_part_time, 0::numeric) + COALESCE(a_2.employee_headcount_temp, 0::numeric))::numeric(18,0) AS employee_headcount
                   FROM p_and_c.payroll a_2
                     LEFT JOIN p_and_c.states b_2 ON a_2.state = b_2.code) b_1 ON a_1.policy_id = b_1.policy_id AND a_1.state = b_1.state AND a_1.class_code = b_1.class_code AND a_1.audited::integer < b_1.audited::integer
          WHERE b_1.audited IS NULL AND a_1.audited IS NOT NULL) b ON a.policy_id = b.policy_id AND a.state = b.state AND a.class_code = b.class_code AND a.audited = b.audited AND a.uploaded_at::date < b.uploaded_at::date
  WHERE b.uploaded_at IS NULL AND a.uploaded_at IS NOT NULL;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.all_employee_headcount OWNER TO mj_admin;
GO

Grant select on table p_and_c.all_employee_headcount to rl_pc_data_analyst;
GO

Grant select on table p_and_c.all_employee_headcount to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.all_employee_headcount to rpauser;
GO
GRANT SELECT ON p_and_c.all_employee_headcount to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.all_employee_headcount to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.all_employee_headcount to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.all_employee_headcount to rl_p_and_c_d;
GO