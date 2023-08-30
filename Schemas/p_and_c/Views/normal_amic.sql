CREATE OR REPLACE VIEW p_and_c.normal_amic
AS SELECT DISTINCT concat('AMIC', '-', a.claim_number)::character varying(256) AS claim_number,
    a.claim_number AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    a.paid_lae AS paid_expense,
    a.reserve_lae AS reserve_expense,
    a.paid_indemnity,
    a.paid_medical,
    a.reserve_indemnity,
    a.reserve_medical,
    '0.00'::character varying(256) AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
        CASE
            WHEN a.claim_status::text = 'OPEN'::text THEN 'Open'::character varying(256)
            ELSE
            CASE
                WHEN a.claim_status::text = 'CLOSED'::text THEN 'Closed'::character varying(256)
                ELSE
                CASE
                    WHEN a.claim_status::text = 'REOPENED'::text THEN 'Reopen'::character varying(256)
                    ELSE
                    CASE
                        WHEN a.claim_status::text = 'Reopened'::text THEN 'Reopen'::character varying(256)
                        ELSE a.claim_status
                    END
                END
            END
        END AS claim_status,
    a.cause AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    a.jurisdiction AS claim_state,
    ''::character varying(256) AS claim_zip,
    ''::character varying(256) AS claim_site,
    a.jurisdiction AS benefit_state,
    ''::character varying(256) AS garage_state,
    ''::character varying(256) AS occupation,
    a.class_code,
    a.claimant AS claimant_name,
    split_part(a.claimant::text, ' '::text, 1) AS claimant_first,
        CASE
            WHEN a.claimant::text ~~ '% _ %'::text THEN split_part(a.claimant::text, ' '::text, 2)::character varying
            ELSE ''::character varying(256)
        END AS claimant_middle,
        CASE
            WHEN a.claimant::text ~~ '% _ %'::text THEN split_part(a.claimant::text, ' '::text, 3)
            ELSE split_part(a.claimant::text, ' '::text, 2)
        END AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    a.accident_date AS loss_date,
    ''::character varying(256) AS loss_time,
    ''::character varying(256) AS report_date,
    a.date_closed AS closed_date,
    ''::character varying(256) AS reopen_date,
    ''::character varying(256) AS litigation,
    ''::character varying(256) AS days_employed,
        CASE
            WHEN a.sex::text = 'M'::text THEN 'Male'::character varying(256)
            ELSE
            CASE
                WHEN a.sex::text = 'F'::text THEN 'Female'::character varying(256)
                ELSE a.sex
            END
        END AS claimant_gender,
    a.age AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    a.injury AS carrier_body_part,
    ''::character varying(256) AS carrier_cause,
    concat('AMIC', ' - ', "right"("left"(a.claim_number::text, 7), 2))::character varying(256) AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat('AMIC', ' - ', a.insured, ' - ', a.policy_start_date::date, ' - ', a.policy_number)::character varying(256) AS carrier_policy_number,
    'raw_amic'::character varying(256) AS source_table,
    a.uploaded_at
   FROM p_and_c.raw_amic a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_amic OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_amic to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_amic to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_amic to rpauser;
GO
GRANT SELECT ON p_and_c.normal_amic to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_amic to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_amic to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_amic to rl_p_and_c_d;
GO