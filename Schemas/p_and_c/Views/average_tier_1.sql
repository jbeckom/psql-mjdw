CREATE OR REPLACE VIEW p_and_c.average_tier_1
AS SELECT avg(tier_1_results.score) AS avg,
    stddev(tier_1_results.score) AS stddev
   FROM p_and_c.tier_1_results
  WHERE tier_1_results.category = 'Overall'::text AND tier_1_results.client_id::text <> 'DEMO123'::text;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.average_tier_1 OWNER TO mj_admin;
GO

Grant select on table p_and_c.average_tier_1 to rl_pc_data_analyst;
GO

Grant select on table p_and_c.average_tier_1 to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.average_tier_1 to rpauser;
GO
GRANT SELECT ON p_and_c.average_tier_1 to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.average_tier_1 to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.average_tier_1 to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.average_tier_1 to rl_p_and_c_d;
GO