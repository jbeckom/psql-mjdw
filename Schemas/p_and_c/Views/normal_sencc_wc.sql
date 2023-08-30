CREATE OR REPLACE VIEW p_and_c.normal_sencc_wc
AS SELECT DISTINCT concat('SENCC_WC', '-', a."Claim #")::character varying(256) AS claim_number,
    a."Claim #" AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    a."Paid Expense" AS paid_expense,
    ''::character varying(256) AS reserve_expense,
    a."Indemnity Paid Loss" AS paid_indemnity,
    a."Medical Paid Loss" AS paid_medical,
    a."Indemnity Reserve" AS reserve_indemnity,
    a."Medical Reserve" AS reserve_medical,
    a."Subrogation Recovery" AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
    a."Claim Status" AS claim_status,
    a."Description" AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    a."Location City" AS claim_city,
    a."Location State" AS claim_state,
    ''::character varying(256) AS claim_zip,
        CASE
            WHEN a."Loc Name"::text = 'Rose Acre Farms, Inc.'::text THEN a."Loc Code"
            ELSE
            CASE
                WHEN a."Loc Description"::text = ''::text THEN a."Loc Name"
                ELSE COALESCE(a."Loc Description", a."Loc Name")
            END
        END AS claim_site,
    states.code::character varying(256) AS benefit_state,
    ''::character varying(256) AS garage_state,
    a."Occupation" AS occupation,
    a."Class Code" AS class_code,
    a."Claimant Name" AS claimant_name,
    split_part(a."Claimant Name"::text, ' '::text, 1)::character varying(256) AS claimant_first,
        CASE
            WHEN a."Claimant Name"::text ~~* '%.'::text THEN ''::character varying(256)
            WHEN a."Claimant Name"::text ~~ '% % %'::text THEN split_part(a."Claimant Name"::text, ' '::text, 2)::character varying(256)
            ELSE ''::character varying(256)
        END AS claimant_middle,
        CASE
            WHEN a."Claimant Name"::text ~~* '%.%'::text THEN replace(split_part(a."Claimant Name"::text, ' '::text, 2)::character varying(256)::text, ','::text, ''::text)::character varying
            WHEN a."Claimant Name"::text ~~ '% % % %'::text THEN replace(split_part(a."Claimant Name"::text, ' '::text, 3)::character varying(256)::text, ','::text, ''::text)::character varying
            WHEN a."Claimant Name"::text ~~ '% % %'::text THEN split_part(a."Claimant Name"::text, ' '::text, 3)::character varying(256)
            ELSE split_part(a."Claimant Name"::text, ' '::text, 2)::character varying(256)
        END AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    a."Loss Date" AS loss_date,
    a."Time of Day" AS loss_time,
    a."Date Reported to Sentry" AS report_date,
    a."Close Date" AS closed_date,
    a."Reopen Date" AS reopen_date,
        CASE
            WHEN a."Litigation Status"::text = 'Represented'::text THEN 'Yes'::character varying(256)
            ELSE split_part(a."Litigation Status"::text, ' / '::text, 1)::character varying(256)
        END AS litigation,
        CASE
            WHEN a."Hire Date"::text = ''::text THEN ''::character varying(256)
            ELSE ((a."Loss Date"::date - a."Hire Date"::date))::character varying(256)
        END AS days_employed,
    a."Gender" AS claimant_gender,
    a."Age at Injury" AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    a."Part Code WC" AS carrier_body_part,
    a."Cause Code WC" AS carrier_cause,
    concat('SENCC_WC', ' - ', 'Workers'' Comp', ' - ', 'Workers'' Comp')::character varying(256) AS carrier_coverage_type,
    a."Nature Code WC" AS carrier_nature,
    a."Claim Type" AS carrier_injury_code,
    concat('SENCC_WC', ' - ', 'Account ', a."Account #", ' - ', 'Workers'' Comp', ' - ', a."Policy Effective Date")::character varying(256) AS carrier_policy_number,
    'raw_sencc_wc'::character varying(256) AS source_table,
    a.uploaded_at
   FROM p_and_c.raw_sencc_wc a
     LEFT JOIN p_and_c.states ON a."Benefit State"::text = states.name;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_sencc_wc OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_sencc_wc to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_sencc_wc to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_sencc_wc to rpauser;
GO
GRANT SELECT ON p_and_c.normal_sencc_wc to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_sencc_wc to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_sencc_wc to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_sencc_wc to rl_p_and_c_d;
GO