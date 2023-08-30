CREATE OR REPLACE VIEW p_and_c.all_revenue
AS SELECT c.client_id,
    c.policy_start_date,
    c.revenue,
    c.unit_override
   FROM ( SELECT a.client_id,
            a.policy_start_date,
            a.revenue,
            a.audited,
            a.unit_override,
            a.uploaded_at
           FROM ( SELECT revenue.client_id,
                    revenue.policy_start_date,
                    revenue.revenue,
                    revenue.audited,
                    revenue.unit_override,
                    revenue.uploaded_at
                   FROM p_and_c.revenue) a
             LEFT JOIN ( SELECT revenue.client_id,
                    revenue.policy_start_date,
                    revenue.revenue,
                    revenue.audited,
                    revenue.unit_override,
                    revenue.uploaded_at
                   FROM p_and_c.revenue) b ON concat(a.client_id, a.policy_start_date, a.unit_override) = concat(b.client_id, b.policy_start_date, b.unit_override) AND a.audited::integer < b.audited::integer
          WHERE b.audited IS NULL AND a.audited IS NOT NULL) c
     LEFT JOIN ( SELECT a.client_id,
            a.policy_start_date,
            a.revenue,
            a.audited,
            a.unit_override,
            a.uploaded_at
           FROM ( SELECT revenue.client_id,
                    revenue.policy_start_date,
                    revenue.revenue,
                    revenue.audited,
                    revenue.unit_override,
                    revenue.uploaded_at
                   FROM p_and_c.revenue) a
             LEFT JOIN ( SELECT revenue.client_id,
                    revenue.policy_start_date,
                    revenue.revenue,
                    revenue.audited,
                    revenue.unit_override,
                    revenue.uploaded_at
                   FROM p_and_c.revenue) b ON concat(a.client_id, a.policy_start_date, a.unit_override) = concat(b.client_id, b.policy_start_date, b.unit_override) AND a.audited::integer < b.audited::integer
          WHERE b.audited IS NULL AND a.audited IS NOT NULL) d ON concat(c.client_id, c.policy_start_date, c.unit_override) = concat(d.client_id, d.policy_start_date, d.unit_override) AND c.uploaded_at < d.uploaded_at
  WHERE d.uploaded_at IS NULL AND c.uploaded_at IS NOT NULL;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.all_revenue OWNER TO mj_admin;
GO

Grant select on table p_and_c.all_revenue to rl_pc_data_analyst;
GO

Grant select on table p_and_c.all_revenue to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.all_revenue to rpauser;
GO
GRANT SELECT ON p_and_c.all_revenue to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.all_revenue to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.all_revenue to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.all_revenue to rl_p_and_c_d;
GO