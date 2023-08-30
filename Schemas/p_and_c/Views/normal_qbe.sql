CREATE OR REPLACE VIEW p_and_c.normal_qbe
AS SELECT DISTINCT concat('QBE', '-', a.claim_number)::character varying(256) AS claim_number,
    a.claim_number AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    '0.00'::character varying(256) AS paid_expense,
    '0.00'::character varying(256) AS reserve_expense,
    a.total_paid AS paid_indemnity,
    '0.00'::character varying(256) AS paid_medical,
    a.remaining_reserves AS reserve_indemnity,
    '0.00'::character varying(256) AS reserve_medical,
    a.total_recoveries AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
        CASE
            WHEN a.current_status::text = 'CL'::text THEN 'Closed'::character varying(256)
            ELSE
            CASE
                WHEN a.current_status::text = 'O'::text THEN 'Open'::character varying(256)
                ELSE ''::character varying(256)
            END
        END AS claim_status,
    a.claim_description AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    states.code::character varying(256) AS claim_state,
    ''::character varying(256) AS claim_zip,
    ''::character varying(256) AS claim_site,
    states.code::character varying(256) AS benefit_state,
    ''::character varying(256) AS garage_state,
    ''::character varying(256) AS occupation,
    ''::character varying(256) AS class_code,
    a.claimant_name,
    split_part(a.claimant_name::text, ' '::text, 2)::character varying(256) AS claimant_first,
    ''::character varying(256) AS claimant_middle,
    split_part(a.claimant_name::text, ','::text, 1)::character varying(256) AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    a.accident_date AS loss_date,
    ''::character varying(256) AS loss_time,
    a.reported_date AS report_date,
    a.closed_date,
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
    a.wc_claim_type AS carrier_injury_code,
    concat('QBE', ' - ', a.mtc, ' - ', a.policy_number, ' - ', a.policy_start_date)::character varying(256) AS carrier_policy_number,
    'raw_qbe'::character varying(256) AS source_table,
    a.uploaded_at
   FROM p_and_c.raw_qbe a
     LEFT JOIN p_and_c.states ON a.state::text = states.name;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_qbe OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_qbe to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_qbe to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_qbe to rpauser;
GO
GRANT SELECT ON p_and_c.normal_qbe to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_qbe to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_qbe to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_qbe to rl_p_and_c_d;
GO