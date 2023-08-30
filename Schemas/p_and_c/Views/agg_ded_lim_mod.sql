CREATE OR REPLACE VIEW p_and_c.agg_ded_lim_mod
AS SELECT a_1.policy_id::numeric AS policy_id,
    a_1.aggregate_type_id::numeric AS aggregate_type_id,
    a_1.value::numeric AS value,
    a_1.loss_type_id::numeric AS loss_type_id
   FROM ( SELECT gl_coverages.policy_agency_id AS policy_id,
            '2'::text AS aggregate_type_id,
            gl_coverages.gen_aggregate AS value,
            '13'::text AS loss_type_id
           FROM sagitta.gl_coverages) a_1
  WHERE NOT (concat(a_1.policy_id, '-', a_1.aggregate_type_id) IN ( SELECT concat(lim_ded_mod_override.policy_id, '-', lim_ded_mod_override.aggregate_type_id) AS concat
           FROM p_and_c.lim_ded_mod_override))
UNION ALL
 SELECT
        CASE
            WHEN lim_ded_mod_override.policy_id_suff IS NOT NULL THEN concat(lim_ded_mod_override.policy_id, '000', lim_ded_mod_override.policy_id_suff)::bigint
            ELSE lim_ded_mod_override.policy_id
        END AS policy_id,
    lim_ded_mod_override.aggregate_type_id,
    lim_ded_mod_override.value,
    lim_ded_mod_override.loss_type_id
   FROM p_and_c.lim_ded_mod_override
  WHERE lim_ded_mod_override.aggregate_type_id IS NOT NULL;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.agg_ded_lim_mod OWNER TO mj_admin;
GO

Grant select on table p_and_c.agg_ded_lim_mod to rl_pc_data_analyst;
GO

Grant select on table p_and_c.agg_ded_lim_mod to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.agg_ded_lim_mod to rpauser;
GO
GRANT SELECT ON p_and_c.agg_ded_lim_mod to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.agg_ded_lim_mod to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.agg_ded_lim_mod to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.agg_ded_lim_mod to rl_p_and_c_d;
GO