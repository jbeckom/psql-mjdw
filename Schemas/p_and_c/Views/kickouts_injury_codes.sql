CREATE OR REPLACE VIEW p_and_c.kickouts_injury_codes
AS SELECT DISTINCT a.carrier_injury_code,
    b.injury_code
   FROM p_and_c.all_claims_monthly a
     LEFT JOIN p_and_c.mapping_injury_codes b ON a.carrier_injury_code::text = b.carrier_injury_code::text
  WHERE b.injury_code IS NULL;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.kickouts_injury_codes OWNER TO mj_admin;
GO

Grant select on table p_and_c.kickouts_injury_codes to rl_pc_data_analyst;
GO

Grant select on table p_and_c.kickouts_injury_codes to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.kickouts_injury_codes to rpauser;
GO
GRANT SELECT ON p_and_c.kickouts_injury_codes to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.kickouts_injury_codes to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.kickouts_injury_codes to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.kickouts_injury_codes to rl_p_and_c_d;
GO