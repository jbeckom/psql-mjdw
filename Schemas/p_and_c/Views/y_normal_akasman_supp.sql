CREATE OR REPLACE VIEW p_and_c.y_normal_akasman_supp
AS SELECT DISTINCT concat('GB', '-', a."CLAIM_NUM")::character varying(256) AS claim_number,
    replace(replace(replace(replace(a."EXPENSE_PAID"::text, '$-'::text, '0'::text), ','::text, ''::text), '-'::text, ''::text), '$'::text, ''::text)::character varying(256) AS "Paid Expense",
    replace(replace(replace(replace(a."EXPENSE_RESERVE"::text, '$-'::text, '0'::text), ','::text, ''::text), '-'::text, ''::text), '$'::text, ''::text)::character varying(256) AS "Reserve Expense",
    replace(replace(replace(replace(a."REHAB_PAID"::text, '$-'::text, '0'::text), ','::text, ''::text), '-'::text, ''::text), '$'::text, ''::text)::character varying(256) AS "Paid Rehab",
    replace(replace(replace(replace(a."REHAB_RESERVE"::text, '$-'::text, '0'::text), ','::text, ''::text), '-'::text, ''::text), '$'::text, ''::text)::character varying(256) AS "Reserve Rehab",
    replace(replace(replace(replace(a."INDEMNITY_PAID"::text, '$-'::text, '0'::text), ','::text, ''::text), '-'::text, ''::text), '$'::text, ''::text)::character varying(256) AS "Paid Indemnity",
    replace(replace(replace(replace(a."INDEMNITY_RESERVE"::text, '$-'::text, '0'::text), ','::text, ''::text), '-'::text, ''::text), '$'::text, ''::text)::character varying(256) AS "Reserve Indemnity",
    replace(replace(replace(replace(a."MEDICAL_PAID"::text, '$-'::text, '0'::text), ','::text, ''::text), '-'::text, ''::text), '$'::text, ''::text)::character varying(256) AS "Paid Medical",
    replace(replace(replace(replace(a."MEDICAL_RESERVE"::text, '$-'::text, '0'::text), ','::text, ''::text), '-'::text, ''::text), '$'::text, ''::text)::character varying(256) AS "Reserve Medical",
    replace(replace(replace(replace(a."EXPENSE_RECOVERY"::text, '$-'::text, '0'::text), ','::text, ''::text), '-'::text, ''::text), '$'::text, ''::text)::character varying(256) AS "Recovery Expense",
    replace(replace(replace(replace(a."REHAB_RECOVERY"::text, '$-'::text, '0'::text), ','::text, ''::text), '-'::text, ''::text), '$'::text, ''::text)::character varying(256) AS "Recovery Rehab",
    replace(replace(replace(replace(a."INDEMNITY_RECOVERY"::text, '$-'::text, '0'::text), ','::text, ''::text), '-'::text, ''::text), '$'::text, ''::text)::character varying(256) AS "Recovery Indemnity",
    replace(replace(replace(replace(a."MEDICAL_RECOVERY"::text, '$-'::text, '0'::text), ','::text, ''::text), '-'::text, ''::text), '$'::text, ''::text)::character varying(256) AS "Recovery Medical",
        CASE
            WHEN a."EMP_STATUS"::text = 'F'::text THEN 'Full Time'::character varying(256)
            ELSE 'Part Time'::character varying(256)
        END AS "Employment Type",
        CASE
            WHEN a."SRGRY_FLAG"::text = 'Y'::text THEN 'Yes'::character varying(256)
            ELSE 'No'::character varying(256)
        END AS "Surgery"
   FROM p_and_c.raw_gb a
     LEFT JOIN p_and_c.raw_gb b ON a."CLAIM_NUM"::text = b."CLAIM_NUM"::text AND a.uploaded_at < b.uploaded_at
  WHERE b.uploaded_at IS NULL AND a.uploaded_at IS NOT NULL
UNION
 SELECT DISTINCT concat('PMA', '-', a."Claim_Number")::character varying(256) AS claim_number,
    replace(replace(replace(replace(a."Expense_Paid"::text, '$-'::text, '0'::text), ','::text, ''::text), '-'::text, ''::text), '$'::text, ''::text)::character varying(256) AS "Paid Expense",
    replace(replace(replace(replace(a."Expense_Reserve"::text, '$-'::text, '0'::text), ','::text, ''::text), '-'::text, ''::text), '$'::text, ''::text)::character varying(256) AS "Reserve Expense",
    replace(replace(replace(replace(a."Vocational_Rehabilitation_Paid"::text, '$-'::text, '0'::text), ','::text, ''::text), '-'::text, ''::text), '$'::text, ''::text)::character varying(256) AS "Paid Rehab",
    replace(replace(replace(replace(a."Vocational_Rehabilitation_Reserve"::text, '$-'::text, '0'::text), ','::text, ''::text), '-'::text, ''::text), '$'::text, ''::text)::character varying(256) AS "Reserve Rehab",
    replace(replace(replace(replace(a."Indemnity_Paid"::text, '$-'::text, '0'::text), ','::text, ''::text), '-'::text, ''::text), '$'::text, ''::text)::character varying(256) AS "Paid Indemnity",
    replace(replace(replace(replace(a."Indemnity_Reserve"::text, '$-'::text, '0'::text), ','::text, ''::text), '-'::text, ''::text), '$'::text, ''::text)::character varying(256) AS "Reserve Indemnity",
    replace(replace(replace(replace(a."Medical_Paid"::text, '$-'::text, '0'::text), ','::text, ''::text), '-'::text, ''::text), '$'::text, ''::text)::character varying(256) AS "Paid Medical",
    replace(replace(replace(replace(a."Medical_Reserve"::text, '$-'::text, '0'::text), ','::text, ''::text), '-'::text, ''::text), '$'::text, ''::text)::character varying(256) AS "Reserve Medical",
    '0.00'::character varying(256) AS "Recovery Expense",
    '0.00'::character varying(256) AS "Recovery Rehab",
    '0.00'::character varying(256) AS "Recovery Indemnity",
    '0.00'::character varying(256) AS "Recovery Medical",
    ''::character varying(256) AS "Employment Type",
    ''::character varying(256) AS "Surgery"
   FROM p_and_c.raw_pma a
     LEFT JOIN p_and_c.raw_pma b ON a."Claim_Number"::text = b."Claim_Number"::text AND a.uploaded_at < b.uploaded_at
  WHERE b.uploaded_at IS NULL AND a.uploaded_at IS NOT NULL;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.y_normal_akasman_supp OWNER TO mj_admin;
GO

Grant select on table p_and_c.y_normal_akasman_supp to rl_pc_data_analyst;
GO

Grant select on table p_and_c.y_normal_akasman_supp to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.y_normal_akasman_supp to rpauser;
GO
GRANT SELECT ON p_and_c.y_normal_akasman_supp to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.y_normal_akasman_supp to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.y_normal_akasman_supp to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.y_normal_akasman_supp to rl_p_and_c_d;
GO