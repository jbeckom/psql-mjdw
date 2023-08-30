CREATE OR REPLACE VIEW p_and_c.kickouts_avis_subsidiaries
AS SELECT a.claim_number,
    a.claim_site
   FROM p_and_c.all_claims_monthly a
   WHERE EXISTS (
    SELECT 1
    FROM p_and_c.mapping_subsidiary_locations b
     LEFT JOIN p_and_c.mapping_policies c ON a.carrier_policy_number::text = c.carrier_policy_number::text
     LEFT JOIN p_and_c.all_policies d ON c.policy_id = d.policy_id
     where a.claim_site::text = b.location
  	AND d.client_id::text = 'AVISIND'::text AND d.coverage_type_id::text = 'WCO'::text AND b.subsidiary_id IS null);
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.kickouts_avis_subsidiaries OWNER TO mj_admin;
GO

Grant select on table p_and_c.kickouts_avis_subsidiaries to rl_pc_data_analyst;
GO

Grant select on table p_and_c.kickouts_avis_subsidiaries to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.kickouts_avis_subsidiaries to rpauser;
GO
GRANT SELECT ON p_and_c.kickouts_avis_subsidiaries to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.kickouts_avis_subsidiaries to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.kickouts_avis_subsidiaries to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.kickouts_avis_subsidiaries to rl_p_and_c_d;
GO