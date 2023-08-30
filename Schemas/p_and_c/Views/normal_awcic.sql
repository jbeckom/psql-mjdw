CREATE OR REPLACE VIEW p_and_c.normal_awcic
AS SELECT DISTINCT concat('AWCIC', '-', a.claim_number)::character varying(256) AS claim_number,
    a.claim_number AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    '0.00'::character varying(256) AS paid_expense,
    '0.00'::character varying(256) AS reserve_expense,
    '0.00'::character varying(256) AS paid_indemnity,
    a.total_paid AS paid_medical,
    '0.00'::character varying(256) AS reserve_indemnity,
    a.total_reserve AS reserve_medical,
    '0.00'::character varying(256) AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
        CASE
            WHEN replace(a.total_reserve::text, ','::text, ''::text)::numeric > 0::numeric THEN 'Open'::character varying(256)
            ELSE 'Closed'::character varying(256)
        END AS claim_status,
    ''::character varying(256) AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    a.rate_state AS claim_state,
    ''::character varying(256) AS claim_zip,
    ''::character varying(256) AS claim_site,
    a.rate_state AS benefit_state,
    ''::character varying(256) AS garage_state,
    ''::character varying(256) AS occupation,
    ''::character varying(256) AS class_code,
    a.claimant_name,
    split_part(a.claimant_name::text, ' '::text, 3) AS claimant_first,
        CASE
            WHEN a.claimant_name::text ~~ '% _'::text THEN "right"(a.claimant_name::text, 1)::character varying
            ELSE ''::character varying(256)
        END AS claimant_middle,
    split_part(a.claimant_name::text, ' '::text, 1) AS claimant_last,
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
    a.body_part AS carrier_body_part,
    a.cause_of_loss AS carrier_cause,
    'AWCIC - Workers'' Comp'::character varying(256) AS carrier_coverage_type,
    a.cause_of_loss AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat('AWCIC - ', a.policy_number, ' - ', a.policy_effective_date, ' - Workers'' Comp')::character varying(256) AS carrier_policy_number,
    'raw_awcic'::character varying(256) AS source_table,
    a.uploaded_at
   FROM p_and_c.raw_awcic a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_awcic OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_awcic to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_awcic to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_awcic to rpauser;
GO
GRANT SELECT ON p_and_c.normal_awcic to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_awcic to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_awcic to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_awcic to rl_p_and_c_d;
GO