CREATE OR REPLACE VIEW p_and_c.kickouts_nmic_loss_types
AS SELECT DISTINCT split_part(a.claim_number::text, '-'::text, 2) AS claim_number,
    NULL::text AS type_of_loss
   FROM p_and_c.normal_nmic a
     LEFT JOIN p_and_c.raw_nmic_supp b ON split_part(a.claim_number::text, '-'::text, 2) = b.claim_number::text
  WHERE b.claim_number IS NULL;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.kickouts_nmic_loss_types OWNER TO mj_admin;
GO

Grant select on table p_and_c.kickouts_nmic_loss_types to rl_pc_data_analyst;
GO

Grant select on table p_and_c.kickouts_nmic_loss_types to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.kickouts_nmic_loss_types to rpauser;
GO
GRANT SELECT ON p_and_c.kickouts_nmic_loss_types to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.kickouts_nmic_loss_types to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.kickouts_nmic_loss_types to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.kickouts_nmic_loss_types to rl_p_and_c_d;
GO