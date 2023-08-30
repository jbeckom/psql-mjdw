CREATE OR REPLACE VIEW p_and_c.normal_copic
AS SELECT DISTINCT concat('COPIC', '-', a."Claim_Number")::character varying(256) AS claim_number,
    a."Claim_Number" AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    '0.00'::character varying(256) AS paid_expense,
    '0.00'::character varying(256) AS reserve_expense,
    a."Indemnity_Paid" AS paid_indemnity,
    a."Medical_Paid" AS paid_medical,
    a."Remaining_Indemnity_Reserve" AS reserve_indemnity,
    a."Remaining_Medical_Reserve" AS reserve_medical,
    '0.00'::character varying(256) AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
    a."Claim_State" AS claim_status,
    ''::character varying(256) AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    a."State" AS claim_state,
    ''::character varying(256) AS claim_zip,
    a."Risk_Location_Number" AS claim_site,
    a."State" AS benefit_state,
    ''::character varying(256) AS garage_state,
    a."Workclass_Code" AS occupation,
    a."Workclass_Code" AS class_code,
    a."Claimant_Name" AS claimant_name,
        CASE
            WHEN a."Claimant_Name"::text ~~ '%,%'::text THEN split_part(split_part(a."Claimant_Name"::text, ', '::text, 2), ' '::text, 1)
            ELSE split_part(a."Claimant_Name"::text, ' '::text, 1)
        END AS claimant_first,
        CASE
            WHEN a."Claimant_Name"::text ~~ '% _ %'::text THEN split_part(a."Claimant_Name"::text, ' '::text, 2)
            ELSE
            CASE
                WHEN a."Claimant_Name"::text ~~ '% _'::text OR a."Claimant_Name"::text ~~ '% __'::text THEN split_part(a."Claimant_Name"::text, ' '::text, 3)
                ELSE NULL::text
            END
        END AS claimant_middle,
        CASE
            WHEN a."Claimant_Name"::text ~~ '%,%'::text THEN split_part(a."Claimant_Name"::text, ', '::text, 1)
            ELSE
            CASE
                WHEN a."Claimant_Name"::text ~~ '% % %'::text THEN split_part(a."Claimant_Name"::text, ' '::text, 3)
                ELSE
                CASE
                    WHEN a."Claimant_Name"::text ~~ '%  %'::text THEN split_part(a."Claimant_Name"::text, '  '::text, 2)
                    ELSE split_part(a."Claimant_Name"::text, ' '::text, 2)
                END
            END
        END AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    a."Accident_Date" AS loss_date,
    concat(a."Injury_Hour_of_Day", ':00:00')::character varying(256) AS loss_time,
    a."Reported_Date" AS report_date,
    a."Claim_Closed_Date" AS closed_date,
    ''::character varying(256) AS reopen_date,
    ''::character varying(256) AS litigation,
        CASE
            WHEN a."Claimant_Hired_Date"::text = ''::text THEN ''::character varying(256)
            ELSE ((a."Accident_Date"::date - a."Claimant_Hired_Date"::date))::character varying(256)
        END AS days_employed,
    ''::character varying(256) AS claimant_gender,
    a."Claimant_Age_on_Accident_Date" AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    a."Part_of_Body" AS carrier_body_part,
    concat(a."Cause_of_Loss_Category", ' - ', a."Cause_of_Loss")::character varying(256) AS carrier_cause,
    concat('COPIC', ' - ', 'Workers'' Comp', ' - ', 'Workers'' Comp')::character varying(256) AS carrier_coverage_type,
    a."Nature_of_Injury" AS carrier_nature,
        CASE
            WHEN replace(replace(a."Indemnity_Paid"::text, '$'::text, ''::text), ','::text, ''::text)::numeric > 0::numeric THEN '5'::character varying(256)
            ELSE
            CASE
                WHEN replace(replace(a."Remaining_Indemnity_Reserve"::text, '$'::text, ''::text), ','::text, ''::text)::numeric > 0::numeric THEN '5'::character varying(256)
                ELSE '6'::character varying(256)
            END
        END AS carrier_injury_code,
    concat('COPIC', ' - ', a.filename, ' - ', 'Workers'' Comp', ' - ', a."Accident_Date"::date)::character varying(256) AS carrier_policy_number,
    'raw_copic'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_copic a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_copic OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_copic to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_copic to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_copic to rpauser;
GO
GRANT SELECT ON p_and_c.normal_copic to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_copic to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_copic to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_copic to rl_p_and_c_d;
GO