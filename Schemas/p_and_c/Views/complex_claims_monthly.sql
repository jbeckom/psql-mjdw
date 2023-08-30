CREATE OR REPLACE VIEW p_and_c.complex_claims_monthly
AS SELECT a.client,
    a.claimant,
    a.loss_date,
    split_part(a.claim_number::text, '-'::text, 1) AS carrier_code,
    split_part(a.claim_number::text, '-'::text, 2) AS claim_number,
    a.claims_cons_email,
    a.claim_total,
    a.expense,
    a.paid_indemnity,
    a.reserve_indemnity,
    a.paid_medical,
    a.reserve_medical,
    a.subrogation,
    a.litigation,
        CASE
            WHEN (a.claim_total - b.claim_total) IS NULL THEN 0::numeric
            ELSE a.claim_total - b.claim_total
        END AS claim_total_mom,
        CASE
            WHEN (a.expense - b.expense) IS NULL THEN 0::numeric
            ELSE a.expense - b.expense
        END AS expense_mom,
        CASE
            WHEN (a.paid_indemnity - b.paid_indemnity) IS NULL THEN 0::numeric
            ELSE a.paid_indemnity - b.paid_indemnity
        END AS paid_indemnity_mom,
        CASE
            WHEN (a.reserve_indemnity - b.reserve_indemnity) IS NULL THEN 0::numeric
            ELSE a.reserve_indemnity - b.reserve_indemnity
        END AS reserve_indemnity_mom,
        CASE
            WHEN (a.paid_medical - b.paid_medical) IS NULL THEN 0::numeric
            ELSE a.paid_medical - b.paid_medical
        END AS paid_medical_mom,
        CASE
            WHEN (a.reserve_medical - b.reserve_medical) IS NULL THEN 0::numeric
            ELSE a.reserve_medical - b.reserve_medical
        END AS reserve_medical_mom,
        CASE
            WHEN (a.subrogation - b.subrogation) IS NULL THEN 0::numeric
            ELSE a.subrogation - b.subrogation
        END AS subrogation_mom,
        CASE
            WHEN a.litigation::text = 'Yes'::text AND b.litigation::text <> 'Yes'::text THEN 'Yes'::text
            ELSE 'No'::text
        END AS new_litigation,
        CASE
            WHEN b.claim_number IS NULL THEN 'Yes'::text
            ELSE 'No'::text
        END AS new_claim
   FROM ( SELECT severe_claims_trigger.client,
            severe_claims_trigger.claimant,
            severe_claims_trigger.loss_date,
            severe_claims_trigger.claim_number,
            severe_claims_trigger.claims_cons_email,
            severe_claims_trigger.claim_total,
            severe_claims_trigger.expense,
            severe_claims_trigger.paid_indemnity,
            severe_claims_trigger.reserve_indemnity,
            severe_claims_trigger.paid_medical,
            severe_claims_trigger.reserve_medical,
            severe_claims_trigger.subrogation,
            severe_claims_trigger.litigation,
            severe_claims_trigger.uploaded_at
           FROM p_and_c.severe_claims_trigger
          WHERE severe_claims_trigger.uploaded_at >= (CURRENT_DATE - 15)) a
     LEFT JOIN ( SELECT severe_claims_trigger.client,
            severe_claims_trigger.claimant,
            severe_claims_trigger.loss_date,
            severe_claims_trigger.claim_number,
            severe_claims_trigger.claims_cons_email,
            severe_claims_trigger.claim_total,
            severe_claims_trigger.expense,
            severe_claims_trigger.paid_indemnity,
            severe_claims_trigger.reserve_indemnity,
            severe_claims_trigger.paid_medical,
            severe_claims_trigger.reserve_medical,
            severe_claims_trigger.subrogation,
            severe_claims_trigger.litigation,
            severe_claims_trigger.uploaded_at
           FROM p_and_c.severe_claims_trigger
          WHERE severe_claims_trigger.uploaded_at < (CURRENT_DATE - 15) AND severe_claims_trigger.uploaded_at >= (CURRENT_DATE - 45)) b ON a.claim_number::text = b.claim_number::text AND a.claimant::text = b.claimant::text;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.complex_claims_monthly OWNER TO mj_admin;
GO

Grant select on table p_and_c.complex_claims_monthly to rl_pc_data_analyst;
GO

Grant select on table p_and_c.complex_claims_monthly to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.complex_claims_monthly to rpauser;
GO
GRANT SELECT ON p_and_c.complex_claims_monthly to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.complex_claims_monthly to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.complex_claims_monthly to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.complex_claims_monthly to rl_p_and_c_d;
GO