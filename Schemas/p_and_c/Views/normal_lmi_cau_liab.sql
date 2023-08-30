CREATE OR REPLACE VIEW p_and_c.normal_lmi_cau_liab
AS SELECT DISTINCT concat('LMI_CAU_Liab', '-', a."Claim Number")::character varying(256) AS claim_number,
    a."Claim Number" AS occurrence_number,
    "right"(a."Claim Number"::text, 2)::character varying(256) AS claimant_number,
    a."Paid Expense" AS paid_expense,
    a."Expense OR" AS reserve_expense,
    a."Paid PD" AS paid_indemnity,
    a."Paid BIMPNF" AS paid_medical,
    a."PD OR" AS reserve_indemnity,
    a."BIMPNF OR" AS reserve_medical,
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
    ''::character varying(256) AS benefit_state,
    a."Garage State" AS garage_state,
    ''::character varying(256) AS occupation,
    ''::character varying(256) AS class_code,
    a."Claimant Name" AS claimant_name,
    split_part(a."Claimant Name"::text, ','::text, 2) AS claimant_first,
    split_part(a."Claimant Name"::text, ' '::text, 2) AS claimant_middle,
    split_part(a."Claimant Name"::text, ','::text, 1) AS claimant_last,
    split_part(a."Insured Driver Name"::text, ','::text, 2) AS driver_first,
    split_part(a."Insured Driver Name"::text, ' '::text, 2) AS driver_middle,
    split_part(a."Insured Driver Name"::text, ','::text, 1) AS driver_last,
    a."Loss Date" AS loss_date,
    ''::character varying(256) AS loss_time,
    a."Carrier Report Date" AS report_date,
    a."Close Date" AS closed_date,
    a."Reopen Date" AS reopen_date,
        CASE
            WHEN a."Litigation Status" IS NULL THEN 'No'::character varying(256)
            ELSE a."Litigation Status"
        END AS litigation,
    ''::character varying(256) AS days_employed,
    ''::character varying(256) AS claimant_gender,
    ''::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    ''::character varying(256) AS carrier_body_part,
    a."Accident Description Code" AS carrier_cause,
    concat('LMI_CAU_Liab', ' - ', 'CAU_Liab', ' - ', a."Exposure Group")::character varying(256) AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat('LMI_CAU_Liab', ' - ',
        CASE
            WHEN ("left"(a."Location"::text, 6)::character varying(256)::text = ANY (ARRAY['CL0020'::character varying::text, 'EL0030'::character varying::text, 'EL0060'::character varying::text, 'EL0040'::character varying::text, 'EL0050'::character varying::text, 'EL0070'::character varying::text, 'GL0022'::character varying::text, 'EL0025'::character varying::text, 'IAH030'::character varying::text, 'LAH000'::character varying::text, 'NOVGB0'::character varying::text, 'NOVLW0'::character varying::text, 'NOVFS0'::character varying::text])) AND (a."Client"::text ~~* '%Eli Lilly%'::text OR a."Client"::text ~~* '%ELILILL%'::text) THEN 'Elanco Animal Health Incorporated'::character varying
            ELSE a."Client"
        END, ' - ', a."Contract Effective Date"::date, ' - ', 'CAU_Liab')::character varying(256) AS carrier_policy_number,
    'raw_lmi_cau_liab'::character varying(256) AS source_table,
    a.uploaded_at
   FROM p_and_c.raw_lmi_cau_liab a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_lmi_cau_liab OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_lmi_cau_liab to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_lmi_cau_liab to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_lmi_cau_liab to rpauser;
GO
GRANT SELECT ON p_and_c.normal_lmi_cau_liab to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_lmi_cau_liab to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_lmi_cau_liab to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_lmi_cau_liab to rl_p_and_c_d;
GO