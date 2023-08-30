CREATE OR REPLACE VIEW p_and_c.normal_acuity_gli
AS SELECT DISTINCT concat('ACUITY_GLI', '-', a."Claim_Nbr")::character varying(256) AS claim_number,
    a."Claim_Nbr" AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    a."Personal_Injury_Paid" AS paid_expense,
    a."Personal_Injury_Reserve" AS reserve_expense,
    a."Premises_Oper_Paid" AS paid_indemnity,
    a."Medical_Payment_Paid" AS paid_medical,
    a."Premises_Oper_Reserve" AS reserve_indemnity,
    a."Medical_Payment_Reserve" AS reserve_medical,
    '0.00'::character varying(256) AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
        CASE
            WHEN a."Claim_Status"::text ~~* '%Closed%'::text THEN 'Closed'::character varying(256)
            ELSE a."Claim_Status"
        END AS claim_status,
    a."Loss_Desc" AS description_text,
    a."Address" AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    a."City" AS claim_city,
    a."State" AS claim_state,
    ''::character varying(256) AS claim_zip,
    a."Location" AS claim_site,
    a."State" AS benefit_state,
    ''::character varying(256) AS garage_state,
    ''::character varying(256) AS occupation,
    ''::character varying(256) AS class_code,
    a."Clmt_Name" AS claimant_name,
    split_part(a."Clmt_Name"::text, ' '::text, 2)::character varying(256) AS claimant_first,
    split_part(a."Clmt_Name"::text, ' '::text, 3)::character varying(256) AS claimant_middle,
    split_part(a."Clmt_Name"::text, ','::text, 1)::character varying(256) AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    a."Loss_Date" AS loss_date,
    a."Loss_Time" AS loss_time,
    a."Received_Date" AS report_date,
    ''::character varying(256) AS closed_date,
    ''::character varying(256) AS reopen_date,
    ''::character varying(256) AS litigation,
    ''::character varying(256) AS days_employed,
        CASE
            WHEN a."Sex"::text = 'F'::text THEN 'Female'::character varying(256)
            ELSE
            CASE
                WHEN a."Sex"::text = 'M'::text THEN 'Male'::character varying(256)
                ELSE a."Sex"
            END
        END AS claimant_gender,
    a."Age" AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    ''::character varying(256) AS carrier_body_part,
    ''::character varying(256) AS carrier_cause,
    concat('ACUITY_GLI', ' - ',
        CASE
            WHEN replace(a."Premises_Oper_Incurred"::text, ','::text, ''::text)::numeric > (replace(a."Medical_Payment_Incurred"::text, ','::text, ''::text)::numeric + replace(a."Personal_Injury_Incurred"::text, ','::text, ''::text)::numeric) THEN 'Prem Oper'::text
            ELSE 'Med Pay'::text
        END)::character varying(256) AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat('ACUITY_GLI', ' - ', a."Insured", ' - ', a."Pol_Eff_Date_Year", ' - ', 'GLI')::character varying(256) AS carrier_policy_number,
    'raw_acuity_gli'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_acuity_gli a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_acuity_gli OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_acuity_gli to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_acuity_gli to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_acuity_gli to rpauser;
GO
GRANT SELECT ON p_and_c.normal_acuity_gli to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_acuity_gli to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_acuity_gli to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_acuity_gli to rl_p_and_c_d;
GO