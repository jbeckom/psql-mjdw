CREATE OR REPLACE VIEW p_and_c.normal_samic
AS SELECT DISTINCT concat('SAMIC', '-', a."claim_#")::character varying(256) AS claim_number,
    a."claim_#" AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    a.paid_expenses AS paid_expense,
    a.reserved_expenses AS reserve_expenses,
    a.paid_losses AS paid_indemnity,
    ((a.reserved_losses::numeric + a.reserved_expenses::numeric))::character varying(256) AS reserve_indemnity,
    '0.00'::character varying(256) AS paid_medical,
    '0.00'::character varying(256) AS reserve_medical,
    a.all_recoveries AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
        CASE
            WHEN a.status::text = 'CLOSED'::text THEN 'Closed'::character varying(256)
            ELSE
            CASE
                WHEN a.status::text = 'NOTICEONLY'::text THEN 'Closed'::character varying(256)
                ELSE split_part(a.status::text, ' '::text, 1)::character varying(256)
            END
        END AS claim_status,
    a.loss_desc AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
        CASE
            WHEN a.loss_location::text ~~* '% % %'::text THEN concat(split_part(a.loss_location::text, ' '::text, 1), ' ', split_part(a.loss_location::text, ' '::text, 2))::character varying(256)
            WHEN a.loss_location::text ~~* '% %'::text THEN split_part(a.loss_location::text, ' '::text, 1)::character varying(256)
            ELSE ''::character varying(256)
        END AS claim_city,
        CASE
            WHEN a.loss_location::text ~~* '% % %'::text THEN split_part(a.loss_location::text, ' '::text, 3)::character varying(256)
            WHEN a.loss_location::text ~~* '% %'::text THEN split_part(a.loss_location::text, ' '::text, 2)::character varying(256)
            ELSE a.loss_location
        END AS claim_state,
    ''::character varying(256) AS claim_zip,
    COALESCE(a.location_code, a.loss_location) AS claim_site,
        CASE
            WHEN a.loss_location::text ~~* '% % %'::text THEN split_part(a.loss_location::text, ' '::text, 3)::character varying(256)
            WHEN a.loss_location::text ~~* '% %'::text THEN split_part(a.loss_location::text, ' '::text, 2)::character varying(256)
            ELSE a.loss_location
        END AS benefit_state,
    ''::character varying(256) AS garage_state,
    ''::character varying(256) AS occupation,
    ''::character varying(256) AS class_code,
    a.claimant AS claimant_name,
        CASE
            WHEN a.claimant::text ~~ '% % % %'::text THEN ''::character varying(256)
            ELSE split_part(a.claimant::text, ' '::text, 1)::character varying(256)
        END AS claimant_first,
        CASE
            WHEN a.claimant::text ~~ '% % % %'::text THEN ''::character varying(256)
            ELSE
            CASE
                WHEN a.claimant::text ~~ '% % %'::text THEN split_part(a.claimant::text, ' '::text, 2)::character varying(256)
                ELSE ''::character varying(256)
            END
        END AS claimant_middle,
        CASE
            WHEN a.claimant::text ~~ '% % % %'::text THEN ''::character varying(256)
            ELSE
            CASE
                WHEN a.claimant::text ~~ '% % %'::text THEN split_part(a.claimant::text, ' '::text, 3)::character varying(256)
                ELSE split_part(a.claimant::text, ' '::text, 2)::character varying(256)
            END
        END AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    a.loss_date,
    ''::character varying(256) AS loss_time,
    a.date_reported AS report_date,
    split_part(a.status::text, ' '::text, 2)::character varying(256) AS closed_date,
    ''::character varying(256) AS reopen_date,
    ''::character varying(256) AS litigation,
    ''::character varying(256) AS days_employed,
    ''::character varying(256) AS claimant_gender,
    ''::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    ''::character varying(256) AS carrier_body_part,
        CASE
            WHEN a.cov_type::text = 'BAP'::text OR a.cov_type::text = 'CAU'::text THEN a.loss_desc
            ELSE ''::character varying(256)
        END AS carrier_cause,
    concat('SAMIC', ' - ', a.cov_type, ' - ', a.type_of_loss)::character varying(256) AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat('SAMIC', ' - ', a.name_insured, ' - ', a.cov_type, ' - ', a.policy_start_date, ' - ', a."policy_#")::character varying(256) AS carrier_policy_number,
    'raw_samic'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_samic a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_samic OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_samic to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_samic to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_samic to rpauser;
GO
GRANT SELECT ON p_and_c.normal_samic to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_samic to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_samic to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_samic to rl_p_and_c_d;
GO