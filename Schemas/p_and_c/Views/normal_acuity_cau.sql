CREATE OR REPLACE VIEW p_and_c.normal_acuity_cau
AS SELECT DISTINCT concat('ACUITY_CAU', '-', a."Claim_Nbr")::character varying(256) AS claim_number,
    a."Claim_Nbr" AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    '0.00'::character varying(256) AS paid_expense,
    '0.00'::character varying(256) AS reserve_expense,
    ((replace(
        CASE
            WHEN a."Total_Paid"::text = ''::text THEN '0.00'::text
            ELSE a."Total_Paid"::text
        END, ','::text, ''::text)::numeric + replace(
        CASE
            WHEN a."Unsdundrsd_Mot_Paid"::text = ''::text THEN '0.00'::text
            ELSE a."Unsdundrsd_Mot_Paid"::text
        END, ','::text, ''::text)::numeric))::character varying(256) AS paid_indemnity,
    '0.00'::character varying(256) AS paid_medical,
    ((replace(
        CASE
            WHEN a."Total_Reserve"::text = ''::text THEN '0.00'::text
            ELSE a."Total_Reserve"::text
        END, ','::text, ''::text)::numeric + replace(
        CASE
            WHEN a."Unsdundrsd_Mot_Reserve"::text = ''::text THEN '0.00'::text
            ELSE a."Unsdundrsd_Mot_Reserve"::text
        END, ','::text, ''::text)::numeric))::character varying(256) AS reserve_indemnity,
    '0.00'::character varying(256) AS reserve_medical,
    a."Recover_Physical_Damage_Incurred" AS subrogation,
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
    a."State" AS garage_state,
    ''::character varying(256) AS occupation,
    ''::character varying(256) AS class_code,
    a."Name_of_Driver" AS claimant_name,
    split_part(a."Name_of_Driver"::text, ' '::text, 2)::character varying(256) AS claimant_first,
    split_part(a."Name_of_Driver"::text, ' '::text, 3)::character varying(256) AS claimant_middle,
    split_part(a."Name_of_Driver"::text, ','::text, 1)::character varying(256) AS claimant_last,
    split_part(a."Name_of_Driver"::text, ' '::text, 2)::character varying(256) AS driver_first,
    split_part(a."Name_of_Driver"::text, ' '::text, 3)::character varying(256) AS driver_middle,
    split_part(a."Name_of_Driver"::text, ','::text, 1)::character varying(256) AS driver_last,
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
    concat('ACUITY_CAU', ' - ', a."Loss_Desc")::character varying(256) AS carrier_cause,
    concat('ACUITY_CAU', ' - ',
        CASE
            WHEN replace(
            CASE
                WHEN a."Liability_Incurred"::text = ''::text THEN '0.00'::text
                ELSE a."Liability_Incurred"::text
            END, ','::text, ''::text)::numeric > replace(
            CASE
                WHEN a."Physical_Damage_Incurred"::text = ''::text THEN '0.00'::text
                ELSE a."Physical_Damage_Incurred"::text
            END, ','::text, ''::text)::numeric THEN 'Liability'::text
            ELSE 'Physical Damage'::text
        END)::character varying(256) AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat('ACUITY_CAU', ' - ', a."Insured", ' - ', a."Pol_Eff_Date_Year", ' - ', 'CAU')::character varying(256) AS carrier_policy_number,
    'raw_acuity_cau'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_acuity_cau a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_acuity_cau OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_acuity_cau to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_acuity_cau to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_acuity_cau to rpauser;
GO
GRANT SELECT ON p_and_c.normal_acuity_cau to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_acuity_cau to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_acuity_cau to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_acuity_cau to rl_p_and_c_d;
GO