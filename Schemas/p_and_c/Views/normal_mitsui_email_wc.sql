CREATE OR REPLACE VIEW p_and_c.normal_mitsui_email_wc
AS SELECT DISTINCT concat('MITSUI', '-', a."Claim_Number")::character varying(256) AS claim_number,
    a."Claim_Number" AS occurrence_number,
    "right"(a."Claim_Number"::text, 2)::character varying(256) AS claimant_number,
    a."DCC_Paid" AS expense_paid,
    a."DCC_Res" AS expense_reserve,
    a."Ind_Paid" AS paid_indemnity,
    a."Med_Paid" AS paid_medical,
    a."Ind_Res" AS reserve_indemnity,
    a."Med_Res" AS reserve_medical,
    a."_Recov" AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
    a."Status" AS claim_status,
    a."Claim_Description" AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    a."State" AS claim_state,
    ''::character varying(256) AS claim_zip,
    a."Loc_1" AS claim_site,
    a."State" AS benefit_state,
    ''::character varying(256) AS garage_state,
    ''::character varying(256) AS occupation,
    ''::character varying(256) AS class_code,
    a."Claimant_Name" AS claimant_name,
    split_part(split_part(a."Claimant_Name"::text, ', '::text, 2), ' '::text, 1) AS claimant_first,
    split_part(split_part(a."Claimant_Name"::text, ', '::text, 2), ' '::text, 2) AS claimant_middle,
    split_part(a."Claimant_Name"::text, ', '::text, 1) AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    a."Date_of_Loss" AS loss_date,
    ''::character varying(256) AS loss_time,
    a."Date_Reported" AS report_date,
    a."Date_Closed" AS closed_date,
    ''::character varying(256) AS reopen_date,
        CASE
            WHEN a."Lit"::text = 'N'::text THEN 'No'::character varying(256)
            ELSE 'Yes'::character varying(256)
        END AS litigation,
    ''::character varying(256) AS days_employed,
    ''::character varying(256) AS claimant_gender,
    ''::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    a."Body_Part" AS carrier_body_part,
    a."Cause_of_Injury" AS carrier_cause,
    concat('MITSUI', ' - ', 'WC')::character varying(256) AS carrier_coverage_type,
    a."Nature_of_Injury" AS carrier_nature,
        CASE
            WHEN (replace(replace(a."Ind_Paid"::text, '$'::text, ''::text), ','::text, ''::text)::numeric + replace(replace(a."Ind_Res"::text, '$'::text, ''::text), ','::text, ''::text)::numeric) > 0::numeric THEN '5'::character varying(256)
            ELSE '6'::character varying(256)
        END AS carrier_injury_code,
    concat('MITSUI', ' - ', a."Insured_name", ' - ', a."Policy_Number", ' - ', 'WC', ' - ', a."Eff_Date")::character varying(256) AS carrier_policy_number,
    'raw_mitsui_email_wc'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_mitsui_email_wc a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_mitsui_email_wc OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_mitsui_email_wc to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_mitsui_email_wc to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_mitsui_email_wc to rpauser;
GO
GRANT SELECT ON p_and_c.normal_mitsui_email_wc to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_mitsui_email_wc to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_mitsui_email_wc to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_mitsui_email_wc to rl_p_and_c_d;
GO