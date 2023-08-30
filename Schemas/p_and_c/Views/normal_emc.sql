CREATE OR REPLACE VIEW p_and_c.normal_emc
AS SELECT DISTINCT concat('EMC', '-', a.claim_no)::character varying(256) AS claim_number,
    a.claim_no AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    a.net_paid_alloc_exp AS paid_expense,
    '0.00'::character varying(256) AS reserve_expense,
    a.gross_paid_loss AS paid_indemnity,
    '0.00'::character varying(256) AS paid_medical,
    a.loss_reserves AS reserve_indemnity,
    '0.00'::character varying(256) AS reserve_medical,
    a.loss_recovery AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
        CASE
            WHEN a.s::text = 'C'::text THEN 'Closed'::character varying(256)
            ELSE
            CASE
                WHEN a.s::text = 'O'::text THEN 'Open'::character varying(256)
                ELSE ''::character varying(256)
            END
        END AS claim_status,
    a.loss_description AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    a.st AS claim_state,
    ''::character varying(256) AS claim_zip,
    a.loc AS claim_site,
    a.st AS benefit_state,
    a.st AS garage_state,
    a.occ AS occupation,
    a.class AS class_code,
    a.driverclaimant AS claimant_name,
    split_part(split_part(split_part(a.driverclaimant::text, '/'::text, 1), ', '::text, 2), ' '::text, 1) AS claimant_first,
        CASE
            WHEN a.driverclaimant::text ~~ '% _'::text THEN "right"(a.driverclaimant::text, 1)
            ELSE NULL::text
        END AS claimant_middle,
    split_part(split_part(a.driverclaimant::text, '/'::text, 1), ', '::text, 1) AS claimant_last,
    split_part(split_part(split_part(a.driverclaimant::text, '/'::text, 1), ', '::text, 2), ' '::text, 1) AS driver_first,
        CASE
            WHEN a.driverclaimant::text ~~ '% _'::text THEN "right"(a.driverclaimant::text, 1)
            ELSE NULL::text
        END AS driver_middle,
    split_part(split_part(a.driverclaimant::text, '/'::text, 1), ', '::text, 1) AS driver_last,
    a.loss_dt AS loss_date,
    ''::character varying(256) AS loss_time,
    ''::character varying(256) AS report_date,
    ''::character varying(256) AS closed_date,
    ''::character varying(256) AS reopen_date,
    ''::character varying(256) AS litigation,
    ''::character varying(256) AS days_employed,
    ''::character varying(256) AS claimant_gender,
    a.age AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    ''::character varying(256) AS carrier_body_part,
        CASE
            WHEN a.coverage::text ~~ 'DLR%'::text THEN a.loss_description
            ELSE ''::character varying(256)
        END AS carrier_cause,
    concat('EMC', ' - ', a.coverage)::character varying(256) AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat('EMC', ' - ', a.client, ' - ', a.coverage, ' - ', a.loss_dt)::character varying(256) AS carrier_policy_number,
    'raw_emc'::character varying(256) AS source_table,
    a.uploaded_at
   FROM p_and_c.raw_emc a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_emc OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_emc to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_emc to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_emc to rpauser;
GO
GRANT SELECT ON p_and_c.normal_emc to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_emc to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_emc to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_emc to rl_p_and_c_d;
GO