CREATE OR REPLACE VIEW p_and_c.ce_accounts
AS SELECT zz.staff_name AS "Client Executive",
    a.client_id AS "Client id",
    c.name AS "Client",
        CASE
            WHEN b.alias IS NULL THEN b.name
            ELSE b.alias
        END AS "Carrier Name",
    replace(a.coverage_type_id::text, '&amp;amp;amp;'::text, '&'::text)::character varying AS "Line of Business",
    a.policy_number AS "Policy Number",
    a.policy_start_date AS "Policy Effective Date",
    a.policy_end_date AS "Policy Expiration Date",
    a.premium AS "Premium",
    d.written_agcy_commission_amt AS "Commission",
    e.value AS "WC Occ Ded",
    g.value AS "GL PD Occ Ded",
    h.value AS "GL PD Occ Limit",
    i.value AS "GL BI Occ Ded",
    j.value AS "GL BI Occ Limit",
    k.value AS "GL Poll Occ Ded",
    l.value AS "GL Poll Occ Limit",
    m.value AS "GL Other Occ Ded",
    n.value AS "GL Other Occ Limit",
    o.value AS "Auto Coll Ded",
    p.value AS "Auto Comp Ded",
    q.value AS "Auto Liab BI Ded",
    r.value AS "Auto Liab BI Limit",
    s.value AS "Auto Liab PD Ded",
    t.value AS "Auto Liab PD Limit",
    u.value AS "Auto UM Ded",
    v.value AS "Auto UM Limit",
    w.value AS "Auto Other Ded",
    x.value AS "Auto Other Limit",
    y.value AS "Auto PD Ded",
    z.value AS "Auto PD Limit",
    aa.value AS "Auto Liab Ded",
    bb.value AS "Auto Liab Limit",
    f.value AS "GL Agg Limit",
    cc.value AS "GL Agg Ded"
   FROM p_and_c.all_policies a
     LEFT JOIN p_and_c.carriers b ON a.carrier_id::text = b.id::text
     LEFT JOIN p_and_c.clients c ON a.client_id::text = c.id::text
     LEFT JOIN sagitta.staff zz ON c.ce_id::text = zz.sagitem::text
     LEFT JOIN sagitta.policies d ON a.policy_id = d.sagitem
     LEFT JOIN ( SELECT occurrence_deductibles_limits.policy_id,
            occurrence_deductibles_limits.value
           FROM p_and_c.occurrence_deductibles_limits
          WHERE occurrence_deductibles_limits.loss_type_id = 1::numeric AND occurrence_deductibles_limits.occurrence_type_id = 1::numeric) e ON a.policy_id::numeric = e.policy_id
     LEFT JOIN ( SELECT occurrence_deductibles_limits.policy_id,
            occurrence_deductibles_limits.value
           FROM p_and_c.occurrence_deductibles_limits
          WHERE occurrence_deductibles_limits.loss_type_id = 8::numeric AND occurrence_deductibles_limits.occurrence_type_id = 1::numeric) g ON a.policy_id::numeric = g.policy_id
     LEFT JOIN ( SELECT occurrence_deductibles_limits.policy_id,
            occurrence_deductibles_limits.value
           FROM p_and_c.occurrence_deductibles_limits
          WHERE occurrence_deductibles_limits.loss_type_id = 8::numeric AND occurrence_deductibles_limits.occurrence_type_id = 2::numeric) h ON a.policy_id::numeric = h.policy_id
     LEFT JOIN ( SELECT occurrence_deductibles_limits.policy_id,
            occurrence_deductibles_limits.value
           FROM p_and_c.occurrence_deductibles_limits
          WHERE occurrence_deductibles_limits.loss_type_id = 9::numeric AND occurrence_deductibles_limits.occurrence_type_id = 1::numeric) i ON a.policy_id::numeric = i.policy_id
     LEFT JOIN ( SELECT occurrence_deductibles_limits.policy_id,
            occurrence_deductibles_limits.value
           FROM p_and_c.occurrence_deductibles_limits
          WHERE occurrence_deductibles_limits.loss_type_id = 9::numeric AND occurrence_deductibles_limits.occurrence_type_id = 2::numeric) j ON a.policy_id::numeric = j.policy_id
     LEFT JOIN ( SELECT occurrence_deductibles_limits.policy_id,
            occurrence_deductibles_limits.value
           FROM p_and_c.occurrence_deductibles_limits
          WHERE occurrence_deductibles_limits.loss_type_id = 14::numeric AND occurrence_deductibles_limits.occurrence_type_id = 1::numeric) k ON a.policy_id::numeric = k.policy_id
     LEFT JOIN ( SELECT occurrence_deductibles_limits.policy_id,
            occurrence_deductibles_limits.value
           FROM p_and_c.occurrence_deductibles_limits
          WHERE occurrence_deductibles_limits.loss_type_id = 14::numeric AND occurrence_deductibles_limits.occurrence_type_id = 2::numeric) l ON a.policy_id::numeric = l.policy_id
     LEFT JOIN ( SELECT occurrence_deductibles_limits.policy_id,
            occurrence_deductibles_limits.value
           FROM p_and_c.occurrence_deductibles_limits
          WHERE occurrence_deductibles_limits.loss_type_id = 13::numeric AND occurrence_deductibles_limits.occurrence_type_id = 1::numeric) m ON a.policy_id::numeric = m.policy_id
     LEFT JOIN ( SELECT occurrence_deductibles_limits.policy_id,
            occurrence_deductibles_limits.value
           FROM p_and_c.occurrence_deductibles_limits
          WHERE occurrence_deductibles_limits.loss_type_id = 13::numeric AND occurrence_deductibles_limits.occurrence_type_id = 2::numeric) n ON a.policy_id::numeric = n.policy_id
     LEFT JOIN ( SELECT occurrence_deductibles_limits.policy_id,
            occurrence_deductibles_limits.value
           FROM p_and_c.occurrence_deductibles_limits
          WHERE occurrence_deductibles_limits.loss_type_id = 3::numeric AND occurrence_deductibles_limits.occurrence_type_id = 1::numeric) o ON a.policy_id::numeric = o.policy_id
     LEFT JOIN ( SELECT occurrence_deductibles_limits.policy_id,
            occurrence_deductibles_limits.value
           FROM p_and_c.occurrence_deductibles_limits
          WHERE occurrence_deductibles_limits.loss_type_id = 4::numeric AND occurrence_deductibles_limits.occurrence_type_id = 1::numeric) p ON a.policy_id::numeric = p.policy_id
     LEFT JOIN ( SELECT occurrence_deductibles_limits.policy_id,
            occurrence_deductibles_limits.value
           FROM p_and_c.occurrence_deductibles_limits
          WHERE occurrence_deductibles_limits.loss_type_id = 5::numeric AND occurrence_deductibles_limits.occurrence_type_id = 1::numeric) q ON a.policy_id::numeric = q.policy_id
     LEFT JOIN ( SELECT occurrence_deductibles_limits.policy_id,
            occurrence_deductibles_limits.value
           FROM p_and_c.occurrence_deductibles_limits
          WHERE occurrence_deductibles_limits.loss_type_id = 5::numeric AND occurrence_deductibles_limits.occurrence_type_id = 2::numeric) r ON a.policy_id::numeric = r.policy_id
     LEFT JOIN ( SELECT occurrence_deductibles_limits.policy_id,
            occurrence_deductibles_limits.value
           FROM p_and_c.occurrence_deductibles_limits
          WHERE occurrence_deductibles_limits.loss_type_id = 6::numeric AND occurrence_deductibles_limits.occurrence_type_id = 1::numeric) s ON a.policy_id::numeric = s.policy_id
     LEFT JOIN ( SELECT occurrence_deductibles_limits.policy_id,
            occurrence_deductibles_limits.value
           FROM p_and_c.occurrence_deductibles_limits
          WHERE occurrence_deductibles_limits.loss_type_id = 6::numeric AND occurrence_deductibles_limits.occurrence_type_id = 2::numeric) t ON a.policy_id::numeric = t.policy_id
     LEFT JOIN ( SELECT occurrence_deductibles_limits.policy_id,
            occurrence_deductibles_limits.value
           FROM p_and_c.occurrence_deductibles_limits
          WHERE occurrence_deductibles_limits.loss_type_id = 7::numeric AND occurrence_deductibles_limits.occurrence_type_id = 1::numeric) u ON a.policy_id::numeric = u.policy_id
     LEFT JOIN ( SELECT occurrence_deductibles_limits.policy_id,
            occurrence_deductibles_limits.value
           FROM p_and_c.occurrence_deductibles_limits
          WHERE occurrence_deductibles_limits.loss_type_id = 7::numeric AND occurrence_deductibles_limits.occurrence_type_id = 2::numeric) v ON a.policy_id::numeric = v.policy_id
     LEFT JOIN ( SELECT occurrence_deductibles_limits.policy_id,
            occurrence_deductibles_limits.value
           FROM p_and_c.occurrence_deductibles_limits
          WHERE occurrence_deductibles_limits.loss_type_id = 10::numeric AND occurrence_deductibles_limits.occurrence_type_id = 1::numeric) w ON a.policy_id::numeric = w.policy_id
     LEFT JOIN ( SELECT occurrence_deductibles_limits.policy_id,
            occurrence_deductibles_limits.value
           FROM p_and_c.occurrence_deductibles_limits
          WHERE occurrence_deductibles_limits.loss_type_id = 10::numeric AND occurrence_deductibles_limits.occurrence_type_id = 2::numeric) x ON a.policy_id::numeric = x.policy_id
     LEFT JOIN ( SELECT occurrence_deductibles_limits.policy_id,
            occurrence_deductibles_limits.value
           FROM p_and_c.occurrence_deductibles_limits
          WHERE occurrence_deductibles_limits.loss_type_id = 11::numeric AND occurrence_deductibles_limits.occurrence_type_id = 1::numeric) y ON a.policy_id::numeric = y.policy_id
     LEFT JOIN ( SELECT occurrence_deductibles_limits.policy_id,
            occurrence_deductibles_limits.value
           FROM p_and_c.occurrence_deductibles_limits
          WHERE occurrence_deductibles_limits.loss_type_id = 11::numeric AND occurrence_deductibles_limits.occurrence_type_id = 2::numeric) z ON a.policy_id::numeric = z.policy_id
     LEFT JOIN ( SELECT occurrence_deductibles_limits.policy_id,
            occurrence_deductibles_limits.value
           FROM p_and_c.occurrence_deductibles_limits
          WHERE occurrence_deductibles_limits.loss_type_id = 12::numeric AND occurrence_deductibles_limits.occurrence_type_id = 1::numeric) aa ON a.policy_id::numeric = aa.policy_id
     LEFT JOIN ( SELECT occurrence_deductibles_limits.policy_id,
            occurrence_deductibles_limits.value
           FROM p_and_c.occurrence_deductibles_limits
          WHERE occurrence_deductibles_limits.loss_type_id = 12::numeric AND occurrence_deductibles_limits.occurrence_type_id = 2::numeric) bb ON a.policy_id::numeric = bb.policy_id
     LEFT JOIN ( SELECT agg_ded_lim_mod.policy_id,
            agg_ded_lim_mod.value
           FROM p_and_c.agg_ded_lim_mod
          WHERE agg_ded_lim_mod.loss_type_id = 13::numeric AND agg_ded_lim_mod.aggregate_type_id = 2::numeric) f ON a.policy_id::numeric = f.policy_id
     LEFT JOIN ( SELECT agg_ded_lim_mod.policy_id,
            agg_ded_lim_mod.value
           FROM p_and_c.agg_ded_lim_mod
          WHERE agg_ded_lim_mod.loss_type_id = 13::numeric AND agg_ded_lim_mod.aggregate_type_id = 1::numeric) cc ON a.policy_id::numeric = cc.policy_id;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.ce_accounts OWNER TO mj_admin;
GO

Grant select on table p_and_c.ce_accounts to rl_pc_data_analyst;
GO

Grant select on table p_and_c.ce_accounts to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.ce_accounts to rpauser;
GO
GRANT SELECT ON p_and_c.ce_accounts to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.ce_accounts to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.ce_accounts to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.ce_accounts to rl_p_and_c_d;
GO