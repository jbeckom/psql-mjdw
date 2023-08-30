CREATE OR REPLACE VIEW p_and_c.kickouts_roseacr_machines
AS SELECT a.claim_number,
    a.description_text,
    a.claim_site,
    g.farm,
    g.department,
    a.occupation,
    a.claimant_name,
    a.loss_date,
    h.machine
   FROM p_and_c.all_claims_monthly a
     LEFT JOIN p_and_c.y_roseacr_locations g ON a.claim_site = g.code
     LEFT JOIN p_and_c.y_mapping_roseacr_machines h ON a.claim_number = h.claim_number
     where exists (
     select 1 
     FROM p_and_c.mapping_policies b 
     LEFT JOIN p_and_c.all_policies c ON b.policy_id = c.policy_id
     LEFT JOIN p_and_c.mapping_causes d ON a.carrier_cause = d.carrier_cause
     LEFT JOIN p_and_c.causes e ON d.cause_id = e.id
     LEFT JOIN p_and_c.cause_categories f ON e.cause_category_id = f.id
  WHERE f.description = 'Caught In, Under or Between'
  AND e.name = 'Machine or Machinery'
  AND c.client_id = 'ROSEACR'
  AND c.coverage_type_id = 'WCO'
  and a.carrier_policy_number = b.carrier_policy_number)
  AND h.machine IS null;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.kickouts_roseacr_machines OWNER TO mj_admin;
GO

Grant select on table p_and_c.kickouts_roseacr_machines to rl_pc_data_analyst;
GO

Grant select on table p_and_c.kickouts_roseacr_machines to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.kickouts_roseacr_machines to rpauser;
GO
GRANT SELECT ON p_and_c.kickouts_roseacr_machines to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.kickouts_roseacr_machines to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.kickouts_roseacr_machines to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.kickouts_roseacr_machines to rl_p_and_c_d;
GO