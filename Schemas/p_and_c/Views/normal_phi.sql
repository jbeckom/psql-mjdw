CREATE OR REPLACE VIEW p_and_c.normal_phi
AS SELECT DISTINCT concat('PHI', '-', a."ClaimNumber")::character varying(256) AS claim_number,
    a."ClaimNumber" AS occurrence_number,
        CASE
            WHEN a."ClaimantName"::text = 'No Claimants'::text THEN ''::character varying(256)
            ELSE "left"(a."ClaimantName"::text, 3)::character varying(256)
        END AS claimant_number,
    a."TotalExpensePaid" AS paid_expense,
    a."ExpenseReserves" AS reserve_expense,
    a."TotalLossPaid" AS paid_indemnity,
    '0.00'::character varying(256) AS paid_medical,
    a."LossReserves" AS reserve_indemnity,
    '0.00'::character varying(256) AS reserve_medical,
    ((replace(a."SubroSalvageRecovered"::text, ','::text, ''::text)::numeric * '-1'::integer::numeric))::character varying(256) AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
        CASE
            WHEN a."Status" IS NULL THEN 'Open'::character varying(256)
            ELSE 'Closed'::character varying(256)
        END AS claim_status,
    ''::character varying(256) AS description_text,
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
        CASE
            WHEN a."ClaimantName"::text ~~* 'No Claimants'::text THEN a."ClaimantName"
            ELSE "right"(a."ClaimantName"::text, length(a."ClaimantName"::text) - 5)::character varying(256)
        END AS claimant_name,
        CASE
            WHEN a."ClaimantName"::text ~~* 'No Claimants'::text THEN ''::character varying(256)
            WHEN a."ClaimantName"::text ~~* '%Adult%'::text THEN ''::character varying(256)
            ELSE split_part("right"(a."ClaimantName"::text, length(a."ClaimantName"::text) - 5), ' '::text, 2)::character varying(256)
        END AS claimant_first,
        CASE
            WHEN a."ClaimantName"::text ~~* 'No Claimants'::text THEN ''::character varying(256)
            WHEN a."ClaimantName"::text ~~* '%Adult%'::text THEN ''::character varying(256)
            WHEN a."ClaimantName"::text ~~ '% % %'::text THEN split_part("right"(a."ClaimantName"::text, length(a."ClaimantName"::text) - 5), ' '::text, 3)::character varying(256)
            ELSE ''::character varying(256)
        END AS claimant_middle,
        CASE
            WHEN a."ClaimantName"::text ~~* 'No Claimants'::text THEN ''::character varying(256)
            WHEN a."ClaimantName"::text ~~* '%Adult%'::text THEN ''::character varying(256)
            ELSE split_part("right"(a."ClaimantName"::text, length(a."ClaimantName"::text) - 5), ','::text, 1)::character varying(256)
        END AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    a."LossDate" AS loss_date,
    ''::character varying(256) AS loss_time,
    a."OpenDate" AS report_date,
    a."ClosedDate" AS closed_date,
    ''::character varying(256) AS reopen_date,
    ''::character varying(256) AS litigation,
    ''::character varying(256) AS days_employed,
    ''::character varying(256) AS claimant_gender,
    ''::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    ''::character varying(256) AS carrier_body_part,
    a."TypeOfLoss" AS carrier_cause,
    concat('PHI', ' - ', a."TypeOfLoss")::character varying(256) AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat('PHI', ' - ', a."AccountName", ' - ', a."PolicyNumber", ' - ', a."EffectiveDate", ' - ', a."TypeOfLoss")::character varying(256) AS carrier_policy_number,
    'raw_phi'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_phi a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_phi OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_phi to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_phi to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_phi to rpauser;
GO
GRANT SELECT ON p_and_c.normal_phi to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_phi to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_phi to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_phi to rl_p_and_c_d;
GO