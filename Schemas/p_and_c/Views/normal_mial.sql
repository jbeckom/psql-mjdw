CREATE OR REPLACE VIEW p_and_c.normal_mial
AS SELECT DISTINCT concat('MIAL', '-', a.claim_no)::character varying(256) AS claim_number,
    a.claim_no AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    ((a.paid_to_date_legal::numeric + a.paid_to_date_other::numeric))::character varying(256) AS paid_expense,
    ((a.outstanding_legal::numeric + a.outstanding_other::numeric))::character varying(256) AS reserve_expense,
    a.paid_to_date_compensation AS paid_indemnity,
    a.paid_to_date_medical AS paid_medical,
    a.outstanding_compensation AS reserve_indemnity,
    a.outstanding_medical AS reserve_medical,
    '0.00'::character varying(256) AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
        CASE
            WHEN (a.outstanding_compensation::numeric + a.outstanding_medical::numeric + a.outstanding_legal::numeric + a.outstanding_other::numeric) > 0::numeric THEN 'Open'::character varying(256)
            ELSE 'Closed'::character varying(256)
        END AS claim_status,
    a.description AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
        CASE
            WHEN a.state_no::text = '13'::text THEN 'IN'::character varying(256)
            ELSE ''::character varying(256)
        END AS claim_state,
    ''::character varying(256) AS claim_zip,
    a.location AS claim_site,
        CASE
            WHEN a.state_no::text = '13'::text THEN 'IN'::character varying(256)
            ELSE ''::character varying(256)
        END AS benefit_state,
    ''::character varying(256) AS garage_state,
    a.class AS occupation,
    a.class AS class_code,
    a.claimant_name,
    split_part(a.claimant_name::text, ', '::text, 2) AS claimant_first,
    ''::character varying(256) AS claimant_middle,
    split_part(a.claimant_name::text, ', '::text, 1) AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    a.injury_date AS loss_date,
    ''::character varying(256) AS loss_time,
    ''::character varying(256) AS report_date,
    ''::character varying(256) AS closed_date,
    ''::character varying(256) AS reopen_date,
        CASE
            WHEN (a.paid_to_date_legal::numeric + a.outstanding_legal::numeric) > 0::numeric THEN 'Yes'::character varying(256)
            ELSE 'No'::character varying(256)
        END AS litigation,
    ''::character varying(256) AS days_employed,
    ''::character varying(256) AS claimant_gender,
    ''::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    a.injury AS carrier_body_part,
    ''::character varying(256) AS carrier_cause,
    concat('MIAL', ' - ', 'Workers'' Comp')::character varying(256) AS carrier_coverage_type,
    a.code AS carrier_nature,
    a.ncci_injury AS carrier_injury_code,
    concat('MIAL', ' - ', a.client_id, ' - ', 'Workers'' Comp', ' - ', a.injury_date)::character varying(256) AS carrier_policy_number,
    'raw_mial'::character varying(256) AS source_table,
    a.uploaded_at
   FROM p_and_c.raw_mial a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_mial OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_mial to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_mial to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_mial to rpauser;
GO
GRANT SELECT ON p_and_c.normal_mial to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_mial to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_mial to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_mial to rl_p_and_c_d;
GO