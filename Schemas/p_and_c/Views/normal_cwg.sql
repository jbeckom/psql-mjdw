CREATE OR REPLACE VIEW p_and_c.normal_cwg
AS SELECT DISTINCT concat('CWG', '-', "right"(a."Textbox87"::text, 18))::character varying(256) AS claim_number,
    "right"(a."Textbox87"::text, 18) AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    a."GrossExpenses" AS paid_expense,
    '0.00'::character varying(256) AS reserve_expense,
    a."GrossPaidLosses" AS paid_indemnity,
    '0.00'::character varying(256) AS paid_medical,
    a."OutstandingReserves" AS reserve_indemnity,
    '0.00'::character varying(256) AS reserve_medical,
    a."Recoveries2" AS subrogation,
    a."DeductibleReimb" AS reimbursed,
    "right"(a."Textbox94"::text, length(a."Textbox94"::text) - 10) AS claim_status,
    a."Textbox109" AS description_text,
    a."Textbox110" AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    reverse(split_part(reverse(split_part(a."Textbox110"::text, ','::text, 1)), ' '::text, 1))::character varying(256) AS claim_city,
    "right"(a."Textbox110"::text, 2)::character varying(256) AS claim_state,
    ''::character varying(256) AS claim_zip,
    ''::character varying(256) AS claim_site,
    "right"(a."Textbox110"::text, 2)::character varying(256) AS benefit_state,
    "right"(a."Textbox110"::text, 2)::character varying(256) AS garage_state,
    ''::character varying(256) AS occupation,
    a."PremClassCode" AS class_code,
    a."ClaimantName" AS claimant_name,
        CASE
            WHEN a."ClaimantName"::text ~~ '% % %'::text THEN ''::character varying(256)::text
            ELSE split_part(a."ClaimantName"::text, ' '::text, 1)
        END AS claimant_first,
    ''::character varying(256) AS claimant_middle,
        CASE
            WHEN a."ClaimantName"::text ~~ '% % %'::text THEN ''::character varying(256)::text
            ELSE split_part(a."ClaimantName"::text, ' '::text, 2)
        END AS claimant_last,
    split_part(split_part(a."Textbox98"::text, ':   '::text, 2), ' '::text, 1) AS driver_first,
    ''::character varying(256) AS driver_middle,
    split_part(split_part(a."Textbox98"::text, ':   '::text, 2), ' '::text, 2) AS driver_last,
    "right"(a."Textbox88"::text, length(a."Textbox88"::text) - 13)::character varying(256) AS loss_date,
    ''::character varying(256) AS loss_time,
    a."Textbox111" AS report_date,
    ''::character varying(256) AS closed_date,
    ''::character varying(256) AS reopen_date,
    ''::character varying(256) AS litigation,
    ''::character varying(256) AS days_employed,
    ''::character varying(256) AS claimant_gender,
    ''::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    ''::character varying(256) AS carrier_body_part,
        CASE
            WHEN a."CoverageType2"::text = 'Auto Liability'::text OR a."CoverageType2"::text = 'Collision'::text OR a."CoverageType2"::text = 'Comprehensive'::text THEN a."Textbox109"
            ELSE ''::character varying(256)
        END AS carrier_cause,
    concat('CWG', ' - ', a."CoverageType2", ' - ', a."TypeOfLoss2")::character varying(256) AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat('CWG', ' - ', "right"(a."InsuredName1"::text, length(a."InsuredName1"::text) - 14), ' - ', "right"(a."Textbox83"::text, length(a."Textbox83"::text) - 11), "right"(a."Textbox114"::text, length(a."Textbox114"::text) - 24), ' - ', a."CoverageType2")::character varying(256) AS carrier_policy_number,
    'raw_cwg'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_cwg a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_cwg OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_cwg to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_cwg to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_cwg to rpauser;
GO
GRANT SELECT ON p_and_c.normal_cwg to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_cwg to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_cwg to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_cwg to rl_p_and_c_d;
GO