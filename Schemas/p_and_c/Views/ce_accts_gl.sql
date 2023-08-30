CREATE OR REPLACE VIEW p_and_c.ce_accts_gl
AS SELECT DISTINCT b.policy_start_date,
    b.client_id,
    b.key,
    c."Area",
    d."Payroll",
    e."Sales",
    f."Cost",
    g."Units",
    h."Other"
   FROM ( SELECT b_1.policy_start_date,
            b_1.client_id,
            concat(b_1.policy_start_date, ' - ', b_1.client_id) AS key
           FROM p_and_c.all_gl_exposures a
             LEFT JOIN p_and_c.all_policies b_1 ON a.policy_id = b_1.policy_id) b
     LEFT JOIN ( SELECT concat(b_1.policy_start_date, ' - ', b_1.client_id) AS key,
                CASE
                    WHEN a.gl_basis_id = 'a'::bpchar THEN sum(a.exposure)
                    ELSE NULL::numeric
                END AS "Area"
           FROM p_and_c.all_gl_exposures a
             LEFT JOIN p_and_c.all_policies b_1 ON a.policy_id = b_1.policy_id
          WHERE a.gl_basis_id = 'a'::bpchar
          GROUP BY b_1.policy_start_date, b_1.client_id, a.gl_basis_id) c ON b.key = c.key
     LEFT JOIN ( SELECT concat(b_1.policy_start_date, ' - ', b_1.client_id) AS key,
                CASE
                    WHEN a.gl_basis_id = 'p'::bpchar THEN sum(a.exposure)
                    ELSE NULL::numeric
                END AS "Payroll"
           FROM p_and_c.all_gl_exposures a
             LEFT JOIN p_and_c.all_policies b_1 ON a.policy_id = b_1.policy_id
          WHERE a.gl_basis_id = 'p'::bpchar
          GROUP BY b_1.policy_start_date, b_1.client_id, a.gl_basis_id) d ON b.key = d.key
     LEFT JOIN ( SELECT concat(b_1.policy_start_date, ' - ', b_1.client_id) AS key,
                CASE
                    WHEN a.gl_basis_id = 's'::bpchar THEN sum(a.exposure)
                    ELSE NULL::numeric
                END AS "Sales"
           FROM p_and_c.all_gl_exposures a
             LEFT JOIN p_and_c.all_policies b_1 ON a.policy_id = b_1.policy_id
          WHERE a.gl_basis_id = 's'::bpchar
          GROUP BY b_1.policy_start_date, b_1.client_id, a.gl_basis_id) e ON b.key = e.key
     LEFT JOIN ( SELECT concat(b_1.policy_start_date, ' - ', b_1.client_id) AS key,
                CASE
                    WHEN a.gl_basis_id = 'c'::bpchar THEN sum(a.exposure)
                    ELSE NULL::numeric
                END AS "Cost"
           FROM p_and_c.all_gl_exposures a
             LEFT JOIN p_and_c.all_policies b_1 ON a.policy_id = b_1.policy_id
          WHERE a.gl_basis_id = 'c'::bpchar
          GROUP BY b_1.policy_start_date, b_1.client_id, a.gl_basis_id) f ON b.key = f.key
     LEFT JOIN ( SELECT concat(b_1.policy_start_date, ' - ', b_1.client_id) AS key,
                CASE
                    WHEN a.gl_basis_id = 'u'::bpchar THEN sum(a.exposure)
                    ELSE NULL::numeric
                END AS "Units"
           FROM p_and_c.all_gl_exposures a
             LEFT JOIN p_and_c.all_policies b_1 ON a.policy_id = b_1.policy_id
          WHERE a.gl_basis_id = 'u'::bpchar
          GROUP BY b_1.policy_start_date, b_1.client_id, a.gl_basis_id) g ON b.key = g.key
     LEFT JOIN ( SELECT concat(b_1.policy_start_date, ' - ', b_1.client_id) AS key,
                CASE
                    WHEN a.gl_basis_id = 't'::bpchar THEN sum(a.exposure)
                    ELSE NULL::numeric
                END AS "Other"
           FROM p_and_c.all_gl_exposures a
             LEFT JOIN p_and_c.all_policies b_1 ON a.policy_id = b_1.policy_id
          WHERE a.gl_basis_id = 't'::bpchar
          GROUP BY b_1.policy_start_date, b_1.client_id, a.gl_basis_id) h ON b.key = h.key;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.ce_accts_gl OWNER TO mj_admin;
GO

Grant select on table p_and_c.ce_accts_gl to rl_pc_data_analyst;
GO

Grant select on table p_and_c.ce_accts_gl to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.ce_accts_gl to rpauser;
GO
GRANT SELECT ON p_and_c.ce_accts_gl to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.ce_accts_gl to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.ce_accts_gl to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.ce_accts_gl to rl_p_and_c_d;
GO