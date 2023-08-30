CREATE OR REPLACE VIEW p_and_c.normal_hartford
AS SELECT DISTINCT concat('HARTFORD', '-', a.claim_number)::character varying(256) AS claim_number,
    a.claim_number AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    a.paid_expense,
    a.open_expense AS reserve_expense,
    a.paid_losses AS paid_indemnity,
    '0.00'::character varying(256) AS paid_medical,
    a.open_losses AS reserve_indemnity,
    '0.00'::character varying(256) AS reserve_medical,
    '0.00'::character varying(256) AS subrogation,
    '0.00'::character varying AS reimbursed,
        CASE
            WHEN a.date_closed IS NULL THEN 'Open'::character varying(256)
            ELSE 'Closed'::character varying(256)
        END AS claim_status,
        CASE
            WHEN a.lob::text ~~* '%work%'::text THEN "right"("left"(a.location_of_accidentclaim_descclmt_occupation::text, length(a.location_of_accidentclaim_descclmt_occupation::text) - strpos(reverse(a.location_of_accidentclaim_descclmt_occupation::text), '/'::text)), length("left"(a.location_of_accidentclaim_descclmt_occupation::text, length(a.location_of_accidentclaim_descclmt_occupation::text) - strpos(reverse(a.location_of_accidentclaim_descclmt_occupation::text), '/'::text))) - strpos(a.location_of_accidentclaim_descclmt_occupation::text, '/'::text))::character varying(256)
            ELSE "right"(a.location_of_accidentclaim_descclmt_occupation::text, length(a.location_of_accidentclaim_descclmt_occupation::text) - strpos(a.location_of_accidentclaim_descclmt_occupation::text, '/'::text))::character varying(256)
        END AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    "left"(a.location_of_accidentclaim_descclmt_occupation::text, strpos(a.location_of_accidentclaim_descclmt_occupation::text, '/'::text) - 4)::character varying(256) AS claim_city,
    "right"(upper("left"(a.location_of_accidentclaim_descclmt_occupation::text, strpos(a.location_of_accidentclaim_descclmt_occupation::text, '/'::text) - 1)), 2)::character varying(256) AS claim_state,
    ''::character varying(256) AS claim_zip,
    ''::character varying(256) AS claim_site,
    a.risk_state AS benefit_state,
    a.risk_state AS garage_state,
        CASE
            WHEN a.lob::text ~~* '%work%'::text THEN "right"(a.location_of_accidentclaim_descclmt_occupation::text, strpos(reverse(a.location_of_accidentclaim_descclmt_occupation::text), '/'::text) - 1)::character varying(256)
            ELSE ''::character varying(256)
        END AS occupation,
    a.class_code,
        CASE
            WHEN a.claimantdriverlocation_of_property::text !~~* '%/%'::text THEN a.claimantdriverlocation_of_property
            ELSE "left"(a.claimantdriverlocation_of_property::text, strpos(a.claimantdriverlocation_of_property::text, '/'::text) - 1)::character varying(256)
        END AS claimant_name,
    split_part(split_part(split_part(a.claimantdriverlocation_of_property::text, '/'::text, 2), ', '::text, 2), ' '::text, 1) AS claimant_first,
    split_part(split_part(split_part(a.claimantdriverlocation_of_property::text, '/'::text, 2), ', '::text, 2), ' '::text, 2) AS claimant_middle,
    split_part(split_part(a.claimantdriverlocation_of_property::text, '/'::text, 2), ', '::text, 1) AS claimant_last,
    split_part(split_part(split_part(a.claimantdriverlocation_of_property::text, '/'::text, 2), ', '::text, 2), ' '::text, 1) AS driver_first,
    split_part(split_part(split_part(a.claimantdriverlocation_of_property::text, '/'::text, 2), ', '::text, 2), ' '::text, 2) AS driver_middle,
    split_part(split_part(a.claimantdriverlocation_of_property::text, '/'::text, 2), ', '::text, 1) AS driver_last,
    a.loss_date,
    ''::character varying(256) AS loss_time,
    a.date_reported AS report_date,
    a.date_closed AS closed_date,
    ''::character varying(256) AS reopen_date,
    ''::character varying(256) AS litigation,
        CASE
            WHEN a.length_employment::text ~~* '%Y%'::text AND length(a.length_employment::text) = 3 THEN (("left"(a.length_employment::text, 2)::numeric * 366::numeric))::character varying(256)
            WHEN a.length_employment::text ~~* '%Y%'::text AND length(a.length_employment::text) = 2 THEN (("left"(a.length_employment::text, 1)::numeric * 366::numeric))::character varying(256)
            ELSE
            CASE
                WHEN a.length_employment::text ~~* '%M%'::text AND length(a.length_employment::text) = 3 THEN (("left"(a.length_employment::text, 2)::numeric * 30::numeric))::character varying(256)
                WHEN a.length_employment::text ~~* '%M%'::text AND length(a.length_employment::text) = 2 THEN (("left"(a.length_employment::text, 1)::numeric * 30::numeric))::character varying(256)
                ELSE
                CASE
                    WHEN a.length_employment::text ~~* '%D%'::text AND length(a.length_employment::text) = 5 THEN "left"(a.length_employment::text, 4)::character varying(256)
                    WHEN a.length_employment::text ~~* '%D%'::text AND length(a.length_employment::text) = 4 THEN "left"(a.length_employment::text, 3)::character varying(256)
                    WHEN a.length_employment::text ~~* '%D%'::text AND length(a.length_employment::text) = 3 THEN "left"(a.length_employment::text, 2)::character varying(256)
                    WHEN a.length_employment::text ~~* '%D%'::text AND length(a.length_employment::text) = 2 THEN "left"(a.length_employment::text, 1)::character varying(256)
                    ELSE NULL::character varying(256)
                END
            END
        END AS days_employed,
    ''::character varying(256) AS claimant_gender,
        CASE
            WHEN a.age::numeric = 0::numeric THEN NULL::character varying(256)
            ELSE a.age
        END AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    ''::character varying(256) AS carrier_body_part,
        CASE
            WHEN a.lob::text = 'Auto'::text THEN a.location_of_accidentclaim_descclmt_occupation
            ELSE ''::character varying(256)
        END AS carrier_cause,
    concat('HARTFORD', ' - ', a.lob, ' - ', a.policy_type)::character varying(256) AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
        CASE
            WHEN a.recovery_pending_wco_med_only::text = '#'::text THEN 6::character varying(256)
            ELSE
            CASE
                WHEN a.recovery_pending_wco_med_only::text = '*'::text THEN 10::character varying(256)
                ELSE ''::character varying(256)
            END
        END AS carrier_injury_code,
    concat('HARTFORD', ' - ', a.name_insured, ' - ', a.lob, ' - ', a.policy_term, ' - ', a.policy)::character varying(256) AS carrier_policy_number,
    'raw_hartford'::character varying(256) AS source_table,
    a.uploaded_at
   FROM p_and_c.raw_hartford a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_hartford OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_hartford to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_hartford to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_hartford to rpauser;
GO
GRANT SELECT ON p_and_c.normal_hartford to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_hartford to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_hartford to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_hartford to rl_p_and_c_d;
GO