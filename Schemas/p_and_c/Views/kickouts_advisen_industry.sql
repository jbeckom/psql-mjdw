CREATE OR REPLACE VIEW p_and_c.kickouts_advisen_industry
AS SELECT DISTINCT a.industry,
    a.industry_name,
    b.advisen_industry
   FROM p_and_c.advisen_bm_requests a
     LEFT JOIN p_and_c.mapping_advisen_industry b ON a.industry = b.industry_id::text
  WHERE b.advisen_industry IS NULL AND a.industry <> ''::text AND a.industry IS NOT NULL;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.kickouts_advisen_industry OWNER TO mj_admin;
GO

Grant select on table p_and_c.kickouts_advisen_industry to rl_pc_data_analyst;
GO

Grant select on table p_and_c.kickouts_advisen_industry to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.kickouts_advisen_industry to rpauser;
GO
GRANT SELECT ON p_and_c.kickouts_advisen_industry to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.kickouts_advisen_industry to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.kickouts_advisen_industry to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.kickouts_advisen_industry to rl_p_and_c_d;
GO