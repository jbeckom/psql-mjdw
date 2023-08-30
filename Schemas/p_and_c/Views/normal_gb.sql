CREATE OR REPLACE VIEW p_and_c.normal_gb
AS SELECT DISTINCT concat('GB', '-', a."CLAIM_NUM")::character varying(256) AS claim_number,
    a."CLAIM_NUM" AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    ((replace(replace(replace(replace(a."EXPENSE_PAID"::text, '$-'::text, '0'::text), ','::text, ''::text), '-'::text, ''::text), '$'::text, ''::text)::numeric + replace(replace(replace(replace(a."REHAB_PAID"::text, '$-'::text, '0'::text), ','::text, ''::text), '-'::text, ''::text), '$'::text, ''::text)::numeric))::character varying(256) AS paid_expense,
    ((replace(replace(replace(replace(a."EXPENSE_RESERVE"::text, '$-'::text, '0'::text), ','::text, ''::text), '-'::text, ''::text), '$'::text, ''::text)::numeric + replace(replace(replace(replace(a."REHAB_RESERVE"::text, '$-'::text, '0'::text), ','::text, ''::text), '-'::text, ''::text), '$'::text, ''::text)::numeric))::character varying(256) AS reserve_expense,
    ((replace(replace(replace(replace(a."INDEMNITY_PAID"::text, '$-'::text, '0'::text), ','::text, ''::text), '-'::text, ''::text), '$'::text, ''::text)::numeric + replace(replace(replace(replace(a."PD_PAID"::text, '$-'::text, '0'::text), ','::text, ''::text), '-'::text, ''::text), '$'::text, ''::text)::numeric))::character varying(256) AS paid_indemnity,
    ((replace(replace(replace(replace(a."MEDICAL_PAID"::text, '$-'::text, '0'::text), ','::text, ''::text), '-'::text, ''::text), '$'::text, ''::text)::numeric + replace(replace(replace(replace(a."BI_PAID"::text, '$-'::text, '0'::text), ','::text, ''::text), '-'::text, ''::text), '$'::text, ''::text)::numeric))::character varying(256) AS paid_medical,
    ((replace(replace(replace(replace(a."INDEMNITY_RESERVE"::text, '$-'::text, '0'::text), ','::text, ''::text), '-'::text, ''::text), '$'::text, ''::text)::numeric + replace(replace(replace(replace(a."PD_RESERVE"::text, '$-'::text, '0'::text), ','::text, ''::text), '-'::text, ''::text), '$'::text, ''::text)::numeric))::character varying(256) AS reserve_indemnity,
    ((replace(replace(replace(replace(a."MEDICAL_RESERVE"::text, '$-'::text, '0'::text), ','::text, ''::text), '-'::text, ''::text), '$'::text, ''::text)::numeric + replace(replace(replace(replace(a."BI_RESERVE"::text, '$-'::text, '0'::text), ','::text, ''::text), '-'::text, ''::text), '$'::text, ''::text)::numeric))::character varying(256) AS reserve_medical,
    replace(replace(replace(replace(a."RECOVERIES"::text, '$-'::text, '0'::text), ','::text, ''::text), '-'::text, ''::text), '$'::text, ''::text)::character varying(256) AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
        CASE
            WHEN a."CLM_STATUS"::text = 'OP'::text THEN 'Open'::character varying(256)
            ELSE
            CASE
                WHEN a."CLM_STATUS"::text = 'CL'::text THEN 'Closed'::character varying(256)
                ELSE a."CLM_STATUS"
            END
        END AS claim_status,
    a."LOSS_DESC" AS description_text,
    a."ACC_ADDRS" AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    a."ACC_CITY" AS claim_city,
    a."BENEFIT_ST" AS claim_state,
    ''::character varying(256) AS claim_zip,
    concat(a."UNITNAME_2", ' - ', a."ACC_ADDRS")::character varying(256) AS claim_site,
    a."BENEFIT_ST" AS benefit_state,
    ''::character varying(256) AS garage_state,
    a."CLMNT_OCCP" AS occupation,
    a."NCCI_JOB" AS class_code,
    a."CLMNT_NAME" AS claimant_name,
    reverse(reverse(btrim(split_part(a."CLMNT_NAME"::text, ' '::text, 1)))) AS claimant_first,
    ''::character varying(256) AS claimant_middle,
    btrim(split_part(a."CLMNT_NAME"::text, ' '::text, 1)) AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    a."ACC_DATE" AS loss_date,
    a."ACC_TIME" AS loss_time,
    a."RPTD_DATE" AS report_date,
    a."CLOSE_DATE" AS closed_date,
    ''::character varying(256) AS reopen_date,
        CASE
            WHEN a."LITIG_FLAG"::text = 'N'::text THEN 'No'::character varying(256)
            ELSE
            CASE
                WHEN a."LITIG_FLAG"::text = 'Y'::text THEN 'Yes'::character varying(256)
                ELSE a."LITIG_FLAG"
            END
        END AS litigation,
    ((a."ACC_DATE"::date - a."HIRE_DATE"::date))::character varying(256) AS days_employed,
        CASE
            WHEN a."CLMNT_SEX"::text = 'M'::text THEN 'Male'::character varying(256)
            ELSE
            CASE
                WHEN a."CLMNT_SEX"::text = 'F'::text THEN 'Female'::character varying(256)
                ELSE ''::character varying(256)
            END
        END AS claimant_gender,
    a."CLMNT_AGE" AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    a."POB_DESC" AS carrier_body_part,
    a."TYPE_DESC" AS carrier_cause,
    concat('GB', ' - ', a."COV_CODE")::character varying(256) AS carrier_coverage_type,
    a."NL_DESC_BI" AS carrier_nature,
    a."NCCI_INJ" AS carrier_injury_code,
    concat('GB', ' - ', a."Company", ' - ', a."COV_CODE", ' - ', a."POLEF_DATE"::date)::character varying(256) AS carrier_policy_number,
    'raw_gb'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_gb a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_gb OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_gb to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_gb to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_gb to rpauser;
GO
GRANT SELECT ON p_and_c.normal_gb to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_gb to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_gb to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_gb to rl_p_and_c_d;
GO