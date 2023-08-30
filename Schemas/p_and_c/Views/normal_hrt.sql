CREATE OR REPLACE VIEW p_and_c.normal_hrt
AS 
SELECT DISTINCT concat('HRT-', a."Claim Number")::character varying(256) AS claim_number,
    a."Claim Number" AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    a."Paid Legal/Expense" AS paid_expense,
    a."O/S Legal/Expense" AS reserve_expense,
    a."Paid Indemnity" AS paid_indemnity,
    a."Paid Medical" AS paid_medical,
    a."O/S Indemnity" AS reserve_indemnity,
    a."O/S Medical" AS reserve_medical,
        CASE
            WHEN a.subrogation::text = ''::text THEN '0.00'::character varying(256)
            ELSE (replace(replace(a.subrogation::text, ','::text, ''::text), '$'::text, ''::text)::numeric(18,2) * '-1'::numeric)::integer::numeric::character varying(256)
        END AS subrogation,
        CASE
            WHEN a."Incurred Recovery"::text = ''::text THEN '0.00'::character varying(256)
            ELSE (replace(replace(a."Incurred Recovery"::text, ','::text, ''::text), '$'::text, ''::text)::numeric(18,2) * '-1'::numeric)::integer::numeric::character varying(256)
        END AS reimbursed,
        CASE
            WHEN a."Status"::text = 'Reopened'::text THEN 'Reopen'::character varying(256)
            ELSE a."Status"
        END AS claim_status,
    a."Loss Description" AS description_text,
    a."Employment Address" AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    states.code::character varying(256) AS claim_state,
    ''::character varying(256) AS claim_zip,
    a."Location Number" AS claim_site,
    states.code::character varying(256) AS benefit_state,
    ''::character varying(256) AS garage_state,
    a."Occupation" AS occupation,
    a."Class Code" AS class_code,
    a."Claimant" AS claimant_name,
    split_part(split_part(a."Claimant"::text, ', '::text, 2), ' '::text, 1) AS claimant_first,
    split_part(split_part(a."Claimant"::text, ', '::text, 2), ' '::text, 2) AS claimant_middle,
    split_part(a."Claimant"::text, ', '::text, 1) AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
        CASE
            WHEN a."Date of Injury"::text = ''::text THEN ''::character varying(256)
            ELSE a."Date of Injury"
        END AS loss_date,
    ''::character varying(256) AS loss_time,
        CASE
            WHEN a."Days to Report"::text = ''::text THEN ''::character varying(256)
            ELSE ((a."Date of Injury"::date + replace(a."Days to Report",'.0','')::integer))::character varying(256)
        END AS report_date,
    ''::character varying(256) AS closed_date,
    ''::character varying(256) AS reopen_date,
    ''::character varying(256) AS litigation,
        CASE
            WHEN a."Hire Date" IS NULL THEN ''::character varying(256)
            ELSE
            CASE
                WHEN a."Hire Date"::text = ''::text THEN ''::character varying(256)
                ELSE ((a."Date of Injury"::date - a."Hire Date"::date))::character varying(256)
            END
        END AS days_employed,
    ''::character varying(256) AS claimant_gender,
    a."Claimant Age" AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    a."Body Part" AS carrier_body_part,
    a."Detail Cause" AS carrier_cause,
    concat('HRT', ' - ', 'Workers'' Comp', ' - ', 'Workers'' Comp')::character varying(256) AS carrier_coverage_type,
    a."Nature of Injury" AS carrier_nature,
    a."Claim Type" AS carrier_injury_code,
    concat('HRT', ' - ', a."Client", ' - ', 'Workers'' Comp', ' - ', a."Carrier Policy Effective Date")::character varying(256) AS carrier_policy_number,
    'raw_hrt'::character varying(256) AS source_table,
    a.uploaded_at
   FROM p_and_c.raw_hrt a
     LEFT JOIN p_and_c.states ON a."Jurisdiction State"::text = states.name
     where "Claim Number" is not null and "Claim Number" != '';
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_hrt OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_hrt to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_hrt to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_hrt to rpauser;
GO
GRANT SELECT ON p_and_c.normal_hrt to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_hrt to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_hrt to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_hrt to rl_p_and_c_d;
GO