CREATE OR REPLACE VIEW p_and_c.normal_auto_owners
AS SELECT DISTINCT concat('AUTO_OWNERS', '-', a.claim_number)::character varying(256) AS claim_number,
    a.claim_number AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    a.allocated_expense AS paid_expense,
    ((a.total_allocated_expense::numeric - a.allocated_expense::numeric))::character varying(256) AS reserve_expense,
    a.total_paid_amount AS paid_indemnity,
    '0.00'::character varying(256) AS paid_medical,
    a.total_pending_reserve_amount AS reserve_indemnity,
    '0.00'::character varying(256) AS reserve_medical,
    '0.00'::character varying(256) AS subrogation,
    a.total_recovery_amount AS reimbursed,
        CASE
            WHEN a.close_date IS NULL THEN 'Open'::character varying(256)
            ELSE 'Closed'::character varying(256)
        END AS claim_status,
    a.description AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    "right"(split_part(a.address::text, ', '::text, 1), 12)::character varying(256) AS claim_city,
    split_part(split_part(a.address::text, ', '::text, 2), ' '::text, 1)::character varying(256) AS claim_state,
    "right"(a.address::text, 10)::character varying(256) AS claim_zip,
    a.address AS claim_site,
    split_part(split_part(a.address::text, ', '::text, 2), ' '::text, 1)::character varying(256) AS benefit_state,
    split_part(split_part(a.address::text, ', '::text, 2), ' '::text, 1)::character varying(256) AS garage_state,
    ''::character varying(256) AS occupation,
    ''::character varying(256) AS class_code,
    a.driver AS claimant_name,
    split_part(a.driver::text, ' '::text, 1)::character varying(256) AS claimant_first,
    ''::character varying(256) AS claimant_middle,
    split_part(a.driver::text, ' '::text, 2)::character varying(256) AS claimant_last,
    split_part(a.driver::text, ' '::text, 1)::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    split_part(a.driver::text, ' '::text, 2)::character varying(256) AS driver_last,
    a.loss_date,
    ''::character varying(256) AS loss_time,
    ''::character varying(256) AS report_date,
    a.close_date AS closed_date,
    ''::character varying(256) AS reopen_date,
    ''::character varying(256) AS litigation,
    ''::character varying(256) AS days_employed,
    ''::character varying(256) AS claimant_gender,
    ''::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    ''::character varying(256) AS carrier_body_part,
    a.description AS carrier_cause,
    concat('AUTO_OWNERS', ' - ', a.policy_type, ' - ', a.coverage)::character varying(256) AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat('AUTO_OWNERS', ' - ', a.named_insured, ' - ', a.term, ' - ', a.policy_number)::character varying(256) AS carrier_policy_number,
    'raw_auto_owners'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_auto_owners a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_auto_owners OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_auto_owners to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_auto_owners to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_auto_owners to rpauser;
GO
GRANT SELECT ON p_and_c.normal_auto_owners to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_auto_owners to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_auto_owners to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_auto_owners to rl_p_and_c_d;
GO