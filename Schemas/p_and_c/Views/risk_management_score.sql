CREATE OR REPLACE VIEW p_and_c.risk_management_score
AS SELECT DISTINCT a.company_name,
    c.id::text AS id,
    a.completion_date,
    concat(((a.yes0 + a.yes1 + a.yes2)::numeric + (a.assessments::numeric(2,1) + a.audits::numeric(2,1) + a.standards::numeric(2,1) + a.maturity_model::numeric(2,1) + a.registers::numeric(2,1)) / 2::numeric + a.yes4::numeric + a.yes5::numeric + (a.claim_reviews::numeric(2,1) + a.preferred_medical_providers::numeric(2,1) + a.rtw::numeric(2,1) + a.root_cause_analysis::numeric(2,1) + a.special_handling_instructions::numeric(2,1)) / 2::numeric)::numeric(2,1), '/10') AS risk_management_score
   FROM p_and_c.tier_1_answers a
     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
     LEFT JOIN p_and_c.clients c ON b.client_id::text = c.id::text;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.risk_management_score OWNER TO mj_admin;
GO

Grant select on table p_and_c.risk_management_score to rl_pc_data_analyst;
GO

Grant select on table p_and_c.risk_management_score to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.risk_management_score to rpauser;
GO
GRANT SELECT ON p_and_c.risk_management_score to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.risk_management_score to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.risk_management_score to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.risk_management_score to rl_p_and_c_d;
GO