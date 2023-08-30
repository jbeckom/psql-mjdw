CREATE OR REPLACE VIEW p_and_c.normal_wsib
AS SELECT DISTINCT concat('WSIB', '-', a."Claim number")::character varying(256) AS claim_number,
    a."Claim number" AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    '0.00'::character varying(256) AS paid_expense,
    '0.00'::character varying(256) AS reserve_expense,
        CASE
            WHEN a."Claim type"::text = 'Lost Time'::text THEN round(a."Benefit amount"::numeric / er.rate, 2)::character varying(256)
            ELSE '0.00'::character varying(256)
        END AS paid_indemnity,
        CASE
            WHEN a."Claim type"::text = 'No Lost Time'::text THEN round(a."Benefit amount"::numeric / er.rate, 2)::character varying(256)
            ELSE '0.00'::character varying(256)
        END AS paid_medical,
    '0.00'::character varying(256) AS reserve_indemnity,
    '0.00'::character varying(256) AS reserve_medical,
    '0.00'::character varying(256) AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
    'Closed'::character varying(256) AS claim_status,
    a."Injury event - detailed" AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    'ON'::character varying(256) AS claim_state,
    ''::character varying(256) AS claim_zip,
    'Ontario'::character varying(256) AS claim_site,
    'ON'::character varying(256) AS benefit_state,
    ''::character varying(256) AS garage_state,
    a."Occupation" AS occupation,
    a."NAICS code" AS class_code,
    a."Claimant" AS claimant_name,
    split_part(a."Claimant"::text, ' '::text, 1)::character varying(256) AS claimant_first,
        CASE
            WHEN a."Claimant"::text ~~ '% % %'::text THEN split_part(a."Claimant"::text, ' '::text, 2)::character varying(256)
            ELSE ''::character varying(256)
        END AS claimant_middle,
        CASE
            WHEN a."Claimant"::text ~~ '% % %'::text THEN split_part(a."Claimant"::text, ' '::text, 3)::character varying(256)
            ELSE split_part(a."Claimant"::text, ' '::text, 2)::character varying(256)
        END AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    a."Accident date" AS loss_date,
    ''::character varying(256) AS loss_time,
    a."Registration date" AS report_date,
    ''::character varying(256) AS closed_date,
    ''::character varying(256) AS reopen_date,
    ''::character varying(256) AS litigation,
    ''::character varying(256) AS days_employed,
        CASE
            WHEN a."Gender"::text = 'M'::character varying(256)::text THEN 'Male'::character varying(256)
            ELSE
            CASE
                WHEN a."Gender"::text = 'F'::character varying(256)::text THEN 'Female'::character varying(256)
                ELSE ''::character varying(256)
            END
        END AS claimant_gender,
    a."Claimant age at accident" AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    a."Part of body - detailed" AS carrier_body_part,
    a."Injury event - detailed" AS carrier_cause,
    'Workers'' Comp'::character varying(256) AS carrier_coverage_type,
    a."Nature of injury"::text AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat('WSIB Canada - STRAQUA - ', "right"(a."Accident date"::text, 4))::character varying(256) AS carrier_policy_number,
    'raw_wsib'::character varying(256) AS source_table,
    a.uploaded_at
   FROM p_and_c.raw_wsib a
     JOIN p_and_c.exchange_rates er ON a."Registration date"::date = er.date;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_wsib OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_wsib to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_wsib to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_wsib to rpauser;
GO
GRANT SELECT ON p_and_c.normal_wsib to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_wsib to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_wsib to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_wsib to rl_p_and_c_d;
GO