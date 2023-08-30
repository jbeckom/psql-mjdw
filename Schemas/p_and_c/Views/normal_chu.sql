CREATE OR REPLACE VIEW p_and_c.normal_chu
AS SELECT DISTINCT concat('CHU', '-', a."Claim Reference #")::character varying(256) AS claim_number,
    a."Claim Reference #" AS occurrence_number,
    a."Claimant #" AS claimant_number,
    a."Expenses Paid" AS paid_expense,
        CASE
            WHEN a."Expense Reserve"::text = '*'::text THEN '0.00'::character varying(256)
            ELSE a."Expense Reserve"
        END AS reserve_expense,
        CASE
            WHEN a."Claim Type"::text !~~ '%Medical Only%'::character varying(256)::text THEN a."Losses Paid"
            ELSE '0.00'::character varying(256)
        END AS paid_indemnity,
        CASE
            WHEN a."Claim Type"::text ~~ '%Medical Only%'::character varying(256)::text THEN a."Losses Paid"
            ELSE '0.00'::character varying(256)
        END AS paid_medical,
        CASE
            WHEN a."Claim Type"::text !~~ '%Medical Only%'::character varying(256)::text THEN replace(a."Loss Reserve"::text, '*'::text, '0'::text)::character varying(256)
            ELSE '0.00'::character varying(256)
        END AS reserve_indemnity,
        CASE
            WHEN a."Claim Type"::text ~~ '%Medical Only%'::character varying(256)::text THEN a."Loss Reserve"
            ELSE '0.00'::character varying(256)
        END AS reserve_medical,
    a."Recovery" AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
        CASE
            WHEN a."Claim Status"::text ~~ '%Closed%'::character varying(256)::text THEN 'Closed'::character varying(256)
            ELSE
            CASE
                WHEN a."Claim Status"::text ~~ '%Open%'::character varying(256)::text THEN 'Open'::character varying(256)
                ELSE ''::character varying(256)
            END
        END AS claim_status,
    a."Loss Description" AS description_text,
    b."Location_Name" AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
        CASE
            WHEN a."Loss Location"::text ~~ '%,%'::character varying(256)::text THEN "left"(a."Loss Location"::text, length(a."Loss Location"::text) - 4)::character varying(256)
            ELSE a."Loss Location"
        END AS claim_city,
        CASE
            WHEN a."Loss Location"::text ~~ '%,%'::text THEN "right"(a."Loss Location"::text, 2)::character varying(256)
            ELSE ''::character varying(256)
        END AS claim_state,
    ''::character varying(256) AS claim_zip,
    a."Loss Location" AS claim_site,
        CASE
            WHEN a."Loss Location"::text ~~ '%,%'::text THEN "right"(a."Loss Location"::text, 2)::character varying(256)
            ELSE ''::character varying(256)
        END AS benefit_state,
        CASE
            WHEN a."Loss Location"::text ~~ '%,%'::text THEN "right"(a."Loss Location"::text, 2)::character varying(256)
            ELSE ''::character varying(256)
        END AS garage_state,
    b."Occupation" AS occupation,
    ''::character varying(256) AS class_code,
    a."Claimant Name" AS claimant_name,
        CASE
            WHEN a."Claimant Name"::text ~~ '% % %'::text THEN ''::character varying(256)
            ELSE split_part(a."Claimant Name"::text, ' '::text, 1)::character varying(256)
        END AS claimant_first,
    ''::character varying(256) AS claimant_middle,
        CASE
            WHEN a."Claimant Name"::text ~~ '% % %'::text THEN ''::character varying(256)
            ELSE split_part(a."Claimant Name"::text, ' '::text, 2)::character varying(256)
        END AS claimant_last,
        CASE
            WHEN a."Claimant Name"::text ~~ '% % %'::text THEN ''::character varying(256)
            ELSE split_part(a."Claimant Name"::text, ' '::text, 1)::character varying(256)
        END AS driver_first,
    ''::character varying(256) AS driver_middle,
        CASE
            WHEN a."Claimant Name"::text ~~ '% % %'::text THEN ''::character varying(256)
            ELSE split_part(a."Claimant Name"::text, ' '::text, 2)::character varying(256)
        END AS driver_last,
    a."Loss Date" AS loss_date,
    ''::character varying(256) AS loss_time,
    a."Reported Date" AS report_date,
        CASE
            WHEN a."Close Date"::text = '-------'::text THEN NULL::character varying(256)
            ELSE a."Close Date"
        END AS closed_date,
    ''::character varying(256) AS reopen_date,
    ''::character varying(256) AS litigation,
    round(365::numeric * b."Exp"::numeric)::character varying(256) AS days_employed,
    ''::character varying(256) AS claimant_gender,
    round(b."Age"::numeric)::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    b."Body_Part" AS carrier_body_part,
        CASE
            WHEN a."Policy Type"::text = 'AUTO'::text THEN a."Loss Description"::character varying(256)
            ELSE ''::character varying(256)
        END AS carrier_cause,
    concat('CHU', ' - ', a."Policy Type", ' - ', a."Claim Type")::character varying(256) AS carrier_coverage_type,
    b."Acc._Type" AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    case when a."Policy Term" = '' then ''::character varying(256) 
    	else concat_ws(' - ','CHU', a."Insured", a."Policy Type", "left"(a."Policy Term"::text, 10)::date, a."Policy #")::character varying(256) END AS carrier_policy_number,
    'raw_chu'::character varying(256) AS source_table,
    a.uploaded_at
   FROM p_and_c.raw_chu a
     LEFT JOIN p_and_c.raw_chu_detail b ON "right"(a."Claim Reference #"::text, 11) = b."Claim_Reference_Number"::text
   where a."Policy Term" != '';
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_chu OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_chu to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_chu to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_chu to rpauser;
GO
GRANT SELECT ON p_and_c.normal_chu to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_chu to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_chu to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_chu to rl_p_and_c_d;
GO