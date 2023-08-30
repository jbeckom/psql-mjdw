CREATE OR REPLACE VIEW p_and_c.average_tier_2_cyber
AS SELECT tier_2_cyber_results.section AS "group",
    avg(tier_2_cyber_results."Score") AS avg,
        CASE
            WHEN stddev(tier_2_cyber_results."Score") = 0::numeric THEN 0.01
            ELSE stddev(tier_2_cyber_results."Score")
        END AS stddev
   FROM p_and_c.tier_2_cyber_results
  WHERE tier_2_cyber_results."Category" IS NULL
  GROUP BY tier_2_cyber_results.section
UNION ALL
 SELECT tier_2_cyber_results."Category" AS "group",
    avg(tier_2_cyber_results."Score") AS avg,
        CASE
            WHEN stddev(tier_2_cyber_results."Score") = 0::numeric THEN 0.01
            ELSE stddev(tier_2_cyber_results."Score")
        END AS stddev
   FROM p_and_c.tier_2_cyber_results
  WHERE tier_2_cyber_results.type IS NULL AND tier_2_cyber_results."Category" IS NOT NULL
  GROUP BY tier_2_cyber_results."Category"
UNION ALL
 SELECT tier_2_cyber_results.type AS "group",
    avg(tier_2_cyber_results."Score") AS avg,
        CASE
            WHEN stddev(tier_2_cyber_results."Score") = 0::numeric THEN 0.01
            ELSE stddev(tier_2_cyber_results."Score")
        END AS stddev
   FROM p_and_c.tier_2_cyber_results
  WHERE tier_2_cyber_results.type IS NOT NULL
  GROUP BY tier_2_cyber_results.type;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.average_tier_2_cyber OWNER TO mj_admin;
GO

Grant select on table p_and_c.average_tier_2_cyber to rl_pc_data_analyst;
GO

Grant select on table p_and_c.average_tier_2_cyber to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.average_tier_2_cyber to rpauser;
GO
GRANT SELECT ON p_and_c.average_tier_2_cyber to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.average_tier_2_cyber to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.average_tier_2_cyber to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.average_tier_2_cyber to rl_p_and_c_d;
GO