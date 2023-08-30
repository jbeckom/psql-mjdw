DROP MATERIALIZED VIEW IF EXISTS p_and_c.advisen_bm_requests CASCADE;
GO

CREATE VIEW p_and_c.advisen_bm_requests
AS SELECT DISTINCT (c.policy_end_date - '4 mons'::interval)::date AS trigger_date,
    replace(d.client_name, '&amp;amp;amp;'::text, '&'::text) AS name,
    replace(d.client_cd, '&amp;amp;amp;'::text, '&'::text) AS client_id,
        CASE
            WHEN d.web_site_link = 'N'::text THEN NULL::text
            ELSE d.web_site_link
        END AS website,
    replace(d.addr_1, '&amp;amp;amp;'::text, '&'::text) AS address,
    d.city,
    d.state_prov_cd AS state,
    "left"(e.industry_id::text, 4) AS industry,
    p.sic_id_4_name AS industry_name,
    ''::text AS type,
    f.revenue,
    g.employee_headcount AS employees,
    "left"(e.industry_id::text, 4) AS sic_code,
    i.value AS gli_limit,
    h.value AS gli_retention,
    t.premium AS gli_premium,
    i.policy_start_date AS gli_date,
    NULL::integer AS umbrella_limit,
    NULL::integer AS umbrella_retention,
    u.premium AS umbrella_premium,
    u.policy_start_date AS umbrella_date,
    NULL::integer AS do_limit,
    NULL::integer AS do_retention,
    v.premium AS do_premium,
    v.policy_start_date AS do_date,
    j.value AS prop_limit,
    k.value AS prop_retention,
    w.premium AS prop_premium,
    j.policy_start_date AS prop_date,
    m.value AS wco_limit,
    l.value AS wco_retention,
    x.premium AS wco_premium,
    m.policy_start_date AS wco_date,
    NULL::integer AS prof_limit,
    NULL::integer AS prof_retention,
    y.premium AS prof_premium,
    y.policy_start_date AS prof_date,
    NULL::integer AS epl_limit,
    NULL::integer AS epl_retention,
    z.premium AS epl_premium,
    z.policy_start_date AS epl_date,
    NULL::integer AS fid_limit,
    NULL::integer AS fid_retention,
    aa.premium AS fid_premium,
    aa.policy_start_date AS fid_date,
    NULL::integer AS crm_limit,
    NULL::integer AS crm_retention,
    bb.premium AS crm_premium,
    bb.policy_start_date AS crm_date,
    n.value AS cau_limit,
    o.value AS cau_retention,
    cc.premium AS cau_premium,
    n.policy_start_date AS cau_date,
    s.value AS cyb_limit,
    r.value AS cyb_retention,
    dd.premium AS cyb_premium,
    s.policy_start_date AS cyb_date,
    NULL::integer AS extra_limit_1,
    NULL::integer AS extra_retention_1,
    NULL::integer AS extra_premium_1,
    NULL::date AS extra_date_1,
    NULL::integer AS extra_limit_2,
    NULL::integer AS extra_retention_2,
    NULL::integer AS extra_premium_2,
    NULL::date AS extra_date_2,
    NULL::integer AS extra_limit_3,
    NULL::integer AS extra_retention_3,
    NULL::integer AS extra_premium_3,
    NULL::date AS extra_date_3,
    NULL::integer AS extra_limit_4,
    NULL::integer AS extra_retention_4,
    NULL::integer AS extra_premium_4,
    NULL::date AS extra_date_4,
    q.extra_lob_1,
    q.extra_lob_2,
    q.extra_lob_3,
    q.extra_lob_4,
    q.extra_lob_cnt
   FROM ( SELECT a.policy_id,
            a.client_id,
            a.carrier_id,
            a.policy_number,
            a.coverage_type_id,
            a.policy_start_date,
            a.policy_end_date,
            a.premium,
            a.mod,
            a.aggregate_deductible,
            a.aggregate_limit,
            a.prev_policy_id,
            a.premium_1
           FROM p_and_c.all_policies_zero a
             LEFT JOIN p_and_c.all_policies_zero b ON a.client_id::text = b.client_id::text AND a.coverage_type_id::text = b.coverage_type_id::text AND a.premium_1 < b.premium_1
          WHERE b.premium_1 IS NULL AND a.premium_1 IS NOT NULL AND a.coverage_type_id::text = 'WCO'::text) c
     LEFT JOIN sagitta.clients d ON c.client_id::text = d.client_cd
     LEFT JOIN p_and_c.clients e ON c.client_id::text = e.id::text
     LEFT JOIN ( SELECT a.client_id,
            a.policy_start_date,
            a.revenue
           FROM p_and_c.all_revenue a
             LEFT JOIN p_and_c.all_revenue b ON a.client_id = b.client_id AND a.policy_start_date < b.policy_start_date
          WHERE b.policy_start_date IS NULL AND a.policy_start_date IS NOT NULL) f ON c.client_id::text = f.client_id
     LEFT JOIN ( SELECT a.client_id,
            a.employee_headcount
           FROM ( SELECT b_1.client_id,
                    b_1.policy_start_date,
                    sum(a_1.employee_headcount) AS employee_headcount
                   FROM p_and_c.all_employee_headcount a_1
                     LEFT JOIN p_and_c.all_policies b_1 ON a_1.policy_id = b_1.policy_id
                  GROUP BY b_1.client_id, b_1.policy_start_date) a
             LEFT JOIN ( SELECT b_1.client_id,
                    b_1.policy_start_date,
                    sum(a_1.employee_headcount) AS employee_headcount
                   FROM p_and_c.all_employee_headcount a_1
                     LEFT JOIN p_and_c.all_policies b_1 ON a_1.policy_id = b_1.policy_id
                  GROUP BY b_1.client_id, b_1.policy_start_date) b ON a.client_id::text = b.client_id::text AND a.policy_start_date < b.policy_start_date
          WHERE b.policy_start_date IS NULL AND a.policy_start_date IS NOT NULL) g ON c.client_id::text = g.client_id::text
     LEFT JOIN ( SELECT a.client_id,
            a.value,
            a.policy_start_date
           FROM p_and_c.all_policies_gli_bm a
             LEFT JOIN p_and_c.all_policies_gli_bm b ON a.client_id::text = b.client_id::text AND a.policy_start_date < b.policy_start_date
          WHERE b.policy_start_date IS NULL AND a.policy_start_date IS NOT NULL AND a.occurrence_type_id = 1::numeric) h ON c.client_id::text = h.client_id::text
     LEFT JOIN ( SELECT a.client_id,
            a.value,
            a.policy_start_date
           FROM p_and_c.all_policies_gli_bm a
             LEFT JOIN p_and_c.all_policies_gli_bm b ON a.client_id::text = b.client_id::text AND a.policy_start_date < b.policy_start_date
          WHERE b.policy_start_date IS NULL AND a.policy_start_date IS NOT NULL AND a.occurrence_type_id = 2::numeric) i ON c.client_id::text = i.client_id::text
     LEFT JOIN ( SELECT a.client_id,
            a.value,
            a.policy_start_date
           FROM p_and_c.all_policies_prop_bm a
             LEFT JOIN p_and_c.all_policies_prop_bm b ON a.client_id::text = b.client_id::text AND a.policy_start_date < b.policy_start_date
          WHERE b.policy_start_date IS NULL AND a.policy_start_date IS NOT NULL AND a.occurrence_type_id = 2::numeric) j ON c.client_id::text = j.client_id::text
     LEFT JOIN ( SELECT a.client_id,
            a.value,
            a.policy_start_date
           FROM p_and_c.all_policies_prop_bm a
             LEFT JOIN p_and_c.all_policies_prop_bm b ON a.client_id::text = b.client_id::text AND a.policy_start_date < b.policy_start_date
          WHERE b.policy_start_date IS NULL AND a.policy_start_date IS NOT NULL AND a.occurrence_type_id = 1::numeric) k ON c.client_id::text = k.client_id::text
     LEFT JOIN ( SELECT a.client_id,
            a.value,
            a.policy_start_date
           FROM p_and_c.all_policies_wc_bm a
             LEFT JOIN p_and_c.all_policies_wc_bm b ON a.client_id::text = b.client_id::text AND a.policy_start_date < b.policy_start_date
          WHERE b.policy_start_date IS NULL AND a.policy_start_date IS NOT NULL AND a.occurrence_type_id = 1::numeric) l ON c.client_id::text = l.client_id::text
     LEFT JOIN ( SELECT a.client_id,
            a.value,
            a.policy_start_date
           FROM p_and_c.all_policies_wc_bm a
             LEFT JOIN p_and_c.all_policies_wc_bm b ON a.client_id::text = b.client_id::text AND a.policy_start_date < b.policy_start_date
          WHERE b.policy_start_date IS NULL AND a.policy_start_date IS NOT NULL AND a.occurrence_type_id = 2::numeric) m ON c.client_id::text = m.client_id::text
     LEFT JOIN ( SELECT a.client_id,
            a.value,
            a.policy_start_date
           FROM p_and_c.all_policies_cau_bm a
             LEFT JOIN p_and_c.all_policies_cau_bm b ON a.client_id::text = b.client_id::text AND a.policy_start_date < b.policy_start_date
          WHERE b.policy_start_date IS NULL AND a.policy_start_date IS NOT NULL AND a.occurrence_type_id = 2::numeric) n ON c.client_id::text = n.client_id::text
     LEFT JOIN ( SELECT a.client_id,
            a.value,
            a.policy_start_date
           FROM p_and_c.all_policies_cau_bm a
             LEFT JOIN p_and_c.all_policies_cau_bm b ON a.client_id::text = b.client_id::text AND a.policy_start_date < b.policy_start_date
          WHERE b.policy_start_date IS NULL AND a.policy_start_date IS NOT NULL AND a.occurrence_type_id = 1::numeric) o ON c.client_id::text = o.client_id::text
     LEFT JOIN ( SELECT a.client_id,
            a.value,
            a.policy_start_date
           FROM p_and_c.all_policies_cyb_bm a
             LEFT JOIN p_and_c.all_policies_cyb_bm b ON a.client_id::text = b.client_id::text AND a.policy_start_date < b.policy_start_date
          WHERE b.policy_start_date IS NULL AND a.policy_start_date IS NOT NULL AND a.occurrence_type_id = 1::numeric) r ON c.client_id::text = o.client_id::text
     LEFT JOIN ( SELECT a.client_id,
            a.value,
            a.policy_start_date
           FROM p_and_c.all_policies_cyb_bm a
             LEFT JOIN p_and_c.all_policies_cyb_bm b ON a.client_id::text = b.client_id::text AND a.policy_start_date < b.policy_start_date
          WHERE b.policy_start_date IS NULL AND a.policy_start_date IS NOT NULL AND a.occurrence_type_id = 2::numeric) s ON c.client_id::text = o.client_id::text
     LEFT JOIN ( SELECT DISTINCT a.client_id,
            a.premium_1 AS premium,
            a.policy_start_date
           FROM p_and_c.all_policies_zero a
             LEFT JOIN p_and_c.all_policies_zero b ON a.client_id::text = b.client_id::text AND a.coverage_type_id::text = b.coverage_type_id::text AND a.premium_1 < b.premium_1
          WHERE b.premium_1 IS NULL AND a.premium_1 IS NOT NULL AND a.coverage_type_id::text = 'GLI'::text) t ON c.client_id::text = t.client_id::text
     LEFT JOIN ( SELECT DISTINCT a.client_id,
            a.premium_1 AS premium,
            a.policy_start_date
           FROM p_and_c.all_policies_zero a
             LEFT JOIN p_and_c.all_policies_zero b ON a.client_id::text = b.client_id::text AND a.coverage_type_id::text = b.coverage_type_id::text AND a.premium_1 < b.premium_1
          WHERE b.premium_1 IS NULL AND a.premium_1 IS NOT NULL AND a.coverage_type_id::text = 'XLU'::text) u ON c.client_id::text = u.client_id::text
     LEFT JOIN ( SELECT DISTINCT a.client_id,
            a.premium_1 AS premium,
            a.policy_start_date
           FROM p_and_c.all_policies_zero a
             LEFT JOIN p_and_c.all_policies_zero b ON a.client_id::text = b.client_id::text AND a.coverage_type_id::text = b.coverage_type_id::text AND a.premium_1 < b.premium_1
          WHERE b.premium_1 IS NULL AND a.premium_1 IS NOT NULL AND a.coverage_type_id::text = 'DBL'::text) v ON c.client_id::text = v.client_id::text
     LEFT JOIN ( SELECT DISTINCT a.client_id,
            a.premium_1 AS premium,
            a.policy_start_date
           FROM p_and_c.all_policies_zero a
             LEFT JOIN p_and_c.all_policies_zero b ON a.client_id::text = b.client_id::text AND a.coverage_type_id::text = b.coverage_type_id::text AND a.premium_1 < b.premium_1
          WHERE b.premium_1 IS NULL AND a.premium_1 IS NOT NULL AND a.coverage_type_id::text = 'CPP'::text) w ON c.client_id::text = w.client_id::text
     LEFT JOIN ( SELECT DISTINCT a.client_id,
            a.premium_1 AS premium,
            a.policy_start_date
           FROM p_and_c.all_policies_zero a
             LEFT JOIN p_and_c.all_policies_zero b ON a.client_id::text = b.client_id::text AND a.coverage_type_id::text = b.coverage_type_id::text AND a.premium_1 < b.premium_1
          WHERE b.premium_1 IS NULL AND a.premium_1 IS NOT NULL AND a.coverage_type_id::text = 'WCO'::text) x ON c.client_id::text = x.client_id::text
     LEFT JOIN ( SELECT DISTINCT a.client_id,
            a.premium_1 AS premium,
            a.policy_start_date
           FROM p_and_c.all_policies_zero a
             LEFT JOIN p_and_c.all_policies_zero b ON a.client_id::text = b.client_id::text AND a.coverage_type_id::text = b.coverage_type_id::text AND a.premium_1 < b.premium_1
          WHERE b.premium_1 IS NULL AND a.premium_1 IS NOT NULL AND a.coverage_type_id::text = 'PRO'::text) y ON c.client_id::text = y.client_id::text
     LEFT JOIN ( SELECT DISTINCT a.client_id,
            a.premium_1 AS premium,
            a.policy_start_date
           FROM p_and_c.all_policies_zero a
             LEFT JOIN p_and_c.all_policies_zero b ON a.client_id::text = b.client_id::text AND a.coverage_type_id::text = b.coverage_type_id::text AND a.premium_1 < b.premium_1
          WHERE b.premium_1 IS NULL AND a.premium_1 IS NOT NULL AND a.coverage_type_id::text = 'EMP'::text) z ON c.client_id::text = z.client_id::text
     LEFT JOIN ( SELECT DISTINCT a.client_id,
            a.premium_1 AS premium,
            a.policy_start_date
           FROM p_and_c.all_policies_zero a
             LEFT JOIN p_and_c.all_policies_zero b ON a.client_id::text = b.client_id::text AND a.coverage_type_id::text = b.coverage_type_id::text AND a.premium_1 < b.premium_1
          WHERE b.premium_1 IS NULL AND a.premium_1 IS NOT NULL AND a.coverage_type_id::text = 'FDC'::text) aa ON c.client_id::text = aa.client_id::text
     LEFT JOIN ( SELECT DISTINCT a.client_id,
            a.premium_1 AS premium,
            a.policy_start_date
           FROM p_and_c.all_policies_zero a
             LEFT JOIN p_and_c.all_policies_zero b ON a.client_id::text = b.client_id::text AND a.coverage_type_id::text = b.coverage_type_id::text AND a.premium_1 < b.premium_1
          WHERE b.premium_1 IS NULL AND a.premium_1 IS NOT NULL AND a.coverage_type_id::text = 'CRM'::text) bb ON c.client_id::text = bb.client_id::text
     LEFT JOIN ( SELECT DISTINCT a.client_id,
            a.premium_1 AS premium,
            a.policy_start_date
           FROM p_and_c.all_policies_zero a
             LEFT JOIN p_and_c.all_policies_zero b ON a.client_id::text = b.client_id::text AND a.coverage_type_id::text = b.coverage_type_id::text AND a.premium_1 < b.premium_1
          WHERE b.premium_1 IS NULL AND a.premium_1 IS NOT NULL AND a.coverage_type_id::text = 'CAU'::text) cc ON c.client_id::text = cc.client_id::text
     LEFT JOIN ( SELECT DISTINCT a.client_id,
            a.premium_1 AS premium,
            a.policy_start_date
           FROM p_and_c.all_policies_zero a
             LEFT JOIN p_and_c.all_policies_zero b ON a.client_id::text = b.client_id::text AND a.coverage_type_id::text = b.coverage_type_id::text AND a.premium_1 < b.premium_1
          WHERE b.premium_1 IS NULL AND a.premium_1 IS NOT NULL AND a.coverage_type_id::text = 'CYB'::text) dd ON c.client_id::text = dd.client_id::text
     LEFT JOIN p_and_c.industry_codes p ON "left"(e.industry_id::text, 4) = p.sic_id_4
     LEFT JOIN p_and_c.advisen_extra_lobs q ON p.sic_category_id = q.sic_category_id::text
  WHERE d.status_cd = 'A'::text;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.advisen_bm_requests OWNER TO mj_admin;
GO

Grant select on table p_and_c.advisen_bm_requests to rl_pc_data_analyst;
GO

Grant select on table p_and_c.advisen_bm_requests to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.advisen_bm_requests to rpauser;
GO

GRANT SELECT ON p_and_c.advisen_bm_requests to rl_p_and_c_r;
GO