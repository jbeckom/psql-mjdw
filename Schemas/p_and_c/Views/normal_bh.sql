   CREATE OR REPLACE VIEW p_and_c.normal_bh
AS SELECT DISTINCT concat('BH', '-', a."Claim Number")::character varying(256) AS claim_number,
    a."Claim Number" AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    a."Expense Paid" AS paid_expense,
    ((a."Expense Incurred"::numeric - a."Expense Paid"::numeric))::character varying(256) AS reserve_expense,
    ((a."TD Paid"::numeric + a."PD Paid"::numeric + a."VR Paid"::numeric))::character varying(256) AS paid_indemnity,
    a."Medical Paid" AS paid_medical,
    ((a."TD Incurred"::numeric + a."PD Incurred"::numeric + a."VR Incurred"::numeric - a."TD Paid"::numeric - a."PD Paid"::numeric - a."VR Paid"::numeric))::character varying(256) AS reserve_indemnity,
    ((a."Medical Incurred"::numeric - a."Medical Paid"::numeric))::character varying(256) AS reserve_medical,
    a."Total Recoveries" AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
        CASE
            WHEN a."Claim Status"::text = 'Re-Open'::text THEN 'Reopen'::character varying(256)
            ELSE a."Claim Status"
        END AS claim_status,
    a."How Injury Occurred" AS description_text,
    a."Injury Location Address1" AS claim_address_1,
    a."Injury Location Address2" AS claim_address_2,
    a."Injury Location City" AS claim_city,
    a."Injury Location State" AS claim_state,
    a."Injury Location Zip Code" AS claim_zip,
    a."Reporting Location Address1" AS claim_site,
    a."Reporting Location State" AS benefit_state,
    ''::character varying(256) AS garage_state,
    a."Occupation Desc" AS occupation,
    a."Class Code" AS class_code,
    concat(a."Claimant First Name", ' ', a."Claimant Last Name")::character varying(256) AS claimant_name,
    a."Claimant First Name" AS claimant_first,
    a."Claimant Middle Name" AS claimant_middle,
    a."Claimant Last Name" AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    a."Loss Date" AS loss_date,
    a."Time of Incident" AS loss_time,
    a."Date Reported To Insurer" AS report_date,
    a."Closed Date" AS closed_date,
    a."Reopened Date" AS reopen_date,
        CASE
            WHEN a."Litigated"::text = 'TRUE'::text THEN 'Yes'::character varying(256)
            ELSE 'No'::character varying(256)
        END AS litigation,
        CASE
            WHEN a."Years Employed"::text = ''::text THEN NULL::character varying(256)
            ELSE ((a."Years Employed"::numeric * 365::numeric))::character varying(256)
        END AS days_employed,
        CASE
            WHEN a."Gender"::text = 'M'::text THEN 'Male'::character varying(256)
            ELSE
            CASE
                WHEN a."Gender"::text = 'F'::text THEN 'Female'::character varying(256)
                ELSE ''::character varying(256)
            END
        END AS claimant_gender,
    a."Claimant Age" AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    a."Body Part Desc" AS carrier_body_part,
    a."Injury Cause Desc" AS carrier_cause,
    concat('BH', ' - ', "left"(a."Policy Number"::text, 4))::character varying(256) AS carrier_coverage_type,
    a."Nature Of Injury Desc" AS carrier_nature,
    a."Claim Type" AS carrier_injury_code,
    concat('BH', ' - ', a."Insured Name", ' - ', a."Policy Number", ' - ', a."Policy Inception Date")::character varying(256) AS carrier_policy_number,
    'raw_bh'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_bh a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_bh OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_bh to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_bh to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_bh to rpauser;
GO
GRANT SELECT ON p_and_c.normal_bh to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_bh to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_bh to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_bh to rl_p_and_c_d;
GO