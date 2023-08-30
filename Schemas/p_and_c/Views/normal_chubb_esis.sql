CREATE OR REPLACE VIEW p_and_c.normal_chubb_esis
AS SELECT DISTINCT concat('CHUBB_ESIS', '-', a."CRIS_Claim_Num")::character varying(256) AS claim_number,
    a."CRIS_Claim_Num" AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    a."Paid_Exp" AS paid_expense,
    a."Res_Exp" AS reserve_expense,
    a."Paid_Comp" AS paid_indemnity,
    a."Paid_Med" AS paid_medical,
    a."Res_Comp" AS reserve_indemnity,
    a."Res_Med" AS reserve_medical,
    '0.00'::character varying(256) AS subrogation,
    a."Recovery" AS reimbursed,
        CASE
            WHEN a."Status_Code"::text = 'F'::text THEN 'Closed'::character varying(256)
            ELSE
            CASE
                WHEN a."Status_Code"::text = 'O'::text THEN 'Open'::character varying(256)
                ELSE ''::character varying(256)
            END
        END AS claim_status,
    a."Acc_Desc" AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    a."Jurisdiction_Code" AS claim_state,
    ''::character varying(256) AS claim_zip,
    a."CRIS_LOC_Code" AS claim_site,
    a."State_Code" AS benefit_state,
    a."State_Code" AS garage_state,
    ''::character varying(256) AS occupation,
    a."Job_Class_Code" AS class_code,
    a."Employee_Name" AS claimant_name,
    split_part(split_part(a."Employee_Name"::text, ';'::text, 2), ' '::text, 1) AS claimant_first,
        CASE
            WHEN a."Employee_Name"::text ~~ '% _'::text THEN "right"(a."Employee_Name"::text, 1)::character varying
            ELSE ''::character varying(256)
        END AS claimant_middle,
        CASE
            WHEN a."Employee_Name"::text ~~ '%;%'::text THEN split_part(a."Employee_Name"::text, ';'::text, 1)::character varying
            ELSE ''::character varying(256)
        END AS claimant_last,
    split_part(split_part(a."Employee_Name"::text, ';'::text, 2), ' '::text, 1) AS driver_first,
        CASE
            WHEN a."Employee_Name"::text ~~ '% _'::text THEN "right"(a."Employee_Name"::text, 1)::character varying
            ELSE ''::character varying(256)
        END AS driver_middle,
        CASE
            WHEN a."Employee_Name"::text ~~ '%;%'::text THEN split_part(a."Employee_Name"::text, ';'::text, 1)::character varying
            ELSE ''::character varying(256)
        END AS driver_last,
    a."Accident_Date" AS loss_date,
    ''::character varying(256) AS loss_time,
    a."Report_Date" AS report_date,
    a."Close_Date" AS closed_date,
    ''::character varying(256) AS reopen_date,
    ''::character varying(256) AS litigation,
    ''::character varying(256) AS days_employed,
    a."Sex" AS claimant_gender,
    a."Age" AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    ''::character varying(256) AS carrier_body_part,
    a."Cause_Code" AS carrier_cause,
    a."Claim_Type_Code" AS carrier_coverage_type,
    a."Hazard_Code" AS carrier_nature,
    a."Injury_Code" AS carrier_injury_code,
    concat('CHUBB_ESIS', ' - ', a."Clnt_Id", ' - ', a."Policy_Num", ' - ', a."Policy_Inception_Date")::character varying(256) AS carrier_policy_number,
    'raw_chubb_esis'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_chubb_esis a;
GO

 /*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_chubb_esis OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_chubb_esis to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_chubb_esis to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_chubb_esis to rpauser;
GO
GRANT SELECT ON p_and_c.normal_chubb_esis to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_chubb_esis to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_chubb_esis to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_chubb_esis to rl_p_and_c_d;
GO