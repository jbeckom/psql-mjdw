CREATE OR REPLACE VIEW p_and_c.average_tier_2_safety
AS SELECT COALESCE(tier_2_safety_results.category, tier_2_safety_results.section) AS "group",
    avg(tier_2_safety_results.score) AS avg,
        CASE
            WHEN stddev(tier_2_safety_results.score) = 0::numeric THEN 0.01
            ELSE stddev(tier_2_safety_results.score)
        END AS stddev
   FROM p_and_c.tier_2_safety_results
  WHERE tier_2_safety_results.type IS NULL
  GROUP BY (COALESCE(tier_2_safety_results.category, tier_2_safety_results.section));
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.average_tier_2_safety OWNER TO mj_admin;
GO

Grant select on table p_and_c.average_tier_2_safety to rl_pc_data_analyst;
GO

Grant select on table p_and_c.average_tier_2_safety to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.average_tier_2_safety to rpauser;
GO
GRANT SELECT ON p_and_c.average_tier_2_safety to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.average_tier_2_safety to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.average_tier_2_safety to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.average_tier_2_safety to rl_p_and_c_d;
GO