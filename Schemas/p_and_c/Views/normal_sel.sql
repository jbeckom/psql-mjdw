CREATE OR REPLACE VIEW p_and_c.normal_sel
AS 
SELECT DISTINCT concat('SEL', '-', a."CLAIM #")::character varying(256) AS claim_number,
    a."CLAIM #" AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    a."EXPENSE PAID" AS paid_expense,
    a."EXPENSE RESERVE" AS reserve_expense,
    a."LOSS PAID" AS paid_indemnity,
    '0.00'::character varying(256) AS paid_medical,
    a."LOSS RESERVE" AS reserve_indemnity,
    '0.00'::character varying(256) AS reserve_medical,
    a."RECOVERY" AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
        CASE
            WHEN a."CLAIM STATUS"::text = ANY (ARRAY['Closed'::text, 'Report Only'::text]) THEN 'Closed'::character varying(256)
            ELSE a."CLAIM STATUS"
        END AS claim_status,
    a."LOSS DESCRIPTION" AS description_text,
    a."LOCATION ADDRESS" AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
        CASE
            WHEN a."POLICY NUMBER"::text = ANY (ARRAY['S  2147126'::character varying::text, 'S  1690767'::character varying::text]) THEN 'Fishers'::character varying(256)
            ELSE ''::character varying(256)
        END AS claim_city,
        CASE
            WHEN a."POLICY NUMBER"::text = ANY (ARRAY['S  2147126'::character varying::text, 'S  1690767'::character varying::text]) THEN 'IN'::character varying(256)
            ELSE ''::character varying(256)
        END AS claim_state,
    ''::character varying(256) AS claim_zip,
        CASE
            WHEN a."POLICY NUMBER"::text = ANY (ARRAY['S  2147126'::character varying::text, 'S  1690767'::character varying::text]) THEN 'IN'::character varying(256)
            ELSE ''::character varying(256)
        END AS benefit_state,
    ''::character varying(256) AS garage_state,
    a."LOCATION CODE" AS claim_site,
    ''::character varying(256) AS occupation,
    ''::character varying(256) AS class_code,
    a."CLAIMANT NAME" AS claimant_name,
        CASE
            WHEN a."CLAIMANT NAME"::text ~~* '%department%'::text THEN split_part(a."CLAIMANT NAME"::text, ' '::text, 1)::character varying(256)
            WHEN a."CLAIMANT NAME"::text ~~* '%town%'::text THEN split_part(a."CLAIMANT NAME"::text, ' '::text, 1)::character varying(256)
            ELSE
            CASE
                WHEN a."CLAIMANT NAME"::text !~~ '%,%'::text THEN ''::character varying(256)
                ELSE split_part(split_part(a."CLAIMANT NAME"::text, ', '::text, 2), ' '::text, 1)::character varying(256)
            END
        END AS claimant_first,
        CASE
            WHEN a."CLAIMANT NAME"::text ~~* '%department%'::text THEN split_part(a."CLAIMANT NAME"::text, ' '::text, 1)::character varying(256)
            WHEN a."CLAIMANT NAME"::text ~~* '%town%'::text THEN split_part(a."CLAIMANT NAME"::text, ' '::text, 1)::character varying(256)
            ELSE
            CASE
                WHEN a."CLAIMANT NAME"::text !~~ '%,%'::text THEN ''::character varying(256)
                ELSE split_part(split_part(a."CLAIMANT NAME"::text, ', '::text, 2), ' '::text, 2)::character varying(256)
            END
        END AS claimant_middle,
        CASE
            WHEN a."CLAIMANT NAME"::text ~~* '%department%'::text THEN split_part(a."CLAIMANT NAME"::text, ' '::text, 3)::character varying(256)
            WHEN a."CLAIMANT NAME"::text ~~* '%town%'::text THEN split_part(a."CLAIMANT NAME"::text, ' '::text, 3)::character varying(256)
            WHEN a."CLAIMANT NAME"::text !~~ '%,%'::text THEN ''::character varying(256)
            ELSE split_part(a."CLAIMANT NAME"::text, ','::text, 1)::character varying(256)
        END AS claimant_last,
    split_part(a."DRIVER NAME"::text, ' '::text, 2)::character varying(256) AS driver_first,
        CASE
            WHEN a."DRIVER NAME"::text ~~ '% % %'::text THEN split_part(a."DRIVER NAME"::text, ' '::text, 3)::character varying(256)
            ELSE ''::character varying(256)
        END AS driver_middle,
        CASE
            WHEN a."DRIVER NAME"::text ~~ '% % %'::text THEN split_part(a."DRIVER NAME"::text, ','::text, 1)::character varying(256)
            ELSE split_part(a."DRIVER NAME"::text, ','::text, 1)::character varying(256)
        END AS driver_last,
    a."DOL" AS loss_date,
    ''::character varying(256) AS loss_time,
        CASE
            WHEN a."LAG TIME"::text = ''::text THEN a."DOL"
            ELSE ((a."DOL"::date + replace(replace(a."LAG TIME"::text, ','::text, ''::text),'.0','')::integer))::character varying(256)
        END AS report_date,
    a."CLAIM CLOSED DATE" AS closed_date,
    ''::character varying(256) AS reopen_date,
    ''::character varying(256) AS litigation,
    ''::character varying(256) AS days_employed,
    ''::character varying(256) AS claimant_gender,
    ''::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    ''::character varying(256) AS carrier_body_part,
    a."LOSS DESCRIPTION" AS carrier_cause,
    concat('SEL', ' - ', a."LOB", ' - ', a."LOSS DESC CATEGORY", ' - ', a."FINANCIAL ACCT")::character varying(256) AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat('SEL', ' - ', a."POLICY NUMBER", ' - ', a."LOB", ' - ', a."EFF DATE")::character varying(256) AS carrier_policy_number,
    'raw_sel'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_sel a
  WHERE ("POLICY NUMBER"='') IS FALSE;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_sel OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_sel to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_sel to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_sel to rpauser;
GO
GRANT SELECT ON p_and_c.normal_sel to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_sel to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_sel to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_sel to rl_p_and_c_d;
GO