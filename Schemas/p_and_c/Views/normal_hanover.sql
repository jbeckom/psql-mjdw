CREATE OR REPLACE VIEW p_and_c.normal_hanover
AS SELECT DISTINCT concat('HANOVER', '-', a.claim_number)::character varying(256) AS claim_number,
    a.claim_number AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    '0.00'::character varying(256) AS paid_expense,
    '0.00'::character varying(256) AS reserve_expense,
    a.paid_loss AS paid_indemnity,
    '0.00'::character varying(256) AS paid_medical,
    a.current_reserve AS reserve_indemnity,
    '0.00'::character varying(256) AS reserve_medical,
        CASE
            WHEN a.subro::text = 'Does_Not_Apply'::text THEN '0.00'::character varying(256)
            ELSE a.subro
        END AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
        CASE
            WHEN a.claim_status::text = 'closed'::text THEN 'Closed'::character varying(256)
            ELSE
            CASE
                WHEN a.claim_status::text = 'open'::text THEN 'Open'::character varying(256)
                ELSE a.claim_status
            END
        END AS claim_status,
    a.desc_of_loss AS description_text,
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
    a.date_claim_reported AS report_date,
    ''::character varying(256) AS closed_date,
    ''::character varying(256) AS reopen_date,
    ''::character varying(256) AS litigation,
    ''::character varying(256) AS days_employed,
    ''::character varying(256) AS claimant_gender,
    ''::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    ''::character varying(256) AS carrier_body_part,
    a.desc_of_loss AS carrier_cause,
    concat('HANOVER', ' - ', a.lob, ' - ', a.desc_of_loss)::character varying(256) AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat('HANOVER', ' - ', a.insured_name, ' - ', a.lob, ' - ', a.policy_number, ' - ', a.policy_effective_date)::character varying(256) AS carrier_policy_number,
    'raw_hanover'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_hanover a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_hanover OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_hanover to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_hanover to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_hanover to rpauser;
GO
GRANT SELECT ON p_and_c.normal_hanover to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_hanover to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_hanover to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_hanover to rl_p_and_c_d;
GO