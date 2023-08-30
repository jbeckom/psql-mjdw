CREATE OR REPLACE VIEW p_and_c.normal_ahict
AS SELECT DISTINCT concat('AHICT', '-', a."CLAIM_NBR")::character varying(256) AS claim_number,
    a."CLAIM_NBR" AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    a."EXP_PAID" AS paid_expense,
    a."EXP_RESERVE" AS reserve_expense,
    a."IND_PAID" AS paid_indemnity,
    a."MED_PAID" AS paid_medical,
    a."IND_RESERVE" AS reserve_indemnity,
    a."MED_RESERVE" AS reserve_medical,
    a."SUBRO_REC" AS subrogation,
    a."SALVAGE_REC" AS reimbursed,
        CASE
            WHEN a."CLAIM_STATUS"::text = 'OPEN'::text THEN 'Open'::character varying(256)
            ELSE
            CASE
                WHEN a."CLAIM_STATUS"::text = 'CLOSED'::text THEN 'Closed'::character varying(256)
                ELSE a."CLAIM_STATUS"
            END
        END AS claim_status,
    a."ACC_DESC" AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    a."ACC_CITY" AS claim_city,
    a."ACC_STATE" AS claim_state,
    ''::character varying(256) AS claim_zip,
    a."ACC_LOCATION" AS claim_site,
    a."INSURED_STATE" AS benefit_state,
    a."INSURED_STATE" AS garage_state,
    ''::character varying(256) AS occupation,
    ''::character varying(256) AS class_code,
    a."RESERVE_CLAIMANT_NAME" AS claimant_name,
        CASE
            WHEN a."RESERVE_CLAIMANT_NAME"::text ~~ '% % %'::text THEN ''::character varying(256)
            ELSE split_part(a."RESERVE_CLAIMANT_NAME"::text, ' '::text, 2)::character varying(256)
        END AS claimant_first,
    ''::character varying(256) AS claimant_middle,
        CASE
            WHEN a."RESERVE_CLAIMANT_NAME"::text ~~ '% % %'::text THEN a."RESERVE_CLAIMANT_NAME"
            ELSE split_part(a."RESERVE_CLAIMANT_NAME"::text, ' '::text, 1)::character varying(256)
        END AS claimant_last,
    split_part(a."DRIVER"::text, ' '::text, 2)::character varying(256) AS driver_first,
    split_part(a."DRIVER"::text, ' '::text, 3)::character varying(256) AS driver_middle,
    split_part(a."DRIVER"::text, ' '::text, 1)::character varying(256) AS driver_last,
    a."ACC_DATE" AS loss_date,
    ''::character varying(256) AS loss_time,
    a."DT_REPORTED" AS report_date,
    a."DT_CLOSED" AS closed_date,
    a."DT_REOPEN" AS reopen_date,
        CASE
            WHEN a."IS_LITIGATION"::text = 'Y'::text THEN 'Yes'::character varying(256)
            ELSE
            CASE
                WHEN a."IS_LITIGATION"::text = 'N'::text THEN 'No'::character varying(256)
                ELSE NULL::character varying(256)
            END
        END AS litigation,
    ''::character varying(256) AS days_employed,
    ''::character varying(256) AS claimant_gender,
    ''::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    ''::character varying(256) AS carrier_body_part,
    a."ACC_CODE" AS carrier_cause,
    concat('AHICT', ' - ', a."LOB", ' - ', a."COVERAGE_CODE", ' - ', a."POLICY_NBR")::character varying(256) AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat('AHICT', ' - ', a."INSURED", ' - ', a."EFF_DATE"::date, ' - ', a."POLICY_NBR", ' - ', a."COVERAGE_CODE", ' - ', a."ACC_DATE")::character varying(256) AS carrier_policy_number,
    'raw_ahict'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_ahict a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_ahict OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_ahict to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_ahict to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_ahict to rpauser;
GO
GRANT SELECT ON p_and_c.normal_ahict to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_ahict to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_ahict to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_ahict to rl_p_and_c_d;
GO