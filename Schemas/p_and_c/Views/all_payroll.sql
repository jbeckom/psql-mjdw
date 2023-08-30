CREATE OR REPLACE VIEW p_and_c.all_payroll
AS SELECT a.policy_id,
    a.city,
    a.state,
    a.zip,
    a.class_code,
    a.payroll,
    a.subsidiary_id
   FROM ( SELECT c.policy_id,
            c.state,
            c.class_code,
            c.payroll,
            c.audited,
            c.uploaded_at,
            c.city,
            c.zip,
            c.employee_headcount_full_time,
            c.employee_headcount_part_time,
            c.employee_headcount_temp,
            c.subsidiary_id,
            c.name,
            c.code,
            c.monopolistic
           FROM ( SELECT a_1.policy_id,
                    a_1.state,
                    a_1.class_code,
                    a_1.payroll,
                    a_1.audited,
                    a_1.uploaded_at,
                    a_1.city,
                    a_1.zip,
                    a_1.employee_headcount_full_time,
                    a_1.employee_headcount_part_time,
                    a_1.employee_headcount_temp,
                    a_1.subsidiary_id,
                    b_1.name,
                    b_1.code,
                    b_1.monopolistic
                   FROM p_and_c.payroll a_1
                     LEFT JOIN p_and_c.states b_1 ON a_1.state = b_1.code
                  WHERE a_1.do_not_include IS NOT TRUE) c
             LEFT JOIN ( SELECT a_1.policy_id,
                    a_1.state,
                    a_1.class_code,
                    a_1.payroll,
                    a_1.audited,
                    a_1.uploaded_at,
                    a_1.city,
                    a_1.zip,
                    a_1.employee_headcount_full_time,
                    a_1.employee_headcount_part_time,
                    a_1.employee_headcount_temp,
                    a_1.subsidiary_id,
                    b_1.name,
                    b_1.code,
                    b_1.monopolistic
                   FROM p_and_c.payroll a_1
                     LEFT JOIN p_and_c.states b_1 ON a_1.state = b_1.code
                  WHERE a_1.do_not_include IS NOT TRUE) d ON concat(c.policy_id, c.city, c.state, c.zip, c.class_code) = concat(d.policy_id, d.city, d.state, d.zip, d.class_code) AND c.audited::integer < d.audited::integer
          WHERE d.audited IS NULL AND c.audited IS NOT NULL) a
     LEFT JOIN ( SELECT c.policy_id,
            c.state,
            c.class_code,
            c.payroll,
            c.audited,
            c.uploaded_at,
            c.city,
            c.zip,
            c.employee_headcount_full_time,
            c.employee_headcount_part_time,
            c.employee_headcount_temp,
            c.subsidiary_id,
            c.name,
            c.code,
            c.monopolistic
           FROM ( SELECT a_1.policy_id,
                    a_1.state,
                    a_1.class_code,
                    a_1.payroll,
                    a_1.audited,
                    a_1.uploaded_at,
                    a_1.city,
                    a_1.zip,
                    a_1.employee_headcount_full_time,
                    a_1.employee_headcount_part_time,
                    a_1.employee_headcount_temp,
                    a_1.subsidiary_id,
                    b_1.name,
                    b_1.code,
                    b_1.monopolistic
                   FROM p_and_c.payroll a_1
                     LEFT JOIN p_and_c.states b_1 ON a_1.state = b_1.code
                  WHERE a_1.do_not_include IS NOT TRUE) c
             LEFT JOIN ( SELECT a_1.policy_id,
                    a_1.state,
                    a_1.class_code,
                    a_1.payroll,
                    a_1.audited,
                    a_1.uploaded_at,
                    a_1.city,
                    a_1.zip,
                    a_1.employee_headcount_full_time,
                    a_1.employee_headcount_part_time,
                    a_1.employee_headcount_temp,
                    a_1.subsidiary_id,
                    a_1.do_not_include,
                    b_1.name,
                    b_1.code,
                    b_1.monopolistic
                   FROM p_and_c.payroll a_1
                     LEFT JOIN p_and_c.states b_1 ON a_1.state = b_1.code
                  WHERE a_1.do_not_include IS NOT TRUE) d ON concat(c.policy_id, c.city, c.state, c.zip, c.class_code) = concat(d.policy_id, d.city, d.state, d.zip, d.class_code) AND c.audited::integer < d.audited::integer
          WHERE d.audited IS NULL AND c.audited IS NOT NULL) b ON a.policy_id = b.policy_id AND a.city = b.city AND a.state = b.state AND a.zip = b.zip AND a.class_code = b.class_code AND a.uploaded_at < b.uploaded_at
  WHERE b.uploaded_at IS NULL AND a.uploaded_at IS NOT NULL AND a.monopolistic = false
