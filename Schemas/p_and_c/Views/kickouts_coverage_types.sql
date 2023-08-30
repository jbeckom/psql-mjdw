CREATE OR REPLACE VIEW p_and_c.kickouts_coverage_types
AS SELECT DISTINCT a.carrier_coverage_type,
    b.loss_type_id
   FROM p_and_c.all_claims_monthly a
     LEFT JOIN p_and_c.mapping_coverage_types b ON a.carrier_coverage_type::text = b.carrier_coverage_type
  WHERE b.loss_type_id IS NULL;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.kickouts_coverage_types OWNER TO mj_admin;
GO

Grant select on table p_and_c.kickouts_coverage_types to rl_pc_data_analyst;
GO

Grant select on table p_and_c.kickouts_coverage_types to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.kickouts_coverage_types to rpauser;
GO
GRANT SELECT ON p_and_c.kickouts_coverage_types to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.kickouts_coverage_types to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.kickouts_coverage_types to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.kickouts_coverage_types to rl_p_and_c_d;
GO