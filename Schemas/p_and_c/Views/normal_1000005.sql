CREATE OR REPLACE VIEW p_and_c.normal_1000005
AS SELECT DISTINCT concat('1000005', '-', trim(a."Claim_#"))::character varying(256) AS claim_number,
    trim(a."Claim_#")::character varying(256) AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    ((replace(a."Medical_Surplus_Cost"::text, ','::text, ''::text)::numeric + replace(a."Indemnity_Surplus_Cost"::text, ','::text, ''::text)::numeric))::character varying(256) AS paid_expense,
    a."MIRA_Reserves_Surplus" AS reserve_expense,
    replace(a."Indemnity_Risk_Cost"::text, ','::text, ''::text)::character varying(256) AS paid_indemnity,
    replace(a."Medical_Risk_Cost"::text, ','::text, ''::text)::character varying(256) AS paid_medical,
    replace(a."MIRA_Indemnity_Reserves_Cost"::text, ','::text, ''::text)::character varying(256) AS reserve_indemnity,
    replace(a."MIRA_Medical_Reserves_Cost"::text, ','::text, ''::text)::character varying(256) AS reserve_medical,
    (('-1'::integer::numeric * replace(a."Subrogation_Amount"::text, ','::text, ''::text)::numeric))::character varying(256) AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
        CASE
            WHEN replace(a."MIRA_Reserves_Risk"::text, ','::text, ''::text)::numeric > 0::numeric THEN 'Open'::character varying(256)
            ELSE 'Closed'::character varying(256)
        END AS claim_status,
    ''::text AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    'OH'::character varying(256) AS claim_state,
    ''::character varying(256) AS claim_zip,
    a.filename AS claim_site,
    'OH'::character varying(256) AS benefit_state,
    ''::character varying(256) AS garage_state,
    ''::character varying(256) AS occupation,
    ''::character varying(256) AS class_code,
    ''::character varying(256) AS claimant_name,
    ''::character varying(256) AS claimant_first,
    ''::character varying(256) AS claimant_middle,
    ''::character varying(256) AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    concat('1/1/', "left"(a."Claim_#"::text, 2))::date::character varying(256) AS loss_date,
    ''::character varying(256) AS loss_time,
    ''::character varying(256) AS report_date,
    ''::character varying(256) AS closed_date,
    ''::character varying(256) AS reopen_date,
        CASE
            WHEN a."Appealed_to_IC/Court"::text = 'N'::text THEN 'No'::character varying(256)
            ELSE 'Yes'::character varying(256)
        END AS litigation,
    ''::character varying(256) AS days_employed,
    ''::character varying(256) AS claimant_gender,
    ''::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    ''::character varying(256) AS carrier_body_part,
    ''::character varying(256) AS carrier_cause,
    concat('1000005', ' - ', 'WC')::character varying(256) AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    a."MIRA_Reserve_Code" AS carrier_injury_code,
    concat('1000005', ' - ', a.filename, ' - ', 'WC', ' - ', "left"(a."Claim_#"::text, 2))::character varying(256) AS carrier_policy_number,
    'raw_1000005'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_1000005 a
  WHERE "left"(a."Claim_#"::text, 2) <> ALL (ARRAY['OD'::text, 'MV'::text, 'MT'::text, 'MR'::text]);
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_1000005 OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_1000005 to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_1000005 to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_1000005 to rpauser;
GO
GRANT SELECT ON p_and_c.normal_1000005 to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_1000005 to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_1000005 to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_1000005 to rl_p_and_c_d;
GO