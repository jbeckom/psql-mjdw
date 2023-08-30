CREATE OR REPLACE VIEW p_and_c.all_policies
AS SELECT a.sagitem AS policy_id,
    COALESCE(h.client_id, b.client_cd::character varying) AS client_id,
    COALESCE(h.carrier_id, c.insurer_cd::character varying) AS carrier_id,
    COALESCE(h.policy_number, a.policy_number::character varying) AS policy_number,
    COALESCE(h.coverage_type_id, d.coverage_cd::character varying) AS coverage_type_id,
    COALESCE(h.policy_start_date, '1967-12-31'::date + a.policy_effective_dt::integer) AS policy_start_date,
    COALESCE(h.policy_end_date, '1967-12-31'::date + a.policy_expiration_dt) AS policy_end_date,
    COALESCE(h.premium,
        CASE
            WHEN a.bill_type_cd = 'A'::text THEN COALESCE(a.annual_premium_amt::numeric, a.est_prem_amt::numeric / 100::numeric)
            ELSE
            CASE
                WHEN ('1967-12-31'::date + a.policy_expiration_dt) > CURRENT_DATE THEN a.est_prem_amt::numeric / 100::numeric
                ELSE COALESCE(a.annual_premium_amt::numeric, a.est_prem_amt::numeric / 100::numeric)
            END
        END) AS premium,
    e.value AS mod,
    f.value AS aggregate_deductible,
    g.value AS aggregate_limit,
    a.previous_policy_id::bigint AS prev_policy_id,
    h.captive_freq_fund,
    h.captive_sev_fund,
    h.retro_min_premium,
    h.retro_max_premium,
    h.retro_loss_factor,
    h.retro_tax_multiplier,
    h.captive_risk_sharing_inc,
    h.captive_assessments
   FROM sagitta.policies a
     LEFT JOIN sagitta.clients b ON a.client_cd = b.sagitem
     LEFT JOIN sagitta.insurors c ON a.insurer_name::integer = c.sagitem
     LEFT JOIN sagitta.coverages d ON a.coverage_cd = d.sagitem
     LEFT JOIN ( SELECT agg_ded_lim_mod.policy_id,
            agg_ded_lim_mod.aggregate_type_id,
            agg_ded_lim_mod.value,
            agg_ded_lim_mod.loss_type_id
           FROM p_and_c.agg_ded_lim_mod
          WHERE agg_ded_lim_mod.aggregate_type_id = '3'::numeric) e ON a.sagitem::numeric = e.policy_id
     LEFT JOIN ( SELECT agg_ded_lim_mod.policy_id,
            agg_ded_lim_mod.aggregate_type_id,
            agg_ded_lim_mod.value,
            agg_ded_lim_mod.loss_type_id
           FROM p_and_c.agg_ded_lim_mod
          WHERE agg_ded_lim_mod.aggregate_type_id = '1'::numeric) f ON a.sagitem::numeric = f.policy_id
     LEFT JOIN ( SELECT agg_ded_lim_mod.policy_id,
            agg_ded_lim_mod.aggregate_type_id,
            agg_ded_lim_mod.value,
            agg_ded_lim_mod.loss_type_id
           FROM p_and_c.agg_ded_lim_mod
          WHERE agg_ded_lim_mod.aggregate_type_id = '2'::numeric) g ON a.sagitem::numeric = g.policy_id
     LEFT JOIN ( SELECT all_policies_override.policy_id,
            all_policies_override.policy_id_suff,
            all_policies_override.client_id,
            all_policies_override.carrier_id,
            all_policies_override.policy_number,
            all_policies_override.coverage_type_id,
            all_policies_override.premium,
            all_policies_override.policy_start_date,
            all_policies_override.policy_end_date,
            all_policies_override.prev_policy_id,
            all_policies_override.captive_freq_fund,
            all_policies_override.captive_sev_fund,
            all_policies_override.retro_min_premium,
            all_policies_override.retro_max_premium,
            all_policies_override.retro_loss_factor,
            all_policies_override.retro_tax_multiplier,
            all_policies_override.captive_risk_sharing_inc,
            all_policies_override.captive_assessments
           FROM p_and_c.all_policies_override
          WHERE all_policies_override.policy_id_suff IS NULL) h ON a.sagitem = h.policy_id
  WHERE ('1967-12-31'::date + a.policy_effective_dt::integer) >= '2014-01-01'::date AND ("left"(a.department_cd, 2) = ANY (ARRAY['01'::text, '21'::text])) AND c.insurer_cd <> 'MKT'::text AND a.policy_number !~~* '%app%'::text AND NOT (a.sagitem IN ( SELECT all_policies_override.policy_id
           FROM p_and_c.all_policies_override))
