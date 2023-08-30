CREATE OR REPLACE VIEW p_and_c.normal_wic
AS SELECT DISTINCT concat('WIC', '-', a.claim_number)::character varying(256) AS claim_number,
    a.claim_number AS occurrence_number,
    a.feature AS claimant_number,
    '0.00'::character varying(256) AS paid_expense,
    '0.00'::character varying(256) AS reserve_expense,
    a.cum_paid_loss AS paid_indemnity,
    '0.00'::character varying(256) AS paid_medical,
    a.outstanding_case_loss_reserve AS reserve_indemnity,
    '0.00'::character varying(256) AS reserve_medical,
    a.net_subrogation AS subrogation,
    a.net_recovery AS reimbursed,
        CASE
            WHEN a.feature_status::text = 'CLOSED'::text THEN 'Closed'::character varying(256)
            ELSE
            CASE
                WHEN a.feature_status::text = 'OPEN'::text THEN 'Open'::character varying(256)
                ELSE ''::character varying(256)
            END
        END AS claim_status,
    a.loss_description AS description_text,
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
    ''::character varying(256) AS claimant_name,
    ''::character varying(256) AS claimant_first,
    ''::character varying(256) AS claimant_middle,
    ''::character varying(256) AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    a.date_of_loss AS loss_date,
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
    concat('WIC', ' - ', a.loss_description)::character varying(256) AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat('WIC', ' - ', a.insured_name, ' - ', a.policy_start_date::date, ' - ', a.policy_number, ' - ', a.loss_description)::character varying(256) AS carrier_policy_number,
    'raw_wic'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_wic a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_wic OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_wic to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_wic to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_wic to rpauser;
GO
GRANT SELECT ON p_and_c.normal_wic to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_wic to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_wic to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_wic to rl_p_and_c_d;
GO