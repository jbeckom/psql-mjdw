CREATE OR REPLACE VIEW p_and_c.all_policies_cyb_bm
AS SELECT a.policy_id,
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
    a.value,
    a.occurrence_type_id,
    a.premium_1
   FROM ( SELECT a_1.policy_id,
            a_1.client_id,
            a_1.carrier_id,
            a_1.policy_number,
            a_1.coverage_type_id,
            a_1.policy_start_date,
            a_1.policy_end_date,
            a_1.premium,
            a_1.mod,
            a_1.aggregate_deductible,
            a_1.aggregate_limit,
            a_1.prev_policy_id,
            b_1.value,
            b_1.occurrence_type_id,
                CASE
                    WHEN a_1.premium IS NULL THEN 0::numeric
                    ELSE a_1.premium
                END AS premium_1
           FROM p_and_c.all_policies a_1
             LEFT JOIN p_and_c.occurrence_deductibles_limits b_1 ON a_1.policy_id::numeric = b_1.policy_id
          WHERE a_1.coverage_type_id::text = 'CYB'::text AND b_1.loss_type_id = 32::numeric) a
     LEFT JOIN ( SELECT a_1.policy_id,
            a_1.client_id,
            a_1.carrier_id,
            a_1.policy_number,
            a_1.coverage_type_id,
            a_1.policy_start_date,
            a_1.policy_end_date,
            a_1.premium,
            a_1.mod,
            a_1.aggregate_deductible,
            a_1.aggregate_limit,
            a_1.prev_policy_id,
            b_1.value,
            b_1.occurrence_type_id,
                CASE
                    WHEN a_1.premium IS NULL THEN 0::numeric
                    ELSE a_1.premium
                END AS premium_1
           FROM p_and_c.all_policies a_1
             LEFT JOIN p_and_c.occurrence_deductibles_limits b_1 ON a_1.policy_id::numeric = b_1.policy_id
          WHERE a_1.coverage_type_id::text = 'CYB'::text AND b_1.loss_type_id = 32::numeric) b ON a.client_id::text = b.client_id::text AND a.policy_start_date = b.policy_start_date AND a.occurrence_type_id = b.occurrence_type_id AND a.premium < b.premium
  WHERE b.premium IS NULL AND a.premium IS NOT NULL;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.all_policies_cyb_bm OWNER TO mj_admin;
GO

Grant select on table p_and_c.all_policies_cyb_bm to rl_pc_data_analyst;
GO

Grant select on table p_and_c.all_policies_cyb_bm to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.all_policies_cyb_bm to rpauser;
GO
GRANT SELECT ON p_and_c.all_policies_cyb_bm to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.all_policies_cyb_bm to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.all_policies_cyb_bm to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.all_policies_cyb_bm to rl_p_and_c_d;
GO