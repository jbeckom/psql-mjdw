CREATE OR REPLACE VIEW p_and_c.occurrence_deductibles_limits
AS SELECT a.policy_id::numeric AS policy_id,
    a.occurrence_type_id::numeric AS occurrence_type_id,
    a.value::numeric AS value,
    a.loss_type_id::numeric AS loss_type_id
   FROM ( SELECT gl_coverages.policy_agency_id AS policy_id,
            '2'::text AS occurrence_type_id,
            gl_coverages.each_occurrence AS value,
            '13'::text AS loss_type_id
           FROM sagitta.gl_coverages
        UNION ALL
         SELECT gl_coverages.policy_agency_id AS policy_id,
            '1'::text AS occurrence_type_id,
            gl_coverages.deductible AS value,
                CASE
                    WHEN gl_coverages.ded_basis_cd = 'O'::text THEN '13'::text
                    ELSE
                    CASE
                        WHEN gl_coverages.ded_basis_cd = 'P'::text THEN '8'::text
                        ELSE
                        CASE
                            WHEN gl_coverages.ded_basis_cd = 'B'::text THEN '9'::text
                            ELSE
                            CASE
                                WHEN gl_coverages.ded_basis_cd IS NULL THEN '13'::text
                                ELSE NULL::text
                            END
                        END
                    END
                END AS loss_type_id
           FROM sagitta.gl_coverages
        UNION ALL
         SELECT ba_coverages.policy_agency_id AS policy_id,
            '2'::text AS occurrence_type_id,
                CASE
                    WHEN ba_coverages.liability_1_limit IS NULL THEN ba_coverages.liability_2_limit
                    ELSE ba_coverages.liability_1_limit
                END AS value,
            '12'::text AS loss_type_id
           FROM sagitta.ba_coverages
        UNION ALL
         SELECT ba_coverages.policy_agency_id AS policy_id,
            '2'::text AS occurrence_type_id,
                CASE
                    WHEN ba_coverages.underinsured_motorist_1_limit IS NULL THEN ba_coverages.underinsured_motorist_2_limit
                    ELSE ba_coverages.underinsured_motorist_1_limit
                END AS value,
            '7'::text AS loss_type_id
           FROM sagitta.ba_coverages
        UNION ALL
         SELECT ba_coverages.policy_agency_id AS policy_id,
            '1'::text AS occurrence_type_id,
                CASE
                    WHEN ba_coverages.liability_deductible_amt IS NULL THEN '0'::text
                    ELSE ba_coverages.liability_deductible_amt
                END AS value,
            '12'::text AS loss_type_id
           FROM sagitta.ba_coverages
        UNION ALL
         SELECT ba_coverages.policy_agency_id AS policy_id,
            '1'::text AS occurrence_type_id,
                CASE
                    WHEN ba_coverages.comprehensive_deductible_amt IS NULL THEN '0'::text
                    ELSE ba_coverages.comprehensive_deductible_amt
                END AS value,
            '4'::text AS loss_type_id
           FROM sagitta.ba_coverages
        UNION ALL
         SELECT ba_coverages.policy_agency_id AS policy_id,
            '1'::text AS occurrence_type_id,
                CASE
                    WHEN ba_coverages.collision_deductible_amt IS NULL THEN '0'::text
                    ELSE ba_coverages.collision_deductible_amt
                END AS value,
            '3'::text AS loss_type_id
           FROM sagitta.ba_coverages) a
  WHERE NOT (concat(a.policy_id, '-', a.occurrence_type_id, '-', a.loss_type_id) IN ( SELECT concat(lim_ded_mod_override.policy_id, '-', lim_ded_mod_override.occurrence_type_id, '-', lim_ded_mod_override.loss_type_id) AS concat
           FROM p_and_c.lim_ded_mod_override))
UNION ALL
 SELECT
        CASE
            WHEN lim_ded_mod_override.policy_id_suff IS NOT NULL THEN concat(lim_ded_mod_override.policy_id, '000', lim_ded_mod_override.policy_id_suff)::bigint
            ELSE lim_ded_mod_override.policy_id
        END AS policy_id,
    lim_ded_mod_override.occurrence_type_id,
    lim_ded_mod_override.value,
    lim_ded_mod_override.loss_type_id
   FROM p_and_c.lim_ded_mod_override
  WHERE lim_ded_mod_override.occurrence_type_id IS NOT NULL;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.occurrence_deductibles_limits OWNER TO mj_admin;
GO

Grant select on table p_and_c.occurrence_deductibles_limits to rl_pc_data_analyst;
GO

Grant select on table p_and_c.occurrence_deductibles_limits to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.occurrence_deductibles_limits to rpauser;
GO
GRANT SELECT ON p_and_c.occurrence_deductibles_limits to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.occurrence_deductibles_limits to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.occurrence_deductibles_limits to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.occurrence_deductibles_limits to rl_p_and_c_d;
GO