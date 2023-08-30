CREATE OR REPLACE VIEW p_and_c.kickouts_body_parts
AS SELECT DISTINCT a.carrier_body_part,
    b.body_part_id
   FROM p_and_c.all_claims_monthly a
     LEFT JOIN p_and_c.mapping_body_parts b ON a.carrier_body_part::text = b.carrier_body_part
     WHERE EXISTS (
      SELECT 1
      FROM p_and_c.mapping_coverage_types c 
     LEFT JOIN p_and_c.loss_types d ON c.loss_type_id = d.id
  WHERE b.body_part_id IS NULL 
  AND d.coverage_type_major = 'Workers'' Comp'::text 
  AND a.carrier_body_part::text <> ''::text
  AND a.carrier_coverage_type::text = c.carrier_coverage_type);
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.kickouts_body_parts OWNER TO mj_admin;
GO

Grant select on table p_and_c.kickouts_body_parts to rl_pc_data_analyst;
GO

Grant select on table p_and_c.kickouts_body_parts to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.kickouts_body_parts to rpauser;
GO
GRANT SELECT ON p_and_c.kickouts_body_parts to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.kickouts_body_parts to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.kickouts_body_parts to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.kickouts_body_parts to rl_p_and_c_d;
GO