UNION
 SELECT xyz.policy_id,
    xyz.city,
    xyz.state,
    xyz.zip,
    xyz.class_code,
    xyz.payroll,
    xyz.subsidiary_id
   FROM ( SELECT a.policy_id,
            a.city,
            a.state,
            a.zip,
            a.class_code,
            a.payroll,
            a.subsidiary_id
           FROM ( SELECT c.policy_id,
                    c.state,
                    c.class_code,
                    c.payroll,
                    c.audited,
                    c.uploaded_at,
                    c.city,
                    c.zip,
                    c.employee_headcount_full_time,
                    c.employee_headcount_part_time,
                    c.employee_headcount_temp,
                    c.subsidiary_id,
                    c.name,
                    c.code,
                    c.monopolistic
                   FROM ( SELECT a_1.policy_id,
                            a_1.state,
                            a_1.class_code,
                            a_1.payroll,
                            a_1.audited,
                            a_1.uploaded_at,
                            a_1.city,
                            a_1.zip,
                            a_1.employee_headcount_full_time,
                            a_1.employee_headcount_part_time,
                            a_1.employee_headcount_temp,
                            a_1.subsidiary_id,
                            b_1.name,
                            b_1.code,
                            b_1.monopolistic
                           FROM p_and_c.payroll a_1
                             LEFT JOIN p_and_c.states b_1 ON a_1.state = b_1.code
                          WHERE a_1.do_not_include IS NOT TRUE) c
                     LEFT JOIN ( SELECT a_1.policy_id,
                            a_1.state,
                            a_1.class_code,
                            a_1.payroll,
                            a_1.audited,
                            a_1.uploaded_at,
                            a_1.city,
                            a_1.zip,
                            a_1.employee_headcount_full_time,
                            a_1.employee_headcount_part_time,
                            a_1.employee_headcount_temp,
                            a_1.subsidiary_id,
                            b_1.name,
                            b_1.code,
                            b_1.monopolistic
                           FROM p_and_c.payroll a_1
                             LEFT JOIN p_and_c.states b_1 ON a_1.state = b_1.code
                          WHERE a_1.do_not_include IS NOT TRUE) d ON concat(c.policy_id, c.city, c.state, c.zip, c.class_code) = concat(d.policy_id, d.city, d.state, d.zip, d.class_code) AND c.audited::integer < d.audited::integer
                  WHERE d.audited IS NULL AND c.audited IS NOT NULL) a
             LEFT JOIN ( SELECT c.policy_id,
                    c.state,
                    c.class_code,
                    c.payroll,
                    c.audited,
                    c.uploaded_at,
                    c.city,
                    c.zip,
                    c.employee_headcount_full_time,
                    c.employee_headcount_part_time,
                    c.employee_headcount_temp,
                    c.subsidiary_id,
                    c.name,
                    c.code,
                    c.monopolistic
                   FROM ( SELECT a_1.policy_id,
                            a_1.state,
                            a_1.class_code,
                            a_1.payroll,
                            a_1.audited,
                            a_1.uploaded_at,
                            a_1.city,
                            a_1.zip,
                            a_1.employee_headcount_full_time,
                            a_1.employee_headcount_part_time,
                            a_1.employee_headcount_temp,
                            a_1.subsidiary_id,
                            b_1.name,
                            b_1.code,
                            b_1.monopolistic
                           FROM p_and_c.payroll a_1
                             LEFT JOIN p_and_c.states b_1 ON a_1.state = b_1.code
                          WHERE a_1.do_not_include IS NOT TRUE) c
                     LEFT JOIN ( SELECT a_1.policy_id,
                            a_1.state,
                            a_1.class_code,
                            a_1.payroll,
                            a_1.audited,
                            a_1.uploaded_at,
                            a_1.city,
                            a_1.zip,
                            a_1.employee_headcount_full_time,
                            a_1.employee_headcount_part_time,
                            a_1.employee_headcount_temp,
                            a_1.subsidiary_id,
                            b_1.name,
                            b_1.code,
                            b_1.monopolistic
                           FROM p_and_c.payroll a_1
                             LEFT JOIN p_and_c.states b_1 ON a_1.state = b_1.code
                          WHERE a_1.do_not_include IS NOT TRUE) d ON concat(c.policy_id, c.city, c.state, c.zip, c.class_code) = concat(d.policy_id, d.city, d.state, d.zip, d.class_code) AND c.audited::integer < d.audited::integer
                  WHERE d.audited IS NULL AND c.audited IS NOT NULL) b ON a.policy_id = b.policy_id AND a.city = b.city AND a.state = b.state AND a.zip = b.zip AND a.class_code = b.class_code AND a.uploaded_at < b.uploaded_at
          WHERE b.uploaded_at IS NULL AND a.uploaded_at IS NOT NULL) xyz
     LEFT JOIN p_and_c.all_policies abc ON xyz.policy_id = abc.policy_id
  WHERE (abc.client_id::text = ANY (ARRAY['AVISIND'::text, 'GRADINC'::text, 'STRAQUA'::text, 'PRESSER'::text])) AND xyz.state = 'OH'::bpchar;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.all_payroll OWNER TO mj_admin;
GO

Grant select on table p_and_c.all_payroll to rl_pc_data_analyst;
GO

Grant select on table p_and_c.all_payroll to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.all_payroll to rpauser;
GO
GRANT SELECT ON p_and_c.all_payroll to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.all_payroll to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.all_payroll to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.all_payroll to rl_p_and_c_d;
GO