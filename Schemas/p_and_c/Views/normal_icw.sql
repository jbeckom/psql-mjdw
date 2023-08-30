CREATE OR REPLACE VIEW p_and_c.normal_icw
AS SELECT DISTINCT concat('ICW', '-', a."Claim Num")::character varying(256) AS claim_number,
    a."Claim Num" AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    a."Expense (Paid)" AS paid_expense,
    a."Expense (Remaining Rsvs.)" AS reserve_expense,
    ((replace(replace(a."Indemnity (Paid)"::text, '$'::text, ''::text), ','::text, ''::text)::numeric + replace(replace(a."Voc Rehab (Paid)"::text, '$'::text, ''::text), ','::text, ''::text)::numeric))::character varying(256) AS paid_indemnity,
    a."Medical (Paid)" AS paid_medical,
    ((replace(replace(a."Indemnity (Remaining Rsvs.)"::text, '$'::text, ''::text), ','::text, ''::text)::numeric + replace(replace(a."Voc Rehab (Remaining Rsvs.)"::text, '$'::text, ''::text), ','::text, ''::text)::numeric))::character varying(256) AS reserve_indemnity,
    a."Medical (Remaining Rsvs.)" AS reserve_medical,
    replace(replace(replace(replace(a."Recoveries (Incurred)"::text, '$'::text, ''::text), ','::text, ''::text), ')'::text, ''::text), '('::text, '-'::text)::numeric::character varying(256) AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
        CASE
            WHEN a."Status"::text = 'Re-Open'::text THEN 'Reopen'::character varying(256)
            ELSE a."Status"
        END AS claim_status,
    a."Accident Description" AS description_text,
    a."Division Name" AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    a."State" AS claim_state,
    ''::character varying(256) AS claim_zip,
    a."Location Name" AS claim_site,
    a."State" AS benefit_state,
    ''::character varying(256) AS garage_state,
    a."Occupation Description" AS occupation,
    a."Class Code" AS class_code,
    a."Claimant Name" AS claimant_name,
    split_part(a."Claimant Name"::text, ' '::text, 1) AS claimant_first,
        CASE
            WHEN a."Claimant Name"::text ~~ '% % %'::text THEN split_part(a."Claimant Name"::text, ' '::text, 2)
            ELSE NULL::text
        END AS claimant_middle,
    reverse(split_part(reverse(a."Claimant Name"::text), ' '::text, 1)) AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    a."Date of Loss" AS loss_date,
    ''::character varying(256) AS loss_time,
    a."Notice Date" AS report_date,
    a."Closed Date" AS closed_date,
    a."ReOpen Date" AS reopen_date,
        CASE
            WHEN a."In Litigation?"::text = 'NO'::text THEN 'No'::character varying(256)
            ELSE
            CASE
                WHEN a."In Litigation?"::text = 'YES'::text THEN 'Yes'::character varying(256)
                ELSE a."In Litigation?"
            END
        END AS litigation,
        CASE
            WHEN a."Hire Date" IS NULL THEN ''::character varying(256)
            WHEN a."Hire Date"::text = ''::text THEN ''::character varying(256)
            ELSE ((a."Date of Loss"::date - a."Hire Date"::date))::character varying(256)
        END AS days_employed,
    ''::character varying(256) AS claimant_gender,
    a."Age At Injury" AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    a."Body Part Code" AS carrier_body_part,
    a."Inj Cause Code" AS carrier_cause,
    concat('ICW', ' - ', 'Workers'' Comp')::character varying(256) AS carrier_coverage_type,
    a."Nature Injury Code" AS carrier_nature,
    a."Claim Type" AS carrier_injury_code,
    concat('ICW', ' - ', a."Insured Name", ' - ', 'Workers'' Comp', ' - ', a."Policy No", ' - ', a."Policy Year")::character varying(256) AS carrier_policy_number,
    'raw_icw'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_icw a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_icw OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_icw to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_icw to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_icw to rpauser;
GO
GRANT SELECT ON p_and_c.normal_icw to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_icw to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_icw to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_icw to rl_p_and_c_d;
GO