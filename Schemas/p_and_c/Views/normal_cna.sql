CREATE OR REPLACE VIEW p_and_c.normal_cna
AS SELECT DISTINCT concat('CNA', '-', a."Claim Number")::character varying(256) AS claim_number,
    a."Claim Number" AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    a."Paid Expenses" AS paid_expense,
    '0.00'::character varying(256) AS reserve_expense,
    ((replace(a."Paid Loss"::text, ','::text, ''::text)::numeric + replace(a."Paid Indemnity"::text, ','::text, ''::text)::numeric))::character varying(256) AS paid_indemnity,
    ((replace(a."Paid Medical"::text, ','::text, ''::text)::numeric + replace(a."Paid Liability"::text, ','::text, ''::text)::numeric))::character varying(256) AS paid_medical,
    a."Reserves" AS reserve_indemnity,
    '0.00'::character varying(256) AS reserve_medical,
    a."Recovery" AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
        CASE
            WHEN a."Status"::text = 'Clsd'::text THEN 'Closed'::character varying(256)
            ELSE
            CASE
                WHEN a."Status"::text = 'Pend'::text THEN 'Open'::character varying(256)
                ELSE
                CASE
                    WHEN a."Status"::text = 'Reopn'::text THEN 'Reopen'::character varying(256)
                    ELSE a."Status"
                END
            END
        END AS claim_status,
    a."Loss Description" AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    a."Accident State" AS claim_state,
    ''::character varying(256) AS claim_zip,
    a."Location Code" AS claim_site,
    a."Accident State" AS benefit_state,
    a."Accident State" AS garage_state,
    ''::character varying(256) AS occupation,
    ''::character varying(256) AS class_code,
    a."Claimant Name" AS claimant_name,
        CASE
            WHEN a."Claimant Name"::text ~~ '% % %'::text OR a."Claimant Name"::text ~~ '%.%'::text THEN ''::character varying(256)::text
            ELSE split_part(split_part(a."Claimant Name"::text, ','::text, 2), ' '::text, 1)
        END AS claimant_first,
        CASE
            WHEN a."Claimant Name"::text ~~ '% % %'::text OR a."Claimant Name"::text ~~ '%.%'::text THEN ''::character varying(256)::text
            ELSE split_part(split_part(a."Claimant Name"::text, ','::text, 2), ' '::text, 2)
        END AS claimant_middle,
        CASE
            WHEN a."Claimant Name"::text ~~ '% % %'::text OR a."Claimant Name"::text ~~ '%.%'::text THEN ''::character varying(256)::text
            ELSE split_part(a."Claimant Name"::text, ','::text, 1)
        END AS claimant_last,
    split_part(split_part(a."Driver Name"::text, ','::text, 2), ' '::text, 1) AS driver_first,
    split_part(a."Driver Name"::text, ' '::text, 2) AS driver_middle,
    split_part(a."Driver Name"::text, ','::text, 1) AS driver_last,
    a."Loss/Injury Date" AS loss_date,
    ''::character varying(256) AS loss_time,
        CASE
            WHEN a."Report Date"::text = 'null'::text THEN NULL::character varying(256)
            ELSE a."Report Date"
        END AS report_date,
    ''::character varying(256) AS closed_date,
    ''::character varying(256) AS reopen_date,
    ''::character varying(256) AS litigation,
    ''::character varying(256) AS days_employed,
    ''::character varying(256) AS claimant_gender,
    ''::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    a."Body Part" AS carrier_body_part,
    a."Accident Type" AS carrier_cause,
    concat('CNA', ' - ', a."Product",
        CASE
            WHEN a."Product"::text = 'Work Comp'::text THEN NULL::text
            ELSE concat(' - ', a."Claimant Nature")
        END)::character varying(256) AS carrier_coverage_type,
    a."Claimant Nature" AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat('CNA', ' - Account', a."Account Number", ' - Policy', a."Policy Number", ' - ', a."Eff - Exp Dates", ' - ', a."Product")::character varying(256) AS carrier_policy_number,
    'raw_cna'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_cna a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_cna OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_cna to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_cna to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_cna to rpauser;
GO
GRANT SELECT ON p_and_c.normal_cna to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_cna to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_cna to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_cna to rl_p_and_c_d;
GO