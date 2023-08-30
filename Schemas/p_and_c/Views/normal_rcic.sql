CREATE OR REPLACE VIEW p_and_c.normal_rcic
AS SELECT DISTINCT concat('RCIC', '-', a."Claim Number")::character varying(256) AS claim_number,
    a."Claim Number" AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    a."Paid Expense" AS paid_expense,
    ''::character varying(256) AS reserve_expense,
    a."Paid Indemnity" AS paid_indemnity,
    a."Paid Medical" AS paid_medical,
    a."Reserve Indemnity" AS reserve_indemnity,
    a."Reserve Medical" AS reserve_medical,
    a."Subrogation" AS subrogation,
    '0.00'::character varying AS reimbursed,
        CASE
            WHEN a."Claim Status"::text = 'Pending'::text THEN 'Open'::character varying(256)
            ELSE a."Claim Status"
        END AS claim_status,
    a."Claim Description" AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    a."Claim Location State" AS claim_state,
    ''::character varying(256) AS claim_zip,
    a."Client Location" AS claim_site,
    a."Claim Location State" AS benefit_state,
    ''::character varying(256) AS garage_state,
    a."Claimant Occupation" AS occupation,
    ''::character varying(256) AS class_code,
    a."Claimant Name" AS claimant_name,
    split_part(a."Claimant Name"::text, ' '::text, 1)::character varying(256) AS claimant_first,
        CASE
            WHEN a."Claimant Name"::text ~~ '% % %'::text THEN split_part(a."Claimant Name"::text, ' '::text, 2)::character varying(256)
            ELSE ''::character varying(256)
        END AS claimant_middle,
        CASE
            WHEN a."Claimant Name"::text ~~ '% % %'::text THEN split_part(a."Claimant Name"::text, ' '::text, 3)::character varying(256)
            ELSE split_part(a."Claimant Name"::text, ' '::text, 2)::character varying(256)
        END AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    a."Date of Loss" AS loss_date,
    ''::character varying(256) AS loss_time,
    a."Date Reported" AS report_date,
    a."Date Closed" AS closed_date,
    ''::character varying(256) AS reopen_date,
    ''::character varying(256) AS litigation,
        CASE
            WHEN a."Date of Hire"::text = ''::text THEN ''::character varying
            ELSE ((a."Date of Loss"::date - a."Date of Hire"::date))::character varying(256)
        END AS days_employed,
        CASE
            WHEN a."Claimant Gender"::text = 'M'::text THEN 'Male'::character varying(256)
            ELSE
            CASE
                WHEN a."Claimant Gender"::text = 'F'::text THEN 'Female'::character varying(256)
                ELSE ''::character varying(256)
            END
        END AS claimant_gender,
    a."Claimant Age"::double precision::integer::character varying(256) AS claimant_age,
    a."Claimant Shift" AS claimant_shift,
    a."Claimant Supervisor" AS claimant_supervisor,
    a."Location on Body" AS carrier_body_part,
    concat(a."Claim Cause", ' - ', a."Injury Type")::character varying(256) AS carrier_cause,
    concat('RCIC', ' - ', a."Line of Coverage", ' - ', a."Line of Coverage")::character varying(256) AS carrier_coverage_type,
    a."Injury Type" AS carrier_nature,
    a."Severity Description" AS carrier_injury_code,
    concat('RCIC', ' - ', a."Client Name", ' - ', a."Line of Coverage", ' - ', a."Policy Eff Date"::date, ' - ', a."Policy Number")::character varying(256) AS carrier_policy_number,
    'raw_rcic'::character varying(256) AS source_table,
    a.uploaded_at
   FROM p_and_c.raw_rcic a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_rcic OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_rcic to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_rcic to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_rcic to rpauser;
GO
GRANT SELECT ON p_and_c.normal_rcic to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_rcic to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_rcic to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_rcic to rl_p_and_c_d;
GO