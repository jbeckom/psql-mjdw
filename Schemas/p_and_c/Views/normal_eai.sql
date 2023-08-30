CREATE OR REPLACE VIEW p_and_c.normal_eai
AS SELECT DISTINCT concat('EAI', '-', a."claim_no.")::character varying(256) AS claim_number,
    a."claim_no." AS occurrence_number,
        CASE
            WHEN a.claimant_no_002::text = ''::text OR a.claimant_no_002 IS NULL THEN '1'::character varying(256)
            ELSE '2'::character varying(256)
        END AS claimant_number,
    a.expense_paid AS paid_expense,
    a.expense_reserve AS resrve_expense,
    a.loss_paid AS paid_indemnity,
    '0.00'::character varying(256) AS paid_medical,
    a.loss_reserve AS reserve_indemnity,
    '0.00'::character varying(256) AS reserve_medical,
    ((a.expense_recovery::numeric + a.loss_recovery::numeric))::character varying(256) AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
        CASE
            WHEN a.close_date IS NULL THEN 'Open'::character varying(256)
            ELSE 'Closed'::character varying(256)
        END AS claim_status,
    a.cause_of_loss AS description_text,
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
    a.claimant_no_001 AS claimant_name,
    split_part(a.claimant_no_001::text, ', '::text, 2) AS claimant_first,
    ''::character varying(256) AS claimant_middle,
    split_part(a.claimant_no_001::text, ', '::text, 1) AS claimant_last,
        CASE
            WHEN a.driver_name::text ~~ 'RECORD%'::text THEN ''::character varying(256)::text
            ELSE split_part(a.driver_name::text, ', '::text, 2)
        END AS driver_first,
    ''::character varying(256) AS driver_middle,
        CASE
            WHEN a.driver_name::text ~~ 'RECORD%'::text THEN ''::character varying(256)::text
            ELSE split_part(a.driver_name::text, ', '::text, 1)
        END AS driver_last,
    a.loss_date,
    ''::character varying(256) AS loss_time,
    a.reported_date AS report_date,
    a.close_date AS closed_date,
    ''::character varying(256) AS reopen_date,
    ''::character varying(256) AS litigation,
    ''::character varying(256) AS days_employed,
    ''::character varying(256) AS claimant_gender,
    ''::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    ''::character varying(256) AS carrier_body_part,
    a.cause_of_loss AS carrier_cause,
    concat('EAI', ' - ', a.typ)::character varying(256) AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat('EAI', ' - ', a.insured, ' - ', a.effdate, ' - ', a.policy)::character varying(256) AS carrier_policy_number,
    'raw_eai'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_eai a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_eai OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_eai to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_eai to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_eai to rpauser;
GO
GRANT SELECT ON p_and_c.normal_eai to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_eai to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_eai to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_eai to rl_p_and_c_d;
GO