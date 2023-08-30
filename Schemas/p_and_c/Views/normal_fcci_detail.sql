CREATE OR REPLACE VIEW p_and_c.normal_fcci_detail
AS SELECT DISTINCT concat('FCCI', '-', split_part(a."Claim_Number"::text, '-'::text, 1))::character varying(256) AS claim_number,
    split_part(a."Claim_Number"::text, '-'::text, 1) AS occurrence_number,
    split_part(a."Claim_Number"::text, '-'::text, 2)::character varying(256) AS claimant_number,
    a."Paid_Expenses" AS paid_expense,
    '0.00'::character varying(256) AS reserve_expense,
    a."Paid_Loss_(Indemnity)" AS paid_indemnity,
    a."Paid_Medical" AS paid_medical,
    a."Reserves" AS reserve_indemnity,
    '0.00'::character varying(256) AS reserve_medical,
     a."Subrogation" AS subrogation,
     a."Salvage" AS reimbursed,
        CASE
            WHEN a."Status"::text ~~* 'CLOSED%'::text THEN 'Closed'::character varying(256)
            ELSE 'Open'::character varying(256)
        END AS claim_status,
    concat(a."Claim_Description", ' ', a."Accident_Description") AS description_text,
    split_part(a."Risk_Location"::text, ' ,'::text, 1)::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    btrim(split_part(a."Risk_Location"::text, ' , '::text, 2))::character varying(256) AS claim_city,
    split_part(btrim(split_part(a."Risk_Location"::text, ' , '::text, 3)), ' '::text, 1)::character varying(256) AS claim_state,
    "right"(a."Risk_Location"::text, 5)::character varying(256) AS claim_zip,
        CASE
            WHEN a."Risk_Location" IS NULL THEN a."Business_Department"
            ELSE a."Risk_Location"
        END AS claim_site,
    split_part(btrim(split_part(a."Risk_Location"::text, ' , '::text, 3)), ' '::text, 1)::character varying(256) AS benefit_state,
    split_part(btrim(split_part(a."Risk_Location"::text, ' , '::text, 3)), ' '::text, 1)::character varying(256) AS garage_state,
    a."Claimant_Occupation" AS occupation,
    ''::character varying(256) AS class_code,
    a."Claimant_Name" AS claimant_name,
        CASE
            WHEN a."Claimant_Name"::text ~~ '% % %'::text THEN ''::character varying(256)
            ELSE split_part(a."Claimant_Name"::text, ' '::text, 1)::character varying(256)
        END AS claimant_first,
    ''::character varying(256) AS claimant_middle,
        CASE
            WHEN a."Claimant_Name"::text ~~ '% % %'::text THEN ''::character varying(256)
            ELSE split_part(a."Claimant_Name"::text, ' '::text, 2)::character varying(256)
        END AS claimant_last,
    split_part(a."Insured_Driver"::text, ' '::text, 1)::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    split_part(a."Insured_Driver"::text, ' '::text, 2)::character varying(256) AS driver_last,
    a."Date_of_Loss" AS loss_date,
    ''::character varying(256) AS loss_time,
    a."Reported_Date" AS report_date,
    split_part(a."Status"::text, ' '::text, 2)::character varying(256) AS closed_date,
    ''::character varying(256) AS reopen_date,
    ''::character varying(256) AS litigation,
        CASE
            WHEN a."Hire_Date" IS null or a."Hire_Date" = '' THEN ''::character varying(256)
            ELSE ((a."Date_of_Loss"::date - a."Hire_Date"::date))::character varying(256)
        END AS days_employed,
    ''::character varying(256) AS claimant_gender,
    ''::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    a."Body_Part" AS carrier_body_part,
    a."Accident_Description" AS carrier_cause,
    concat('FCCI', ' - ', "left"(a."Policy_Number"::text, 2), ' - ', a."LOB")::character varying(256) AS carrier_coverage_type,
    a."Nature_of_Injury" AS carrier_nature,
    a."Coverage_Type" AS carrier_injury_code,
    concat('FCCI', ' - ', b."Policyholder Name", ' - ', split_part(a."Policy_Number"::text, '-'::text, 1), ' - ', a."LOB", ' - ', split_part(a."Policy_Period"::text, '-'::text, 1))::character varying(256) AS carrier_policy_number,
    'raw_fcci_detail'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_fcci_detail a
     LEFT JOIN p_and_c.raw_fcci b ON a."Policy_Number"::text = b."Policy"::text
   where a."Policy_Period" is not null 
   and a."Policy_Period" != '';
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_fcci_detail OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_fcci_detail to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_fcci_detail to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_fcci_detail to rpauser;
GO
GRANT SELECT ON p_and_c.normal_fcci_detail to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_fcci_detail to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_fcci_detail to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_fcci_detail to rl_p_and_c_d;
GO