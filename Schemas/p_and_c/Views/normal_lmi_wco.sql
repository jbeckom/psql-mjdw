CREATE OR REPLACE VIEW p_and_c.normal_lmi_wco
AS SELECT DISTINCT concat('LMI_WCO', '-', a."Claim Number")::character varying(256) AS claim_number,
    a."Claim Number" AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    a."Paid Expense" AS paid_expense,
    a."Expense OR" AS reserve_expense,
    a."Paid Indemnity" AS paid_indemnity,
    a."Paid Medical" AS paid_medical,
    a."Indemnity OR" AS reserve_indemnity,
    a."Medical OR" AS reserve_medical,
    a."Applied Recovery" AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
    a."Status" AS claim_status,
    a."Accident Description" AS description_text,
    "right"(a."Location"::text, length(a."Location"::text) - 9)::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    a."Accident State" AS claim_state,
    ''::character varying(256) AS claim_zip,
    "left"(a."Location"::text, 6)::character varying(256) AS claim_site,
    a."Bureau State" AS benefit_state,
    ''::character varying(256) AS garage_state,
    ''::character varying(256) AS occupation,
    ''::character varying(256) AS class_code,
    a."Claimant Name" AS claimant_name,
    split_part(split_part(a."Claimant Name"::text, ','::text, 2), ' '::text, 1) AS claimant_first,
    split_part(split_part(a."Claimant Name"::text, ','::text, 2), ' '::text, 2) AS claimant_middle,
    split_part(a."Claimant Name"::text, ','::text, 1) AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    a."Loss Date" AS loss_date,
    ''::character varying(256) AS loss_time,
    a."Carrier Report Date" AS report_date,
    a."Date Closed" AS closed_date,
    a."Date Reopened" AS reopen_date,
        CASE
            WHEN a."Litigation Status" IS NULL THEN 'No'::character varying(256)
            ELSE a."Litigation Status"
        END AS litigation,
        CASE
            WHEN a."Date of Hire" IS NULL THEN ''::character varying(256)
            ELSE
            CASE
                WHEN a."Date of Hire"::text in ('',' ') THEN ''::character varying(256)
                ELSE ((a."Loss Date"::date - a."Date of Hire"::date))::character varying(256)
            END
        END AS days_employed,
    ''::character varying(256) AS claimant_gender,
    ''::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    a."NCCI Part of Body" AS carrier_body_part,
    a."Cause" AS carrier_cause,
    concat('LMI_WCO', ' - ', 'WCO')::character varying(256) AS carrier_coverage_type,
    a."NCCI Nature of Injury" AS carrier_nature,
        CASE
            WHEN a."Lost Time Days"::integer > 0 THEN '5'::character varying(256)
            ELSE '6'::character varying(256)
        END AS carrier_injury_code,
    concat('LMI_WCO', ' - ',
        CASE
            WHEN ("left"(a."Location"::text, 6)::character varying(256)::text = ANY (ARRAY['CL0020'::character varying::text, 'EL0030'::character varying::text, 'EL0060'::character varying::text, 'EL0040'::character varying::text, 'EL0050'::character varying::text, 'EL0070'::character varying::text, 'GL0022'::character varying::text, 'EL0025'::character varying::text, 'IAH030'::character varying::text, 'LAH000'::character varying::text, 'NOVGB0'::character varying::text, 'NOVLW0'::character varying::text, 'NOVFS0'::character varying::text])) AND (a."Client"::text ~~* '%Eli Lilly%'::text OR a."Client"::text ~~* '%ELILILL%'::text) THEN 'Elanco Animal Health Incorporated'::character varying
            ELSE a."Client"
        END, ' - ', a."Contract Effective Date", ' - ', 'WC')::character varying(256) AS carrier_policy_number,
    'raw_lmi_wco'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_lmi_wco a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_lmi_wco OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_lmi_wco to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_lmi_wco to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_lmi_wco to rpauser;
GO
GRANT SELECT ON p_and_c.normal_lmi_wco to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_lmi_wco to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_lmi_wco to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_lmi_wco to rl_p_and_c_d;
GO