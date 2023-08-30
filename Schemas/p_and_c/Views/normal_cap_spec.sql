   CREATE OR REPLACE VIEW p_and_c.normal_cap_spec
AS SELECT DISTINCT concat('CAP_SPEC', '-', a.claim_number)::character varying(256) AS claim_number,
    a.claim_number AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    '0.00'::character varying(256) AS paid_expense,
    '0.00'::character varying(256) AS reserve_expense,
    a.paid AS paid_indemnity,
    '0.00'::character varying(256) AS paid_medical,
    a.reserve AS reserve_indemnity,
    '0.00'::character varying(256) AS reserve_medical,
    a.recoveries AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
        CASE
            WHEN split_part(a.status::text, ' '::text, 1)::character varying(256)::text = 'Re-Opened'::text THEN 'Reopen'::character varying(256)
            ELSE split_part(a.status::text, ' '::text, 1)::character varying(256)
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
        CASE
            WHEN a.claimant_name::text ~~ '% % %'::text AND a.claimant_name::text !~~ '%;%'::text THEN ''::character varying(256)::text
            ELSE split_part(a.claimant_name::text, ' '::text, 1)
        END AS claimant_first,
    ''::character varying(256) AS claimant_middle,
        CASE
            WHEN a.claimant_name::text ~~ '% % %'::text AND a.claimant_name::text !~~ '%;%'::text THEN ''::character varying(256)::text
            ELSE replace(split_part(a.claimant_name::text, ' '::text, 2), ';'::text, ''::text)
        END AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    a.loss_date,
    ''::character varying(256) AS loss_time,
    ''::character varying(256) AS report_date,
    split_part(a.status::text, ' '::text, 2)::character varying(256) AS closed_date,
    ''::character varying(256) AS reopen_date,
    ''::character varying(256) AS litigation,
    ''::character varying(256) AS days_employed,
    ''::character varying(256) AS claimant_gender,
    ''::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    ''::character varying(256) AS carrier_body_part,
        CASE
            WHEN a.coverage::text = ''::text OR a.coverage::text = 'Auto'::text THEN a.claim_description
            ELSE ''::character varying(256)
        END AS carrier_cause,
    concat('CAP_SPEC', ' - ', a.coverage)::character varying(256) AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat('CAP_SPEC', ' -', a.policy_number, ' - ', a.coverage, ' - ', a.policy_term, ' - ', a.insured, ' - ', a.loss_date)::character varying(256) AS carrier_policy_number,
    'raw_cap_spec'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_cap_spec a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_cap_spec OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_cap_spec to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_cap_spec to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_cap_spec to rpauser;
GO
GRANT SELECT ON p_and_c.normal_cap_spec to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_cap_spec to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_cap_spec to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_cap_spec to rl_p_and_c_d;
GO