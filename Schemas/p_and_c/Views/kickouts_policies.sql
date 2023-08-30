CREATE OR REPLACE VIEW p_and_c.kickouts_policies
AS SELECT DISTINCT a.carrier_policy_number,
    b.policy_id
   FROM p_and_c.all_claims_monthly a
     LEFT JOIN p_and_c.mapping_policies b ON a.carrier_policy_number::text = b.carrier_policy_number::text
  WHERE b.policy_id IS NULL;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.kickouts_policies OWNER TO mj_admin;
GO

Grant select on table p_and_c.kickouts_policies to rl_pc_data_analyst;
GO

Grant select on table p_and_c.kickouts_policies to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.kickouts_policies to rpauser;
GO
GRANT SELECT ON p_and_c.kickouts_policies to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.kickouts_policies to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.kickouts_policies to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.kickouts_policies to rl_p_and_c_d;
GO