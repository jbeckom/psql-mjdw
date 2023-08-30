CREATE OR REPLACE VIEW p_and_c.normal_hartford_treo
AS SELECT DISTINCT concat('HARTFORD', '-', a."Claim_Number")::character varying(256) AS claim_number,
    a."Claim_Number" AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    a."Expense_Paid" AS paid_expense,
    a."Expense_Outstanding" AS reserve_expense,
    a."Indemnity_Paid" AS paid_indemnity,
    a."Medical_Paid" AS paid_medical,
    a."Indemnity_Outstanding" AS reserve_indemnity,
    a."Medical_Outstanding" AS reserve_medical,
    '0.00'::character varying(256) AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
    a."Claim_Status" AS claim_status,
    a."Accident_Description_-_Details" AS description_text,
    a."Loss_Location_Address" AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    a."Accident_City/Town" AS claim_city,
    a."Accident_State" AS claim_state,
    a."Accident_ZIP_Code" AS claim_zip,
    a."Hierarchy_of_Locations_-_Level_2_(Current)" AS claim_site,
    a."Benefit_State" AS benefit_state,
    a."Risk_State" AS garage_state,
    a."Claimant_Occupation" AS occupation,
    a."NCCI_Codes" AS class_code,
    a."Claimant_Name" AS claimant_name,
        CASE
            WHEN a."Claimant_Name"::text ~~ '% % %'::text THEN split_part(a."Claimant/Insured_Driver_Name"::text, ' '::text, 2)
            ELSE split_part(a."Claimant_Name"::text, ' '::text, 2)
        END AS claimant_first,
    ''::character varying(256) AS claimant_middle,
        CASE
            WHEN a."Claimant_Name"::text ~~ '% % %'::text THEN split_part(a."Claimant/Insured_Driver_Name"::text, ' '::text, 1)
            ELSE split_part(a."Claimant_Name"::text, ' '::text, 1)
        END AS claimant_last,
    split_part(a."Driver_Name_-_Insured"::text, ' '::text, 1) AS driver_first,
    ''::character varying(256) AS driver_middle,
    split_part(a."Driver_Name_-_Insured"::text, ' '::text, 2) AS driver_last,
    a."Accident_Date" AS loss_date,
        CASE
            WHEN a."Accident_Time"::text = '08A'::text THEN '08:00AM'::character varying(256)
            ELSE a."Accident_Time"
        END AS loss_time,
    a."Reported_to_Carrier_Date" AS report_date,
    a."Closed_Date" AS closed_date,
    ''::character varying(256) AS reopen_date,
        CASE
            WHEN a."Legal_Action" IS NULL THEN 'No'::character varying(256)
            WHEN a."Legal_Action"::text = ''::text THEN 'No'::character varying(256)
            ELSE 'Yes'::character varying(256)
        END AS litigation,
        CASE
            WHEN a."Claimant_Hire_Date"::text = ''::text THEN ''::character varying
            ELSE ((a."Accident_Date"::date - a."Claimant_Hire_Date"::date))::character varying(256)
        END AS days_employed,
    a."Claimant_Gender" AS claimant_gender,
        CASE
            WHEN a."Claimant_Birth_Date"::text = ''::text THEN ''::character varying(256)
            ELSE (((a."Accident_Date"::date - a."Claimant_Birth_Date"::date) / 365))::character varying(256)
        END AS claimant_age,
    "right"(split_part(a."Hierarchy_of_Locations_-_Level_4_(Current)"::text, '/'::text, 2), 1)::character varying(256) AS claimant_shift,
    a."Supervisor_Name" AS claimant_supervisor,
    a."WC_Body_Part_Code" AS carrier_body_part,
        CASE
            WHEN a."Line_of_Business"::text = 'WC'::text THEN concat(a."WC_Cause_of_Injury_Code", '-', a."WC_Cause_of_Injury_Description")::character varying(256)
            ELSE a."Claim_Description"
        END AS carrier_cause,
    concat('HARTFORD', ' - ', a."Line_of_Business", ' - ', a."Coverage_Identification_Code", ' - ', a."BI/PD_Indicator")::character varying(256) AS carrier_coverage_type,
    a."WC_Nature_of_Injury_Code" AS carrier_nature,
    a."Injury_Severity_Code" AS carrier_injury_code,
    concat('HARTFORD', ' - ', a."Account_Name", ' - ', a."Line_of_Business", ' - ', a."Policy_Period", ' - ', a."Policy_Number")::character varying(256) AS carrier_policy_number,
    'raw_hartford_treo'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_hartford_treo a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_hartford_treo OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_hartford_treo to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_hartford_treo to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_hartford_treo to rpauser;
GO
GRANT SELECT ON p_and_c.normal_hartford_treo to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_hartford_treo to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_hartford_treo to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_hartford_treo to rl_p_and_c_d;
GO