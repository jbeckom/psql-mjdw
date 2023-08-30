CREATE OR REPLACE VIEW p_and_c.normal_lak
AS SELECT DISTINCT concat('LAK', '-', a.claim, a.no)::character varying(256) AS claim_number,
    concat(a.claim, a.no) AS occurrence_number,
    a.no AS claimant_number,
    '0.00'::character varying(256) AS paid_expense,
    '0.00'::character varying(256) AS reserve_expense,
    a.payment AS paid_indemnity,
    '0.00'::character varying(256) AS paid_medical,
    a.reserve AS reserve_indemnity,
    '0.00'::character varying(256) AS reserve_medical,
    '0.00'::character varying(256) AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
        CASE
            WHEN a.stat::text = 'CLOS'::text THEN 'Closed'::character varying(256)
            ELSE
            CASE
                WHEN a.stat::text = 'OPEN'::text THEN 'Open'::character varying(256)
                ELSE
                CASE
                    WHEN a.stat::text = 'SUIT'::text THEN 'Open'::character varying(256)
                    ELSE a.stat
                END
            END
        END AS claim_status,
    a.description AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    ''::character varying(256) AS claim_state,
    ''::character varying(256) AS claim_zip,
    ''::character varying(256) AS claim_site,
    ''::character varying(256) AS benefit_state,
    ''::character varying(256) AS garage_state,
    ''::character varying(256) AS occupation,
    ''::character varying(256) AS class_code,
    a.operator AS claimant_name,
    split_part(a.operator::text, ' '::text, 1) AS claimant_first,
    ''::character varying(256) AS claimant_middle,
    split_part(a.operator::text, ' '::text, 2) AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    concat("left"(a.date::text, 2), '/', "left"("right"(a.date::text, 4), 2), '/', "right"(a.date::text, 2))::date::character varying(256) AS loss_date,
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
            WHEN a.cov_type::text ~~ 'AUTO%'::text THEN a.description
            ELSE ''::character varying(256)
        END AS carrier_cause,
    concat('LAK', ' - ', a.type)::character varying(256) AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat('LAK', ' - ', a.name, ' - ', a.policy, ' - ', a.policy_start_date)::character varying(256) AS carrier_policy_number,
    'raw_lak'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_lak a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_lak OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_lak to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_lak to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_lak to rpauser;
GO
GRANT SELECT ON p_and_c.normal_lak to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_lak to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_lak to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_lak to rl_p_and_c_d;
GO