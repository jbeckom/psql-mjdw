CREATE OR REPLACE VIEW p_and_c.all_policies_zero
AS SELECT all_policies.policy_id,
    all_policies.client_id,
    all_policies.carrier_id,
    all_policies.policy_number,
    all_policies.coverage_type_id,
    all_policies.policy_start_date,
    all_policies.policy_end_date,
    all_policies.premium,
    all_policies.mod,
    all_policies.aggregate_deductible,
    all_policies.aggregate_limit,
    all_policies.prev_policy_id,
        CASE
            WHEN all_policies.premium IS NULL THEN 0::numeric
            ELSE all_policies.premium
        END AS premium_1
   FROM p_and_c.all_policies
  WHERE all_policies.policy_end_date > CURRENT_DATE AND all_policies.carrier_id::text <> '1000005'::text;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.all_policies_zero OWNER TO mj_admin;
GO

Grant select on table p_and_c.all_policies_zero to rl_pc_data_analyst;
GO

Grant select on table p_and_c.all_policies_zero to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.all_policies_zero to rpauser;
GO
GRANT SELECT ON p_and_c.all_policies_zero to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.all_policies_zero to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.all_policies_zero to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.all_policies_zero to rl_p_and_c_d;
GO