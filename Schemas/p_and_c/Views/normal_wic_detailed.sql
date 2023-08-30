CREATE OR REPLACE VIEW p_and_c.normal_wic_detailed
AS SELECT DISTINCT concat('WIC', '-', a."Claim_Number")::character varying(256) AS claim_number,
    a."Claim_Number" AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    '0.00'::character varying(256) AS paid_expense,
    '0.00'::character varying(256) AS reserve_expense,
    a."Cumulative_Paid_Loss:_Non-Medical" AS paid_indemnity,
    a."Cumulative_Paid_Loss:_Medical" AS paid_medical,
    a."Outstanding_Case_Loss_Reserve:_Non-Medical" AS reserve_indemnity,
    a."Outstanding_Case_Loss_Reserve:_Medical" AS reserve_medical,
    ''::character varying(256) AS subrogation,
    a."Cumulative_Deductible_Recoveries" AS reimbursed,
    a."Claim_Loss_Status" AS claim_status,
    a."Claim_Description_*"::character varying(256) AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    ''::character varying(256) AS claim_state,
    ''::character varying(256) AS claim_zip,
    a."Customer_Location_Code" AS claim_site,
    ''::character varying(256) AS benefit_state,
    ''::character varying(256) AS garage_state,
    ''::character varying(256) AS occupation,
    ''::character varying(256) AS class_code,
    a."Primary_Feature_Claimant_Name" AS claimant_name,
    split_part(a."Primary_Feature_Claimant_Name"::text, ' '::text, 1)::character varying(256) AS claimant_first,
        CASE
            WHEN a."Primary_Feature_Claimant_Name"::text ~~ '% % %'::text THEN split_part(a."Primary_Feature_Claimant_Name"::text, ' '::text, 2)::character varying(256)
            ELSE ''::character varying(256)
        END AS claimant_middle,
        CASE
            WHEN a."Primary_Feature_Claimant_Name"::text ~~ '% % %'::text THEN split_part(a."Primary_Feature_Claimant_Name"::text, ' '::text, 3)::character varying(256)
            ELSE split_part(a."Primary_Feature_Claimant_Name"::text, ' '::text, 2)::character varying(256)
        END AS claimant_last,
    split_part(a."Involved_Insured_Driver"::text, ' '::text, 1)::character varying(256) AS driver_first,
        CASE
            WHEN a."Involved_Insured_Driver"::text ~~ '% % %'::text THEN split_part(a."Involved_Insured_Driver"::text, ' '::text, 2)::character varying(256)
            ELSE ''::character varying(256)
        END AS driver_middle,
        CASE
            WHEN a."Involved_Insured_Driver"::text ~~ '% % %'::text THEN split_part(a."Involved_Insured_Driver"::text, ' '::text, 3)::character varying(256)
            ELSE split_part(a."Involved_Insured_Driver"::text, ' '::text, 2)::character varying(256)
        END AS driver_last,
    a."Loss_Date" AS loss_date,
    ''::character varying(256) AS loss_time,
        CASE
            WHEN a."Loss_Date_to_Claim_Reported_Date_(days)"::text = ''::text THEN a."Loss_Date"
            ELSE ((a."Loss_Date"::date + replace(a."Loss_Date_to_Claim_Reported_Date_(days)"::text, ','::text, ''::text)::integer))::character varying(256)
        END AS report_date,
    a."Claim_Closed_Date" AS closed_date,
    ''::character varying(256) AS reopen_date,
    a."Claim_Litigation_Indicator" AS litigation,
        CASE
            WHEN a."Injured_Worker_Date_of_Hire"::text = ''::text THEN ''::character varying(256)
            ELSE ((a."Loss_Date"::date - a."Injured_Worker_Date_of_Hire"::date))::character varying(256)
        END AS days_employed,
    ''::character varying(256) AS claimant_gender,
    ''::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    ''::character varying(256) AS carrier_body_part,
    a."Claim_Loss_Cause" AS carrier_cause,
    concat('WIC', ' - ', a."Claim_Type")::character varying(256) AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat('WIC', ' - ', a."Named_Insured", ' - ', a."Policy_Effective_Date"::date, ' - ', a."Policy_Number", ' - ', a."Claim_Type")::character varying(256) AS carrier_policy_number,
    'raw_wic_detailed'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_wic_detailed a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_wic_detailed OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_wic_detailed to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_wic_detailed to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_wic_detailed to rpauser;
GO
GRANT SELECT ON p_and_c.normal_wic_detailed to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_wic_detailed to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_wic_detailed to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_wic_detailed to rl_p_and_c_d;
GO