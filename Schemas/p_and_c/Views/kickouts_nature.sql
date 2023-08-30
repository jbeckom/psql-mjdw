CREATE OR REPLACE VIEW p_and_c.kickouts_nature
AS SELECT DISTINCT a.carrier_nature,
    b.nature_id
   FROM p_and_c.all_claims_monthly a
     LEFT JOIN p_and_c.mapping_nature b ON a.carrier_nature::text = b.carrier_nature
     WHERE EXISTS (
      SELECT 1
      FROM p_and_c.mapping_coverage_types c 
     LEFT JOIN p_and_c.loss_types d ON c.loss_type_id = d.id
  WHERE b.nature_id IS NULL AND d.coverage_type_major = 'Workers'' Comp'::text
  AND a.carrier_coverage_type::text = c.carrier_coverage_type);
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.kickouts_nature OWNER TO mj_admin;
GO

Grant select on table p_and_c.kickouts_nature to rl_pc_data_analyst;
GO

Grant select on table p_and_c.kickouts_nature to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.kickouts_nature to rpauser;
GO
GRANT SELECT ON p_and_c.kickouts_nature to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.kickouts_nature to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.kickouts_nature to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.kickouts_nature to rl_p_and_c_d;
GO