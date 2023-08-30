CREATE OR REPLACE VIEW p_and_c.normal_nmic
AS SELECT DISTINCT concat('NMIC', '-', a."Claim_#")::character varying(256) AS claim_number,
    a."Claim_#" AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    a."Expenses" AS paid_expense,
    '0.00'::character varying(256) AS reserve_expense,
    a."Payments" AS paid_indemnity,
    '0.00'::character varying(256) AS paid_medical,
    a."Open_Reserve" AS reserve_indemnity,
    '0.00'::character varying(256) AS reserve_medical,
    a."Recoveries" AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
    a."File_Status" AS claim_status,
    a."Loss_Description"::character varying(256) AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    a."State_Loss_Occurred" AS claim_state,
    ''::character varying(256) AS claim_zip,
    a."Loss_Location" AS claim_site,
    a."Primary_Rate_State" AS benefit_state,
    a."Primary_Rate_State" AS garage_state,
    ''::character varying(256) AS occupation,
    ''::character varying(256) AS class_code,
    a."Claimant" AS claimant_name,
    split_part(a."Claimant"::text, ','::text, 2) AS claimant_first,
    split_part(a."Claimant"::text, ','::text, 3) AS claimant_middle,
    split_part(a."Claimant"::text, ','::text, 1) AS claimant_last,
        CASE
            WHEN a."Driver"::text ~~ '%,%'::text THEN ''::text
            ELSE split_part(a."Driver"::text, ' '::text, 1)
        END AS driver_first,
        CASE
            WHEN a."Driver"::text ~~ '%,%'::text THEN ''::text
            ELSE
            CASE
                WHEN a."Driver"::text ~~ '% % %'::text THEN split_part(a."Driver"::text, ' '::text, 2)
                ELSE NULL::text
            END
        END AS driver_middle,
        CASE
            WHEN a."Driver"::text ~~ '%,%'::text THEN ''::text
            ELSE
            CASE
                WHEN a."Driver"::text ~~ '% % %'::text THEN split_part(a."Driver"::text, ' '::text, 3)
                ELSE split_part(a."Driver"::text, ' '::text, 2)
            END
        END AS driver_last,
    a."Date_of_Loss" AS loss_date,
    ''::character varying(256) AS loss_time,
    a."Date_Reported" AS report_date,
        CASE
            WHEN a."Date_Closed"::text = 'N/A'::text THEN ''::character varying(256)
            ELSE a."Date_Closed"
        END AS closed_date,
    ''::character varying(256) AS reopen_date,
    ''::character varying(256) AS litigation,
    ''::character varying(256) AS days_employed,
    ''::character varying(256) AS claimant_gender,
        CASE
            WHEN a."Age"::text = ANY (ARRAY['N/A'::character varying::text, '000'::character varying::text,'']) THEN ''::character varying(256)
            ELSE replace(a."Age",'.0','')::integer::character varying(256)
        END AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    a."Body_Part_Description" AS carrier_body_part,
        CASE
            WHEN a."LOB"::text = 'Auto'::text THEN concat('Auto', a."Loss_Description")::character varying(256)
            ELSE concat(a."Cause_Category", ' - ', a."Cause_Description")::character varying(256)
        END AS carrier_cause,
        CASE
            WHEN c.claim_number IS NULL THEN concat('NMIC - ', a."LOB", ' - ', 'Needs Mapped')::character varying(256)
            ELSE concat('NMIC - ', a."LOB", ' - ', c.type_of_loss)::character varying(256)
        END AS carrier_coverage_type,
    a."Nature_of_Injury_Description" AS carrier_nature,
    a."Type_of_Payment" AS carrier_injury_code,
    concat('NMIC - ', a."Named_Insured", ' - ', a."Policy_Number", ' - ', a."Policy_Term")::character varying(256) AS carrier_policy_number,
    'raw_nmic'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_nmic a
     LEFT JOIN p_and_c.raw_nmic_supp c ON a."Claim_#"::text = c.claim_number::text;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_nmic OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_nmic to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_nmic to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_nmic to rpauser;
GO
GRANT SELECT ON p_and_c.normal_nmic to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_nmic to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_nmic to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_nmic to rl_p_and_c_d;
GO