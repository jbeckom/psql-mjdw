CREATE OR REPLACE VIEW p_and_c.normal_cmic
AS SELECT DISTINCT concat('CMIC', '-', a.policy_number, a.report_date, a.report_time)::character varying(256) AS claim_number,
    concat(a.policy_number, a.report_date, a.report_time) AS occurrence_number,
    a.occurrence AS claimant_number,
    a.expense AS paid_expense,
    '0.00'::character varying(256) AS resrve_expense,
    a.paid AS paid_indemnity,
    '0.00'::character varying(256) AS paid_medical,
    a.reserve AS reserve_indemnity,
    '0.00'::character varying(256) AS reserve_medical,
    a.subro AS subrogation,
    a.salvage AS reimbursed,
        CASE
            WHEN a.status::text = 'CLOSED'::text THEN 'Closed'::character varying(256)
            ELSE
            CASE
                WHEN a.status::text = 'OPEN'::text THEN 'Open'::character varying(256)
                ELSE ''::character varying(256)
            END
        END AS claim_status,
    a.loss_description AS description_text,
    "left"("left"(a.loss_location::text, length(a.loss_location::text) - 3), length(a.loss_location::text) - 3 - strpos(reverse("left"(a.loss_location::text, length(a.loss_location::text) - 3)), ' '::text))::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    "right"("left"(a.loss_location::text, length(a.loss_location::text) - 3), strpos(reverse("left"(a.loss_location::text, length(a.loss_location::text) - 4)), ' '::text))::character varying(256) AS claim_city,
    upper("right"(a.loss_location::text, 2))::character varying(256) AS claim_state,
    ''::character varying(256) AS claim_zip,
    ''::character varying(256) AS claim_site,
    upper("right"(a.loss_location::text, 2))::character varying(256) AS benefit_state,
    upper("right"(a.loss_location::text, 2))::character varying(256) AS garage_state,
    ''::character varying(256) AS occupation,
    ''::character varying(256) AS class_code,
    ''::character varying(256) AS claimant_name,
    ''::character varying(256) AS claimant_first,
    ''::character varying(256) AS claimant_middle,
    ''::character varying(256) AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    a.loss_date,
    ''::character varying(256) AS loss_time,
    a.report_date,
    ''::character varying(256) AS closed_date,
    ''::character varying(256) AS reopen_date,
    ''::character varying(256) AS litigation,
    ''::character varying(256) AS days_employed,
    ''::character varying(256) AS claimant_gender,
    ''::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    ''::character varying(256) AS carrier_body_part,
        CASE
            WHEN a.policy_type::text = 'BAP'::text THEN a.loss_description
            ELSE ''::character varying(256)
        END AS carrier_cause,
    concat('CMIC', ' - ', a.policy_type)::character varying(256) AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat('CMIC', ' - ', a.insured_name, ' - ', a.policy_type, ' - ', a.policy_number, ' - ', date_part('month'::text, a.loss_date::date), '/', date_part('year'::text, a.loss_date::date))::character varying(256) AS carrier_policy_number,
    'raw_cmic'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_cmic a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_cmic OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_cmic to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_cmic to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_cmic to rpauser;
GO
GRANT SELECT ON p_and_c.normal_cmic to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_cmic to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_cmic to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_cmic to rl_p_and_c_d;
GO