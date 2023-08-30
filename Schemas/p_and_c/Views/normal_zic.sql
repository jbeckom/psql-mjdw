CREATE OR REPLACE VIEW p_and_c.normal_zic
AS SELECT DISTINCT concat('ZIC', '-', a."Claim_Number")::character varying(256) AS claim_number,
    a."Claim_Number" AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    a."Paid_Expense" AS paid_expense,
    a."Reserves_Expense" AS reserve_expense,
    a."Paid_Indemnity_PD/LT" AS paid_indemnity,
    a."Paid_Indemnity_BI/Med" AS paid_medical,
    a."Reserves_Indemnity_PD/LT" AS reserve_indemnity,
    a."Reserves_Indemnity_BI/Med" AS reserve_medical,
    a."Claim_Recovery_Total" AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
        CASE
            WHEN a."Claim_Setup_Type_Description"::text = 'Let Rest'::text THEN 'Closed'::character varying(256)
            ELSE
            CASE
                WHEN a."Claim_Status_Description"::text = 'Opened'::text THEN 'Open'::character varying(256)
                ELSE a."Claim_Status_Description"
            END
        END AS claim_status,
    a."Accident_Narrative" AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    a."Loss_Location_State" AS claim_state,
    ''::character varying(256) AS claim_zip,
    a."Site_Lowest" AS claim_site,
    a."Jurisdiction_State" AS benefit_state,
    ''::character varying(256) AS garage_state,
    a."Claimant_Injury_Occupation" AS occupation,
    ''::character varying(256) AS class_code,
    a."Claimant_Name" AS claimant_name,
        CASE
            WHEN a."Claimant_Name"::text ~~* '%inc%'::text THEN ''::character varying(256)
            WHEN a."Claimant_Name"::text ~~* '%.%'::text THEN ''::character varying(256)
            ELSE split_part(split_part(a."Claimant_Name"::text, ', '::text, 2), ' '::text, 1)::character varying(256)
        END AS claimant_first,
        CASE
            WHEN a."Claimant_Name"::text ~~* '%inc%'::text THEN ''::character varying(256)
            WHEN a."Claimant_Name"::text ~~* '%.%'::text THEN ''::character varying(256)
            ELSE split_part(split_part(a."Claimant_Name"::text, ', '::text, 2), ' '::text, 2)::character varying(256)
        END AS claimant_middle,
        CASE
            WHEN a."Claimant_Name"::text ~~* '%inc%'::text THEN ''::character varying(256)
            WHEN a."Claimant_Name"::text ~~* '%.%'::text THEN ''::character varying(256)
            ELSE split_part(a."Claimant_Name"::text, ','::text, 1)::character varying(256)
        END AS claimant_last,
        CASE
            WHEN a."Vehicle_Driver_Name"::text ~~* '%;%'::text THEN ''::character varying(256)
            WHEN a."Vehicle_Driver_Name"::text ~~* '%.%'::text THEN ''::character varying(256)
            ELSE split_part(a."Vehicle_Driver_Name"::text, ' '::text, 1)::character varying(256)
        END AS driver_first,
        CASE
            WHEN a."Vehicle_Driver_Name"::text ~~* '%;%'::text THEN ''::character varying(256)
            WHEN a."Vehicle_Driver_Name"::text ~~* '%.%'::text THEN ''::character varying(256)
            WHEN a."Vehicle_Driver_Name"::text ~~ '% % %'::text THEN split_part(a."Vehicle_Driver_Name"::text, ' '::text, 2)::character varying(256)
            ELSE ''::character varying(256)
        END AS driver_middle,
        CASE
            WHEN a."Vehicle_Driver_Name"::text ~~* '%;%'::text THEN ''::character varying(256)
            WHEN a."Vehicle_Driver_Name"::text ~~* '%.%'::text THEN ''::character varying(256)
            WHEN a."Vehicle_Driver_Name"::text ~~ '% % %'::text THEN split_part(a."Vehicle_Driver_Name"::text, ' '::text, 3)::character varying(256)
            ELSE split_part(a."Vehicle_Driver_Name"::text, ' '::text, 2)::character varying(256)
        END AS driver_last,
    a."Date_of_Loss_-_Formatted" AS loss_date,
    ''::character varying(256) AS loss_time,
    a."Date_Reported_to_ZA_-_Formatted" AS report_date,
        CASE
            WHEN a."Claim_Closed_Date_-_Formatted"::text = '00/00/0000'::text THEN NULL::character varying(256)
            ELSE a."Claim_Closed_Date_-_Formatted"
        END AS closed_date,
    ''::character varying(256) AS reopen_date,
        CASE
            WHEN a."Legal_Activity_Suit_Indicator"::text = ANY (ARRAY['N'::character varying::text, NULL::character varying::text]) THEN 'No'::character varying(256)
            ELSE 'Yes'::character varying(256)
        END AS litigation,
    ''::character varying(256) AS days_employed,
    ''::character varying(256) AS claimant_gender,
    ''::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    a."Body_Part" AS carrier_body_part,
    a."Accident_Description_Corporate" AS carrier_cause,
    concat('ZIC', ' - ', a."Claim_Level_Coverage")::character varying(256) AS carrier_coverage_type,
    a."NCCI_Nature_of_Injury" AS carrier_nature,
        CASE
            WHEN COALESCE(a."Claim_Level_Coverage", ''::character varying)::text !~~* '%WORKERS COMP%'::character varying(256)::text THEN NULL::character varying(256)
            ELSE
            CASE
                WHEN a."Claim_Level_Coverage"::text ~~* '%MEDICAL ONLY%'::text THEN '6'::character varying(256)
                ELSE '5'::character varying(256)
            END
        END AS carrier_injury_code,
    concat('ZIC', ' - ', a."Customer_Name", ' - ', a."Policy_Identifier", ' - ', a."Policy_Effective_Date_-_Formatted", ' - ', a."Coverage")::character varying(256) AS carrier_policy_number,
    'raw_zic'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_zic a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_zic OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_zic to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_zic to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_zic to rpauser;
GO
GRANT SELECT ON p_and_c.normal_zic to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_zic to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_zic to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_zic to rl_p_and_c_d;
GO