CREATE OR REPLACE VIEW p_and_c.normal_allianz_2021
AS SELECT DISTINCT concat('ALLIANZ', '-', a.claim_number)::character varying(256) AS claim_number,
    a.claim_number AS occurrence_number,
    a.occurrence_number AS claimant_number,
    ((a.expenses_paid::numeric + a.recovery_exp_paid::numeric))::character varying(256) AS paid_expense,
    a.expenses_reserves AS resrve_expense,
    a.indemnity_paid AS paid_indemnity,
    '0.00'::text AS paid_medical,
    a.indemnity_reserves AS reserve_indemnity,
    '0.00'::character varying(256) AS reserve_medical,
    a.recovery_paid AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
        CASE
            WHEN a.status::text = 'O'::text THEN 'Open'::text
            ELSE 'Closed'::text
        END AS claim_status,
    a.claim_description AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    ''::character varying(256) AS claim_state,
    ''::character varying(256) AS claim_zip,
    ''::character varying(256) AS claim_site,
    ''::character varying(256) AS benefit_state,
    ''::character varying(256) AS garage_state,
    ''::character varying(256) AS occupation,
    ''::character varying(256) AS class_code,
    a.claimant_name,
    ''::character varying(256) AS claimant_first,
    ''::character varying(256) AS claimant_middle,
    a.claimant_name AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    a.accident_date AS loss_date,
    ''::character varying(256) AS loss_time,
    ''::character varying(256) AS report_date,
    ''::character varying(256) AS closed_date,
    ''::character varying(256) AS reopen_date,
    ''::character varying(256) AS litigation,
    ''::character varying(256) AS days_employed,
    ''::character varying(256) AS claimant_gender,
    ''::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    ''::character varying(256) AS carrier_body_part,
    ''::character varying(256) AS carrier_cause,
    ''::character varying(256) AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat('ALLIANZ', ' - ', a.insured, ' - ', a.policy_number, ' - ', a.policy_effective_date)::character varying(256) AS carrier_policy_number,
    'raw_allianz_2021'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_allianz_2021 a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_allianz_2021 OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_allianz_2021 to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_allianz_2021 to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_allianz_2021 to rpauser;
GO
GRANT SELECT ON p_and_c.normal_allianz_2021 to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_allianz_2021 to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_allianz_2021 to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_allianz_2021 to rl_p_and_c_d;
GO