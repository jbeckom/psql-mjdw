CREATE OR REPLACE VIEW p_and_c.normal_summit
AS SELECT DISTINCT concat('SUMMIT', '-', a.claim_number)::character varying(256) AS claim_number,
    a.claim_number AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    a.paid_to_date_other AS paid_expense,
    a.reserves_other AS reserve_expense,
    a.paid_to_date_indemnity AS paid_indemnity,
    a.paid_to_date_medical AS paid_medical,
    a.reserves_indemnity AS reserve_indemnity,
    a.reserves_medical AS reserve_medical,
    '0.00'::character varying(256) AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
        CASE
            WHEN a.claim_status::text = 'CLOSED'::text THEN 'Closed'::character varying(256)
            ELSE
            CASE
                WHEN a.claim_status::text = 'OPEN'::text THEN 'Open'::character varying(256)
                ELSE a.claim_status
            END
        END AS claim_status,
    a.description AS description_text,
    split_part(a.work_location::text, ','::text, 1)::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    split_part(split_part(a.work_location::text, ','::text, 2), ' '::text, 2)::character varying(256) AS claim_city,
    split_part(split_part(a.work_location::text, ','::text, 2), ' '::text, 4)::character varying(256) AS claim_state,
    split_part(split_part(a.work_location::text, ','::text, 3), ' '::text, 2)::character varying(256) AS claim_zip,
    a.work_location AS claim_site,
    split_part(split_part(a.work_location::text, ','::text, 2), ' '::text, 4)::character varying(256) AS benefit_state,
    ''::character varying(256) AS garage_state,
    a.job_title AS occupation,
    a.work_code AS class_code,
    a.injured_worker AS claimant_name,
    split_part(split_part(a.injured_worker::text, ', '::text, 2), ' '::text, 1)::character varying(256) AS claimant_first,
    split_part(split_part(a.injured_worker::text, ', '::text, 2), ' '::text, 2)::character varying(256) AS claimant_middle,
    split_part(a.injured_worker::text, ','::text, 1)::character varying(256) AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    a.date_of_injury AS loss_date,
    ''::character varying(256) AS loss_time,
    a.reported_to_carrier AS report_date,
        CASE
            WHEN a.closed_date::text = 'N/A'::text THEN ''::character varying(256)
            ELSE a.closed_date
        END AS closed_date,
    ''::character varying(256) AS reopen_date,
    ''::character varying(256) AS litigation,
    ((a.date_of_injury::date - a.hire_date::date))::character varying(256) AS days_employed,
    ''::character varying(256) AS claimant_gender,
    ''::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    a.body_part AS carrier_body_part,
    a.cause_of_injury AS carrier_cause,
    concat('SUMMIT', ' - ', a.claim_type)::character varying(256) AS carrier_coverage_type,
    a.nature_of_injury AS carrier_nature,
    a.claim_type AS carrier_injury_code,
    concat('SUMMIT', ' - ', a.insured, ' - ', a.policy_number, ' - ', a.date_of_injury)::character varying(256) AS carrier_policy_number,
    'raw_summit'::character varying(256) AS source_table,
    a.uploaded_at
   FROM p_and_c.raw_summit a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_summit OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_summit to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_summit to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_summit to rpauser;
GO
GRANT SELECT ON p_and_c.normal_summit to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_summit to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_summit to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_summit to rl_p_and_c_d;
GO