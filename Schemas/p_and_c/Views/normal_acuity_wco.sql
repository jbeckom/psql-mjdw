CREATE OR REPLACE VIEW p_and_c.normal_acuity_wco
AS SELECT DISTINCT concat('ACUITY_WCO', '-', a."Claim_Nbr")::character varying(256) AS claim_number,
    a."Claim_Nbr" AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    a."Expense_Paid" AS paid_expense,
    a."Expense_Reserve" AS reserve_expense,
    a."Indemnity_Paid" AS paid_indemnity,
    a."Medical_Paid" AS paid_medical,
    a."Indemnity_Reserve" AS reserve_indemnity,
    a."Medical_Reserve" AS reserve_medical,
    a."Other_Recovery_Paid" AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
        CASE
            WHEN a."Claim_Status"::text ~~* '%Closed%'::text THEN 'Closed'::character varying(256)
            ELSE
            CASE
                WHEN a."Claim_Status"::text = 'Rec Only'::text THEN 'Closed'::character varying(256)
                ELSE a."Claim_Status"
            END
        END AS claim_status,
    a."Loss_Desc" AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    a."State" AS claim_state,
    ''::character varying(256) AS claim_zip,
    a."Location" AS claim_site,
    a."State" AS benefit_state,
    ''::character varying(256) AS garage_state,
    a."Occupation" AS occupation,
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
        CASE
            WHEN a."Employed"::text ~~* '%YRS%'::text THEN ((split_part(a."Employed"::text, ' '::text, 1)::numeric * 365::numeric))::character varying(256)
            ELSE
            CASE
                WHEN a."Employed"::text ~~* '%DAYS%'::text THEN split_part(a."Employed"::text, ' '::text, 1)::character varying(256)
                ELSE
                CASE
                    WHEN a."Employed"::text ~~* '%MON%'::text THEN ((split_part(a."Employed"::text, ' '::text, 1)::numeric * 30::numeric))::character varying(256)
                    ELSE NULL::character varying
                END
            END
        END AS days_employed,
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
    a."Body_Part" AS carrier_body_part,
    concat(a."Acc_Type", ' - ', a."Cause_Type")::character varying(256) AS carrier_cause,
    concat('ACUITY_WCO', ' - ', 'WCO')::character varying(256) AS carrier_coverage_type,
    a."Nature_of_Inj" AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat('ACUITY_WCO', ' - ', a."Insured", ' - ', a."Pol_Eff_Date_Year", ' - ', 'WCO')::character varying(256) AS carrier_policy_number,
    'raw_acuity_wco'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_acuity_wco a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_acuity_wco OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_acuity_wco to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_acuity_wco to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_acuity_wco to rpauser;
GO
GRANT SELECT ON p_and_c.normal_acuity_wco to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_acuity_wco to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_acuity_wco to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_acuity_wco to rl_p_and_c_d;
GO