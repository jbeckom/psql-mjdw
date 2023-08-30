CREATE OR REPLACE VIEW p_and_c.kickouts_advisen_rpt_industry
AS SELECT DISTINCT a.industries,
    b.sic_id_2,
    b.sic_category_id
   FROM p_and_c.benchmarking_report a
     LEFT JOIN p_and_c.mapping_advisen_rpt_industry b ON a.industries::text = b.advisen_rpt_industry::text
  WHERE b.advisen_rpt_industry IS NULL AND a.industries::text <> ''::text AND a.industries IS NOT NULL;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.kickouts_advisen_rpt_industry OWNER TO mj_admin;
GO

Grant select on table p_and_c.kickouts_advisen_rpt_industry to rl_pc_data_analyst;
GO

Grant select on table p_and_c.kickouts_advisen_rpt_industry to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.kickouts_advisen_rpt_industry to rpauser;
GO
GRANT SELECT ON p_and_c.kickouts_advisen_rpt_industry to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.kickouts_advisen_rpt_industry to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.kickouts_advisen_rpt_industry to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.kickouts_advisen_rpt_industry to rl_p_and_c_d;
GO