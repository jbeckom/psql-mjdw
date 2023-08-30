CREATE OR REPLACE VIEW p_and_c.normal_stco
AS SELECT DISTINCT concat('STCO', '-', a."Claim Number")::character varying(256) AS claim_number,
    a."Claim Number" AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    a."Paid Expense" AS paid_expense,
    ''::character varying(256) AS reserve_expense,
        CASE
            WHEN a."Claim Type"::text = 'Indemnity'::text THEN a."Paid Loss"
            ELSE '0.00'::character varying(256)
        END AS paid_indemnity,
        CASE
            WHEN a."Claim Type"::text = 'Medical'::text THEN a."Paid Loss"
            ELSE '0.00'::character varying(256)
        END AS paid_medical,
        CASE
            WHEN a."Claim Type"::text = 'Indemnity'::text THEN a."Reserved Total"
            ELSE '0.00'::character varying(256)
        END AS reserve_indemnity,
        CASE
            WHEN a."Claim Type"::text = 'Medical'::text THEN a."Reserved Total"
            ELSE '0.00'::character varying(256)
        END AS reserve_medical,
    '0.00'::character varying(256) AS subrogation,
    a."Reimbursed Total" AS reimbursed,
    a."Claim Status" AS claim_status,
    a."Claim Description"::character varying(256) AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    a."Claim Location City" AS claim_city,
    a."Claim Location State" AS claim_state,
    ''::character varying(256) AS claim_zip,
    a."Client Location Codes" AS claim_site,
    a."Claim Location City" AS benefit_state,
    ''::character varying(256) AS garage_state,
    a."Claimant Occupation" AS occupation,
    a."Job Code" AS class_code,
    concat(a."Claimant First Name", ' ', a."Claimant Last Name")::character varying(256) AS claimant_name,
    a."Claimant First Name" AS claimant_first,
    ''::character varying(256) AS claimant_middle,
    a."Claimant Last Name" AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    a."Date of Loss" AS loss_date,
    a."Time of Loss" AS loss_time,
    a."Date Reported" AS report_date,
    a."Date Closed" AS closed_date,
    ''::character varying(256) AS reopen_date,
    ''::character varying(256) AS litigation,
        CASE
            WHEN a."Date of Hire"::text = ''::text THEN ''::character varying(256)
            ELSE ((a."Date of Loss"::date - a."Date of Hire"::date))::character varying(256)
        END AS days_employed,
    ''::character varying(256) AS claimant_gender,
    a."Claimant Age" AS claimant_age,
        CASE
            WHEN a."CLEE Description 3"::text ~~ '%shift%'::text THEN "right"(a."CLEE Description 3"::text, 1)::character varying(256)
            ELSE ''::character varying(256)
        END AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    a."Primary Detailed Body Part" AS carrier_body_part,
    a."Detail Cause of Injury" AS carrier_cause,
    concat('STCO', ' - ', 'Workers'' Comp', ' - ', 'Workers'' Comp')::character varying(256) AS carrier_coverage_type,
    a."Detailed Nature of Injury" AS carrier_nature,
    a."Claim Type" AS carrier_injury_code,
    concat('STCO', ' - ', a."Client Name", ' - ', 'Workers'' Comp', ' - ', a."Policy Start Date"::date, ' - ', a."Policy Number")::character varying(256) AS carrier_policy_number,
    'raw_stco'::character varying(256) AS source_table,
    a.uploaded_at
   FROM p_and_c.raw_stco a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_stco OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_stco to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_stco to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_stco to rpauser;
GO
GRANT SELECT ON p_and_c.normal_stco to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_stco to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_stco to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_stco to rl_p_and_c_d;
GO