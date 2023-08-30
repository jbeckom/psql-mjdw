CREATE OR REPLACE VIEW p_and_c.normal_ipep
AS SELECT DISTINCT concat('IPEP', '-', a.claim_number)::character varying(256) AS claim_number,
    a.claim_number AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    ((a.payment_amount4::numeric(12,2) + a.payment_amount5::numeric(12,2) + a.payment_amount6::numeric(12,2)))::character varying(256) AS paid_expense,
        CASE
            WHEN a.claimant_status_desc::text = 'Closed'::text THEN '0.00'::character varying(256)
            ELSE ((a.reserve_amount4::numeric(12,2) + a.reserve_amount5::numeric(12,2) + a.reserve_amount6::numeric(12,2) - a.payment_amount4::numeric - a.payment_amount5::numeric - a.payment_amount6::numeric))::character varying(256)
        END AS reserve_expense,
    ((a.payment_amount1::numeric(12,2) + a.payment_amount2::numeric(12,2)))::character varying(256) AS paid_indemnity,
    a.payment_amount3::numeric(12,2)::character varying(256) AS paid_medical,
        CASE
            WHEN a.claimant_status_desc::text = 'Closed'::text THEN '0.00'::character varying(256)
            ELSE ((a.reserve_amount1::numeric(12,2) + a.reserve_amount2::numeric(12,2) - (a.payment_amount1::numeric + a.payment_amount2::numeric)))::character varying(256)
        END AS reserve_indemnity,
        CASE
            WHEN a.claimant_status_desc::text = 'Closed'::text THEN '0.00'::character varying(256)
            ELSE ((a.reserve_amount3::numeric - a.payment_amount3::numeric))::character varying(256)
        END AS reserve_medical,
    '0.00'::character varying(256) AS subrogation,
    a.payment_no_reserve AS reimbursed,
        CASE
            WHEN a.claimant_status_desc::text = 'Re-Open'::text THEN 'Reopen'::character varying(256)
            ELSE a.claimant_status_desc
        END AS claim_status,
    a.incident_desc AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    'IN'::character varying(256) AS claim_state,
    ''::character varying(256) AS claim_zip,
    ''::character varying(256) AS claim_site,
    'IN'::character varying(256) AS benefit_state,
    ''::character varying(256) AS garage_state,
    a.class_code AS occupation,
    a.class_code,
    a.claimant_name,
    split_part(split_part(a.claimant_name::text, ', '::text, 2), ' '::text, 1) AS claimant_first,
    split_part(split_part(a.claimant_name::text, ', '::text, 2), ' '::text, 2) AS claimant_middle,
    split_part(a.claimant_name::text, ', '::text, 1) AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    a.incident_date::date::character varying(256) AS loss_date,
    a.incident_date::time without time zone::character varying(256) AS loss_time,
    a.adjusting_loc_received_date::date::character varying(256) AS report_date,
        CASE
            WHEN a.closed_date::text = ''::text THEN ''::character varying(256)
            ELSE a.closed_date::date::character varying(256)
        END AS closed_date,
    ''::character varying(256) AS reopen_date,
        CASE
            WHEN a.litigated::text = '1'::text THEN 'Yes'::character varying(256)
            ELSE 'No'::character varying(256)
        END AS litigation,
    case when hire_date != '' then (incident_date::date - hire_date::date)::character varying(256) else null end AS days_employed,
    ''::character varying(256) AS claimant_gender,
    ((date_part('year'::text, a.incident_date::date) - date_part('year'::text,
        CASE
            WHEN a.birth_date::date > CURRENT_DATE THEN a.birth_date::date - '100 years'::interval
            ELSE a.birth_date::date::timestamp without time zone
        END)))::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    a.body_part_desc AS carrier_body_part,
    a.claim_cause_desc AS carrier_cause,
    concat('IPEP', ' - ', 'WCO')::character varying(256) AS carrier_coverage_type,
    a.nature_of_injury_desc AS carrier_nature,
    a.claimant_type_desc AS carrier_injury_code,
    concat('IPEP', ' - ', a.org1_desc, ' - ', a.policy_effective_date::date, ' - ', 'WC', ' - ', a.policy_number)::character varying(256) AS carrier_policy_number,
    'raw_ipep'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_ipep a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_ipep OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_ipep to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_ipep to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_ipep to rpauser;
GO
GRANT SELECT ON p_and_c.normal_ipep to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_ipep to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_ipep to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_ipep to rl_p_and_c_d;
GO