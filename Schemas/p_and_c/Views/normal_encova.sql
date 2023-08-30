CREATE OR REPLACE VIEW p_and_c.normal_encova
AS SELECT DISTINCT concat('ENCOVA', '-', a.claim_number)::character varying(256) AS claim_number,
    a.claim_number AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    '0.00'::character varying(256) AS paid_expense,
    '0.00'::character varying(256) AS reserve_expense,
    ((a.incurred_loss::numeric - a.outstanding_loss_reserve::numeric))::character varying(256) AS paid_indemnity,
    '0.00'::character varying(256) AS paid_medical,
    a.outstanding_loss_reserve AS reserve_indemnity,
    '0.00'::character varying(256) AS reserve_medical,
    '0.00'::character varying(256) AS subrogation,
    '0.00'::character varying AS reimbursed,
    a.status AS claim_status,
    a.loss_description AS description_text,
    split_part(a.incident_location::text, ', '::text, 1)::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    reverse(btrim(split_part(reverse(a.incident_location::text), ','::text, 2)))::character varying(256) AS claim_city,
    "left"(reverse(split_part(reverse(a.incident_location::text), ' ,'::text, 1)), 2)::character varying(256) AS claim_state,
        CASE
            WHEN "right"(a.incident_location::text, 5) ~~* '%,%'::text THEN ''::character varying(256)
            ELSE "right"(a.incident_location::text, 5)::character varying(256)
        END AS claim_zip,
    ''::character varying(256) AS claim_site,
    "left"(reverse(split_part(reverse(a.incident_location::text), ' ,'::text, 1)), 2)::character varying(256) AS benefit_state,
    "left"(reverse(split_part(reverse(a.incident_location::text), ' ,'::text, 1)), 2)::character varying(256) AS garage_state,
    ''::character varying(256) AS occupation,
    ''::character varying(256) AS class_code,
    a.claimant AS claimant_name,
        CASE
            WHEN a.claimant::text ~~ '%&%'::text THEN ''::character varying(256)::text
            ELSE split_part(a.claimant::text, ' '::text, 1)
        END AS claimant_first,
    ''::character varying(256) AS claimant_middle,
        CASE
            WHEN a.claimant::text ~~ '%&%'::text THEN ''::character varying(256)::text
            ELSE split_part(a.claimant::text, ' '::text, 2)
        END AS claimant_last,
        CASE
            WHEN a.claimant::text ~~ '%&%'::text THEN ''::character varying(256)::text
            ELSE split_part(a.claimant::text, ' '::text, 1)
        END AS driver_first,
    ''::character varying(256) AS driver_middle,
        CASE
            WHEN a.claimant::text ~~ '%&%'::text THEN ''::character varying(256)::text
            ELSE split_part(a.claimant::text, ' '::text, 2)
        END AS driver_last,
    a.loss_date,
    ''::character varying(256) AS loss_time,
    ''::character varying(256) AS report_date,
    a.close_date AS closed_date,
    ''::character varying(256) AS reopen_date,
    ''::character varying(256) AS litigation,
    ''::character varying(256) AS days_employed,
    ''::character varying(256) AS claimant_gender,
    ''::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    a.injury_illness_description AS carrier_body_part,
    concat('ENCOVA - ', a.line_of_business, ' - ', a.loss_party)::character varying(256) AS carrier_coverage_type,
    concat(a.loss_cause, ' - ', a.loss_party)::character varying(256) AS carrier_cause,
    a.injury_illness_description AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat_ws(' - ','ENCOVA', a.policyholder_name, a.line_of_business, a.term, a.policy_number)::character varying(256) AS carrier_policy_number,
    'raw_encova'::character varying(256) AS source_table,
    a.uploaded_at
   FROM p_and_c.raw_encova a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_encova OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_encova to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_encova to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_encova to rpauser;
GO
GRANT SELECT ON p_and_c.normal_encova to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_encova to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_encova to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_encova to rl_p_and_c_d;
GO