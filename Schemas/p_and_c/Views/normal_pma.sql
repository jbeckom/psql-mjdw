CREATE OR REPLACE VIEW p_and_c.normal_pma
AS SELECT DISTINCT concat('PMA', '-', a."Claim_Number")::character varying(256) AS claim_number,
    a."Claim_Number" AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    ((case when replace(a."Expense_Paid"::text, ','::text, ''::text)='' then 0 else replace(a."Expense_Paid"::text, ','::text, ''::text)::numeric end + case when replace(a."Vocational_Rehabilitation_Paid"::text, ','::text, ''::text)='' then 0 else replace(a."Vocational_Rehabilitation_Paid"::text, ','::text, ''::text)::numeric end))::character varying(256) AS paid_expense,
    ((case when replace(a."Expense_Reserve"::text, ','::text, ''::text)='' then 0 else replace(a."Expense_Reserve"::text, ','::text, ''::text)::numeric end + case when replace(a."Vocational_Rehabilitation_Reserve"::text, ','::text, ''::text)='' then 0 else replace(a."Vocational_Rehabilitation_Reserve"::text, ','::text, ''::text)::numeric end))::character varying(256) AS reserve_expense,
    a."Indemnity_Paid" AS paid_indemnity,
    a."Medical_Paid" AS paid_medical,
    a."Indemnity_Reserve" AS reserve_indemnity,
    a."Medical_Reserve" AS reserve_medical,
    '0.00'::character varying(256) AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
    a."Claim_Status" AS claim_status,
    a."Accident_Description"::character varying(256) AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    a."Accident_State" AS claim_state,
    ''::character varying(256) AS claim_zip,
    a."Location_Name" AS claim_site,
    a."Accident_State" AS benefit_state,
    ''::character varying(256) AS garage_state,
    a."Job_Description" AS occupation,
    ''::character varying(256) AS class_code,
    a."Full_Name" AS claimant_name,
    split_part(a."Full_Name"::text, ', '::text, 2)::character varying(256) AS claimant_first,
    ''::character varying(256) AS claimant_middle,
    split_part(a."Full_Name"::text, ', '::text, 1)::character varying(256) AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    a."Accident_Date" AS loss_date,
    ''::character varying(256) AS loss_time,
    a."Received_Date" AS report_date,
        CASE
            WHEN a."Claim_Status"::text = 'Closed'::text THEN a."Claim_Status_Date"
            ELSE ''::character varying(256)
        END AS closed_date,
        CASE
            WHEN a."Reopen_Flag"::text = 'Y'::text AND a."Claim_Status"::text = 'Open'::text THEN a."Claim_Status_Date"
            ELSE ''::character varying(256)
        END AS reopen_date,
        CASE
            WHEN a."In_Suit_Flag"::text = 'Y'::text THEN 'Yes'::character varying(256)
            ELSE 'No'::character varying(256)
        END AS litigation,
        CASE
            WHEN a."Hire_Date"::text = ''::text THEN ''::character varying(256)
            ELSE ((a."Accident_Date"::date - a."Hire_Date"::date))::character varying(256)
        END AS days_employed,
    ''::character varying(256) AS claimant_gender,
        CASE
            WHEN a."Birth_Date"::text = ''::text THEN ''::character varying(256)
            ELSE (((a."Accident_Date"::date - a."Birth_Date"::date) / 365))::character varying(256)
        END AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    a."Ncci_Part_Desc" AS carrier_body_part,
    a."Ncci_Cause_Desc" AS carrier_cause,
    concat('PMA', ' - ', 'Workers'' Comp', ' - ', 'Workers'' Comp')::character varying(256) AS carrier_coverage_type,
    a."Ncci_Injury_Desc" AS carrier_nature,
    a."Claim_Type" AS carrier_injury_code,
    concat('PMA', ' - ', a."Primary_Account_Name", ' - ', 'Workers'' Comp', ' - ', a."Effective_Date"::date, ' - ', a."Policy_Number")::character varying(256) AS carrier_policy_number,
    'raw_pma'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_pma a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_pma OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_pma to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_pma to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_pma to rpauser;
GO
GRANT SELECT ON p_and_c.normal_pma to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_pma to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_pma to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_pma to rl_p_and_c_d;
GO