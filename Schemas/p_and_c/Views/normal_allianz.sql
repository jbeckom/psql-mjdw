CREATE OR REPLACE VIEW p_and_c.normal_allianz
AS 
SELECT DISTINCT concat('ALLIANZ', '-', a."Claim Reference")::character varying(256) AS claim_number,
    a."Claim Reference" AS occurrence_number,
    ''::character varying(256) AS claimant_number,
        CASE
            WHEN a."Original Currency"::text <> 'USD'::text THEN round(replace(a."Fees Paid 100"::text, ','::text, ''::text)::numeric / a."Rate of Exchange"::numeric, 2)::character varying(256)
            ELSE a."Fees Paid 100"
        END AS paid_expense,
        CASE
            WHEN a."Original Currency"::text <> 'USD'::text THEN round(replace(a."Fees Outstanding 100"::text, ','::text, ''::text)::numeric / a."Rate of Exchange"::numeric, 2)::character varying(256)
            ELSE a."Fees Outstanding 100"
        END AS reserve_expense,
        CASE
            WHEN a."Original Currency"::text <> 'USD'::text THEN round(replace(a."Indemnity Paid 100"::text, ','::text, ''::text)::numeric / a."Rate of Exchange"::numeric, 2)::character varying(256)
            ELSE a."Indemnity Paid 100"
        END AS paid_indemnity,
    ''::character varying(256) AS paid_medical,
        CASE
            WHEN a."Original Currency"::text <> 'USD'::text THEN round(replace(a."Total Outstanding 100"::text, ','::text, ''::text)::numeric / a."Rate of Exchange"::numeric, 2)::character varying(256)
            ELSE a."Total Outstanding 100"
        END AS reserve_indemnity,
    ''::character varying(256) AS reserve_medical,
        CASE
            WHEN a."Original Currency"::text <> 'USD'::text THEN round(replace(a."Other Recoveries 100"::text, ','::text, ''::text)::numeric / a."Rate of Exchange"::numeric, 2)::character varying(256)
            ELSE a."Other Recoveries 100"
        END AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
    a."Claim Status" AS claim_status,
    a."Loss Description" AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    b.code::character varying(256) AS claim_state,
    ''::character varying(256) AS claim_zip,
    a."Local Insured" AS claim_site,
    b.code::character varying(256) AS benefit_state,
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
    a."Date of Loss"::date::character varying(256) AS loss_date,
    ''::character varying(256) AS loss_time,
    a."Date Reported"::date::character varying(256) AS report_date,
    ''::character varying(256) AS closed_date,
    ''::character varying(256) AS reopen_date,
    ''::character varying(256) AS litigation,
    ''::character varying(256) AS days_employed,
    ''::character varying(256) AS claimant_gender,
    ''::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    ''::character varying(256) AS carrier_body_part,
    a."Further Loss Details" AS carrier_cause,
    concat('ALLIANZ', ' - ', a."Cause of Loss")::character varying(256) AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat('ALLIANZ', ' - ', a."Local Insured", ' - ', a."UW Year", ' - ', a."Policy Reference", ' - ', a."Sub-Line of Business")::character varying(256) AS carrier_policy_number,
    'raw_allianz'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_allianz a
     LEFT JOIN p_and_c.states b ON a."Loss Area"::text = b.name;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_allianz OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_allianz to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_allianz to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_allianz to rpauser;
GO
GRANT SELECT ON p_and_c.normal_allianz to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_allianz to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_allianz to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_allianz to rl_p_and_c_d;
GO