CREATE OR REPLACE VIEW p_and_c.normal_jwf
AS SELECT DISTINCT concat('JWF', '-', a."Claim_Number")::character varying(256) AS claim_number,
    a."Claim_Number" AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    ((replace(a."Legal_Paid"::text, ','::text, ''::text)::numeric + replace(a."Legal_Recoveries"::text, ','::text, ''::text)::numeric + replace(a."Other_Paid"::text, ','::text, ''::text)::numeric))::character varying(256) AS paid_expense,
    ((replace(a."Legal_Reserve"::text, ','::text, ''::text)::numeric + (+ replace(a."Other_Reserve"::text, ','::text, ''::text)::numeric)))::character varying(256) AS reserve_expense,
    ((replace(a."Indemnity_Paid"::text, ','::text, ''::text)::numeric + replace(a."Indemnity_Recoveries"::text, ','::text, ''::text)::numeric))::character varying(256) AS paid_indemnity,
    ((replace(a."Medical_Paid"::text, ','::text, ''::text)::numeric + replace(a."Medical_Recoveries"::text, ','::text, ''::text)::numeric + replace(a."Rehab_Paid"::text, ','::text, ''::text)::numeric + replace(a."Rehab_Recoveries"::text, ','::text, ''::text)::numeric))::character varying(256) AS paid_medical,
    replace(a."Indemnity_Reserve"::text, ','::text, ''::text)::character varying(256) AS reserve_indemnity,
    ((replace(a."Medical_Reserve"::text, ','::text, ''::text)::numeric + replace(a."Rehab_Reserve"::text, ','::text, ''::text)::numeric))::character varying(256) AS reserve_medical,
    ((replace(a."Other_Recoveries"::text, ','::text, ''::text)::numeric + replace(a."Total_Recoveries"::text, ','::text, ''::text)::numeric))::character varying(256) AS subrogation,
    ''::character varying(256) AS reimbursed,
    a."Claimant_Status" AS claim_status,
    a."Incident_Description" AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    'IN'::character varying(256) AS claim_state,
    ''::character varying(256) AS claim_zip,
    a."Org_Level_1" AS claim_site,
    'IN'::character varying(256) AS benefit_state,
    ''::character varying(256) AS garage_state,
    a."Occupation" AS occupation,
    a."Class_Code" AS class_code,
    a."Claimant_Name" AS claimant_name,
    split_part(split_part(a."Claimant_Name"::text, ', '::text, 2), ' '::text, 1) AS claimant_first,
    split_part(split_part(a."Claimant_Name"::text, ', '::text, 2), ' '::text, 2) AS claimant_middle,
    split_part(a."Claimant_Name"::text, ', '::text, 1) AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    a."Incident_Date"::date::character varying(256) AS loss_date,
    split_part(a."Incident_Date"::text, ' '::text, 2)::character varying(256) AS loss_time,
    a."Adjusting_Location_Received_Date" AS report_date,
    a."Closed_Date" AS closed_date,
    ''::character varying(256) AS reopen_date,
    a."Litigated" AS litigation,
    ((a."Incident_Date"::date - a."Hire_Date"::date))::character varying(256) AS days_employed,
    a."Sex" AS claimant_gender,
    ((a."Incident_Date"::date - a."Birth_Date"::date))::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    a."Body_Part" AS carrier_body_part,
    a."Claim_Cause" AS carrier_cause,
    concat('JWF', ' - ', 'Workers'' Comp')::character varying(256) AS carrier_coverage_type,
    a."Nature_of_Injury" AS carrier_nature,
    a."Claimant_Type" AS carrier_injury_code,
    concat('JWF', ' - ', a."Insured_Name", ' - ', 'Workers'' Comp', ' - ', a."Incident_Date"::date)::character varying(256) AS carrier_policy_number,
    'raw_jwf'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_jwf a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_jwf OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_jwf to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_jwf to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_jwf to rpauser;
GO
GRANT SELECT ON p_and_c.normal_jwf to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_jwf to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_jwf to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_jwf to rl_p_and_c_d;
GO