UNION
 SELECT
        CASE
            WHEN a.policy_id_suff IS NULL THEN a.policy_id::bigint
            ELSE concat(a.policy_id, '000', a.policy_id_suff)::bigint
        END AS policy_id,
    COALESCE(a.client_id, h.client_cd::character varying) AS client_id,
    COALESCE(a.carrier_id, c.insurer_cd::character varying) AS carrier_id,
    COALESCE(a.policy_number, b.policy_number::character varying) AS policy_number,
    COALESCE(a.coverage_type_id, d.coverage_cd::character varying) AS coverage_type_id,
    COALESCE(a.policy_start_date, '1967-12-31'::date + b.policy_effective_dt::integer) AS policy_start_date,
    COALESCE(a.policy_end_date, '1967-12-31'::date + b.policy_expiration_dt) AS policy_end_date,
    COALESCE(a.premium,
        CASE
            WHEN b.bill_type_cd = 'A'::text THEN COALESCE(b.annual_premium_amt::numeric, b.est_prem_amt::numeric / 100::numeric)
            ELSE
            CASE
                WHEN ('1967-12-31'::date + b.policy_expiration_dt) > CURRENT_DATE THEN b.est_prem_amt::numeric / 100::numeric
                ELSE COALESCE(b.annual_premium_amt::numeric, b.est_prem_amt::numeric / 100::numeric)
            END
        END) AS premium,
    e.value AS mod,
    f.value AS aggregate_deductible,
    g.value AS aggregate_limit,
    COALESCE(a.prev_policy_id, b.previous_policy_id::bigint) AS prev_policy_id,
    a.captive_freq_fund,
    a.captive_sev_fund,
    a.retro_min_premium,
    a.retro_max_premium,
    a.retro_loss_factor,
    a.retro_tax_multiplier,
    a.captive_risk_sharing_inc,
    a.captive_assessments
   FROM p_and_c.all_policies_override a
     LEFT JOIN sagitta.policies b ON a.policy_id = b.sagitem
     LEFT JOIN sagitta.insurors c ON b.insurer_name::integer = c.sagitem
     LEFT JOIN sagitta.coverages d ON b.coverage_cd = d.sagitem
     LEFT JOIN sagitta.clients h ON b.client_cd = h.sagitem
     LEFT JOIN ( SELECT agg_ded_lim_mod.policy_id,
            agg_ded_lim_mod.aggregate_type_id,
            agg_ded_lim_mod.value,
            agg_ded_lim_mod.loss_type_id
           FROM p_and_c.agg_ded_lim_mod
          WHERE agg_ded_lim_mod.aggregate_type_id = '3'::numeric) e ON (( SELECT
                CASE
                    WHEN a.policy_id_suff IS NULL THEN a.policy_id::bigint
                    ELSE concat(a.policy_id, '000', a.policy_id_suff)::bigint
                END AS policy_id))::numeric = e.policy_id
     LEFT JOIN ( SELECT agg_ded_lim_mod.policy_id,
            agg_ded_lim_mod.aggregate_type_id,
            agg_ded_lim_mod.value,
            agg_ded_lim_mod.loss_type_id
           FROM p_and_c.agg_ded_lim_mod
          WHERE agg_ded_lim_mod.aggregate_type_id = '1'::numeric) f ON (( SELECT
                CASE
                    WHEN a.policy_id_suff IS NULL THEN a.policy_id::bigint
                    ELSE concat(a.policy_id, '000', a.policy_id_suff)::bigint
                END AS policy_id))::numeric = f.policy_id
     LEFT JOIN ( SELECT agg_ded_lim_mod.policy_id,
            agg_ded_lim_mod.aggregate_type_id,
            agg_ded_lim_mod.value,
            agg_ded_lim_mod.loss_type_id
           FROM p_and_c.agg_ded_lim_mod
          WHERE agg_ded_lim_mod.aggregate_type_id = '2'::numeric) g ON (( SELECT
                CASE
                    WHEN a.policy_id_suff IS NULL THEN a.policy_id::bigint
                    ELSE concat(a.policy_id, '000', a.policy_id_suff)::bigint
                END AS policy_id))::numeric = g.policy_id
  WHERE COALESCE(a.policy_start_date, '1967-12-31'::date + b.policy_effective_dt::integer) >= '2014-01-01'::date;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.all_policies OWNER TO mj_admin;
GO

Grant select on table p_and_c.all_policies to rl_pc_data_analyst;
GO

Grant select on table p_and_c.all_policies to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.all_policies to rpauser;
GO
GRANT SELECT ON p_and_c.all_policies to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.all_policies to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.all_policies to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.all_policies to rl_p_and_c_d;
GO