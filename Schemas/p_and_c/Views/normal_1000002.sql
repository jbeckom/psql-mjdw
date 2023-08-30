CREATE OR REPLACE VIEW p_and_c.normal_1000002
AS SELECT DISTINCT concat('1000002', '-', a."Claim Number")::character varying(256) AS claim_number,
    a."Claim Number" AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    '0.00'::character varying(256) AS paid_expense,
    '0.00'::character varying(256) AS reserve_expense,
    a."Paid" AS paid_indemnity,
    '0.00'::character varying(256) AS paid_medical,
    a."Reserves" AS reserve_indemnity,
    '0.00'::character varying(256) AS reserve_medical,
    (('-1'::integer::numeric * a."Collection"::numeric(18,2)))::character varying(256) AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
        CASE
            WHEN a."ST"::text = 'C'::character varying(256)::text THEN 'Closed'::character varying(256)
            ELSE a."ST"
        END AS claim_status,
    a."Description"::text AS description_text,
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
    a."Claimant" AS claimant_name,
    initcap(split_part(a."Claimant"::text, ', '::text, 2))::character varying(256) AS claimant_first,
    ''::character varying(256) AS claimant_middle,
    initcap(split_part(a."Claimant"::text, ', '::text, 1))::character varying(256) AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    ((a."Date of Loss"::integer - 2 + '1900-01-01'::date))::character varying(256) AS loss_date,
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
    concat('1000002', ' - ', a."Description")::character varying(256) AS carrier_cause,
    concat('1000002', ' - ', a."Type")::character varying(256) AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    a."Type" AS carrier_injury_code,
    concat('1000002', ' - ', a."Dept.", ' - ', a."LOB", ' - ', a.policy_year)::character varying(256) AS carrier_policy_number,
    'raw_1000002'::character varying(256) AS source_table,
    a.uploaded_at
   FROM p_and_c.raw_1000002 a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_1000002 OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_1000002 to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_1000002 to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_1000002 to rpauser;
GO
GRANT SELECT ON p_and_c.normal_1000002 to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_1000002 to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_1000002 to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_1000002 to rl_p_and_c_d;
GO