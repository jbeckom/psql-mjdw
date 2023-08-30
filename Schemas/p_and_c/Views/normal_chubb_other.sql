CREATE OR REPLACE VIEW p_and_c.normal_chubb_other
AS SELECT DISTINCT concat('CHUBB_OTHER', '-', a.occurrence_id)::character varying(256) AS claim_number,
    a.occurrence_id AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    a.gross_paid_expense AS paid_expense,
    '0.00'::character varying(256) AS reserve_expense,
    a.gross_paid_loss AS paid_indemnity,
    '0.00'::character varying(256) AS paid_medical,
    a.gross_outstanding AS reserve_indemnity,
    '0.00'::character varying(256) AS reserve_medical,
    '0.00'::character varying(256) AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
        CASE
            WHEN a.sts::text = 'C'::text THEN 'Closed'::character varying(256)
            ELSE
            CASE
                WHEN a.sts::text = 'O'::text THEN 'Open'::character varying(256)
                ELSE
                CASE
                    WHEN a.sts::text = 'R'::text THEN 'Reopen'::character varying(256)
                    ELSE ''::character varying(256)
                END
            END
        END AS claim_status,
    a.description AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    a.state AS claim_state,
    ''::character varying(256) AS claim_zip,
    ''::character varying(256) AS claim_site,
    a.state AS benefit_state,
    a.state AS garage_state,
    ''::character varying(256) AS occupation,
    ''::character varying(256) AS class_code,
    a.claimant AS claimant_name,
    split_part(a.claimant::text, ';'::text, 2) AS claimant_first,
    ''::character varying(256) AS claimant_middle,
        CASE
            WHEN a.claimant::text ~~ '%;%'::text THEN split_part(a.claimant::text, ';'::text, 1)::character varying
            ELSE ''::character varying(256)
        END AS claimant_last,
    split_part(a.claimant::text, ';'::text, 2) AS driver_first,
    ''::character varying(256) AS driver_middle,
        CASE
            WHEN a.claimant::text ~~ '%;%'::text THEN split_part(a.claimant::text, ';'::text, 1)::character varying
            ELSE ''::character varying(256)
        END AS driver_last,
    a.event_date AS loss_date,
    ''::character varying(256) AS loss_time,
    a.report_date,
    a.close_date AS closed_date,
    a.reopen_date,
    ''::character varying(256) AS litigation,
    ''::character varying(256) AS days_employed,
    ''::character varying(256) AS claimant_gender,
    ''::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    ''::character varying(256) AS carrier_body_part,
    a.description AS carrier_cause,
    ''::character varying(256) AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat('CHUBB_OTHER', ' - ', a.insured_name, ' - ', a.policy_number, ' - ', a.policy_start_date)::character varying(256) AS carrier_policy_number,
    'raw_chubb_other'::character varying(256) AS source_table,
    a.uploaded_at
   FROM p_and_c.raw_chubb_other a;
GO

 /*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_chubb_other OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_chubb_other to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_chubb_other to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_chubb_other to rpauser;
GO
GRANT SELECT ON p_and_c.normal_chubb_other to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_chubb_other to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_chubb_other to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_chubb_other to rl_p_and_c_d;
GO