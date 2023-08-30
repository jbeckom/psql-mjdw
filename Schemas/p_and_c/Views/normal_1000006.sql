CREATE OR REPLACE VIEW p_and_c.normal_1000006
AS SELECT DISTINCT concat('1000006', '-', a."Claim Number")::character varying(256) AS claim_number,
    split_part(a."Claim Number"::text, '-'::text, 1)::character varying(256) AS occurrence_number,
    split_part(a."Claim Number"::text, '-'::text, 2)::character varying(256) AS claimant_number,
    ((replace(replace(a."Expense Paid"::text, ','::text, ''::text), '$'::text, ''::text)::numeric + replace(replace(a."Legal Paid"::text, ','::text, ''::text), '$'::text, ''::text)::numeric))::character varying(256) AS paid_expense,
    ((replace(replace(a."Expense Balance"::text, ','::text, ''::text), '$'::text, ''::text)::numeric + replace(replace(a."Legal Balance"::text, ','::text, ''::text), '$'::text, ''::text)::numeric))::character varying(256) AS reserve_expense,
    a."Indemnity Paid" AS paid_indemnity,
    a."Medical Paid" AS paid_medical,
    a."Indemnity Balance" AS reserve_indemnity,
    a."Medical Balance" AS reserve_medical,
    a."Total Recovery" AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
        CASE
            WHEN a."Claim Status"::text ~~* '%incident%'::text THEN 'Closed'::character varying(256)
            ELSE split_part(a."Claim Status"::text, ' '::text, 1)::character varying(256)
        END AS claim_status,
    a."Accident Description"::character varying(256) AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    c.code::character varying(256) AS claim_state,
    ''::character varying(256) AS claim_zip,
    ''::character varying(256) AS claim_site,
    c.code::character varying(256) AS benefit_state,
    c.code::character varying(256) AS garage_state,
    a."Occupation" AS occupation,
    ''::character varying(256) AS class_code,
    a."Claimant Name" AS claimant_name,
        CASE
            WHEN a."Claimant Name"::text ~~ '%,%'::text THEN ''::character varying(256)
            ELSE split_part(a."Claimant Name"::text, ' '::text, 1)::character varying(256)
        END AS claimant_first,
    ''::character varying(256) AS claimant_middle,
        CASE
            WHEN a."Claimant Name"::text ~~ '%,%'::text THEN a."Claimant Name"
            ELSE split_part(a."Claimant Name"::text, ' '::text, 2)::character varying(256)
        END AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    a."Date of Loss" AS loss_date,
    ''::character varying(256) AS loss_time,
    a."Date Reported to TPA" AS report_date,
        CASE
            WHEN a."Date Closed"::text = '-'::text THEN ''::character varying(256)
            ELSE a."Date Closed"
        END AS closed_date,
    ''::character varying(256) AS reopen_date,
    ''::character varying(256) AS litigation,
        CASE
            WHEN a."Date Hired"::text = '-'::text THEN ''::character varying(256)
            ELSE ((a."Date of Loss"::date - a."Date Hired"::date))::character varying(256)
        END AS days_employed,
        CASE
            WHEN a."Claimant Gender"::text = 'Unknown'::text THEN ''::character varying(256)
            ELSE a."Claimant Gender"
        END AS claimant_gender,
        CASE
            WHEN a."Date Claimant Born"::text = '-'::text THEN ''::character varying(256)
            ELSE (((a."Date of Loss"::date - a."Date Claimant Born"::date) / 365))::character varying(256)
        END AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    a."Body Part" AS carrier_body_part,
    a."Cause" AS carrier_cause,
    concat('1000006', ' - ', a."Coverage Minor")::character varying(256) AS carrier_coverage_type,
    a."Injury" AS carrier_nature,
    split_part(a."Coverage Minor"::text, ' - '::text, 2)::character varying(256) AS carrier_injury_code,
    concat('1000006', ' - ', a."Hierarchy Location Level 2", ' - ', a."Coverage Major", ' - ', a."Policy Year")::character varying(256) AS carrier_policy_number,
    'raw_1000006'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_1000006 a
     LEFT JOIN p_and_c.states c ON a."Jurisdiction"::text = c.name;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_1000006 OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_1000006 to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_1000006 to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_1000006 to rpauser;
GO
GRANT SELECT ON p_and_c.normal_1000006 to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_1000006 to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_1000006 to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_1000006 to rl_p_and_c_d;
GO