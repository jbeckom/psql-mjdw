CREATE OR REPLACE VIEW p_and_c.normal_claims_other
AS SELECT DISTINCT concat(a.carrier_id, '-', a.claim_number)::character varying(256) AS claim_number,
    a.claim_number AS occurrence_number,
    a.claimant_number,
    a.paid_expense,
    a.reserve_expense,
    a.paid_indemnity,
    a.paid_medical,
    a.reserve_indemnity,
    a.reserve_medical,
    a.subrogation,
    a.reimbursed,
    a.claim_status,
    a.description_text,
    a.claim_address_1,
    a.claim_address_2,
    a.claim_city,
    a.claim_state,
    a.claim_zip,
    a.claim_site,
        CASE
            WHEN a.benefit_state IS NULL THEN a.claim_state
            ELSE a.benefit_state
        END AS benefit_state,
        CASE
            WHEN a.garage_state IS NULL THEN a.claim_state
            ELSE a.garage_state
        END AS garage_state,
    a.occupation,
    a.class_code,
    a.claimant_name,
        CASE
            WHEN a.claimant_first IS NULL THEN split_part(a.claimant_name::text, ' '::text, 2)::character varying
            ELSE a.claimant_first
        END AS claimant_first,
        CASE
            WHEN a.claimant_middle IS NULL THEN split_part(a.claimant_name::text, ' '::text, 3)::character varying
            ELSE a.claimant_middle
        END AS claimant_middle,
        CASE
            WHEN a.claimant_last IS NULL THEN replace(split_part(a.claimant_name::text, ' '::text, 1), ','::text, ''::text)::character varying
            ELSE a.claimant_last
        END AS claimant_last,
        CASE
            WHEN a.driver_first IS NULL THEN split_part(a.claimant_name::text, ' '::text, 2)::character varying
            ELSE a.driver_first
        END AS driver_first,
        CASE
            WHEN a.driver_middle IS NULL THEN split_part(a.claimant_name::text, ' '::text, 3)::character varying
            ELSE a.driver_middle
        END AS driver_middle,
        CASE
            WHEN a.driver_last IS NULL THEN replace(split_part(a.claimant_name::text, ' '::text, 1), ','::text, ''::text)::character varying
            ELSE a.driver_last
        END AS driver_last,
    a.loss_date,
    a.loss_time,
    a.report_date,
    a.closed_date,
    a.reopen_date,
    a.litigation,
    a.days_employed,
    a.claimant_gender,
    a.claimant_age,
    a.claimant_shift,
    a.claimant_supervisor,
    a.body_part AS carrier_body_part,
    a.cause AS carrier_cause,
    concat(a.carrier_id, ' - ', a.line_of_coverage, ' - ', a.coverage_type)::character varying(256) AS carrier_coverage_type,
    a.nature::text AS carrier_nature,
    a.injury_code AS carrier_injury_code,
    concat(a.carrier_id, ' - ', a.insured_name, ' - ', a.policy_number, ' - ', a.line_of_coverage, ' - ', a.policy_start_date)::character varying(256) AS carrier_policy_number,
    'raw_claims_other'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256)
   FROM p_and_c.raw_claims_other a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_claims_other OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_claims_other to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_claims_other to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_claims_other to rpauser;
GO
GRANT SELECT ON p_and_c.normal_claims_other to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_claims_other to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_claims_other to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_claims_other to rl_p_and_c_d;
GO