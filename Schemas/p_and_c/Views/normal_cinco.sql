CREATE OR REPLACE VIEW p_and_c.normal_cinco
AS SELECT DISTINCT concat('CINCO', '-', a.policy, a.loss_date, a.oc)::character varying(256) AS claim_number,
    concat(a.policy, a.loss_date, a.oc) AS occurrence_number,
    a.oc AS claimant_number,
    a.expense AS paid_expense,
    '0.00'::character varying(256) AS reserve_expense,
    a.paid AS paid_indemnity,
    '0.00'::character varying(256) AS paid_medical,
        CASE
            WHEN a.end_rsv_or_month_closed::text ~~* '%/%'::text OR a.end_rsv_or_month_closed::text ~~* '%-%'::text THEN '0.00'::character varying(256)
            ELSE a.end_rsv_or_month_closed
        END AS reserve_indemnity,
    '0.00'::character varying(256) AS reserve_medical,
    a.salv_subr AS subrogation,
    '0.00'::character varying AS reimbursed,
        CASE
            WHEN a.end_rsv_or_month_closed::text ~~* '%/%'::text OR a.end_rsv_or_month_closed::text ~~* '%-%'::text THEN 'Closed'::character varying(256)
            ELSE 'Open'::character varying
        END AS claim_status,
    a.loss_description AS description_text,
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
    a.claimant_payee AS claimant_name,
        CASE
            WHEN a.claimant_payee::text ~~ '% % %'::text THEN ''::character varying(256)::text
            ELSE split_part(a.claimant_payee::text, ' '::text, 1)
        END AS claimant_first,
    ''::character varying(256) AS claimant_middle,
        CASE
            WHEN a.claimant_payee::text ~~ '% % %'::text THEN ''::character varying(256)::text
            ELSE split_part(a.claimant_payee::text, ' '::text, 2)
        END AS claimant_last,
        CASE
            WHEN a.claimant_payee::text ~~ '% % %'::text THEN ''::character varying(256)::text
            ELSE split_part(a.claimant_payee::text, ' '::text, 1)
        END AS driver_first,
    ''::character varying(256) AS driver_middle,
        CASE
            WHEN a.claimant_payee::text ~~ '% % %'::text THEN ''::character varying(256)::text
            ELSE split_part(a.claimant_payee::text, ' '::text, 2)
        END AS driver_last,
    a.loss_date,
    ''::character varying(256) AS loss_time,
    ''::character varying(256) AS report_date,
        CASE
            WHEN a.end_rsv_or_month_closed::text ~ '[0-9]/1/[0-9]{4}'::text THEN concat("right"(a.end_rsv_or_month_closed::text, 4), '-0', "left"(a.end_rsv_or_month_closed::text, 1), '-01')::character varying(256)
            WHEN a.end_rsv_or_month_closed::text ~ '1[0-2]/1/[0-9]{4}'::text THEN concat("right"(a.end_rsv_or_month_closed::text, 4), '-', "left"(a.end_rsv_or_month_closed::text, 2), '-01')::character varying(256)
            WHEN a.end_rsv_or_month_closed::text ~ '[0-9]{2}-[A-Za-z]{3}'::text THEN concat('20', "left"(a.end_rsv_or_month_closed::text, 2), '-', mr.num_order::text, '-01')::character varying(256)
            WHEN a.end_rsv_or_month_closed::text ~ '[0-9]{2}-[0-9]{4}'::text THEN concat("right"(a.end_rsv_or_month_closed::text, 4), '-', "left"(a.end_rsv_or_month_closed::text, 2), '-01')::character varying(256)
            WHEN a.end_rsv_or_month_closed::text ~ '[0-9]{4}-[A-Za-z]{3}'::text THEN concat("left"(a.end_rsv_or_month_closed::text, 4), '-', mr.num_order::text, '-01')::character varying(256)
            WHEN a.end_rsv_or_month_closed::text ~ '[A-Za-z]{3}-[0-9]{2}'::text THEN concat('20', "right"(a.end_rsv_or_month_closed::text, 2), '-', ml.num_order::text, '-01')::character varying(256)
            ELSE NULL::character varying(256)
        END AS closed_date,
    ''::character varying(256) AS reopen_date,
    ''::character varying(256) AS litigation,
    ''::character varying(256) AS days_employed,
    ''::character varying(256) AS claimant_gender,
    ''::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    ''::character varying(256) AS carrier_body_part,
    a.loss_description AS carrier_cause,
    concat('CINCO', ' - ', a.loss_type)::character varying(256) AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    Case when a.loss_date = '' 
    OR a.loss_date is NULL then ''::character varying(256)
    else concat('CINCO', ' - ', a.named_insured, ' - ', a.policy, ' - ', a.loss_date::date, ' - ', a.loss_type)::character varying(256) END AS carrier_policy_number,
    'raw_cinco'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_cinco a
     LEFT JOIN p_and_c.mapping_months mr ON "right"(a.end_rsv_or_month_closed::text, 3) = mr.abbreviation::text
     LEFT JOIN p_and_c.mapping_months ml ON "left"(a.end_rsv_or_month_closed::text, 3) = ml.abbreviation::text
     WHERE (a.loss_date='') IS FALSE;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_cinco OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_cinco to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_cinco to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_cinco to rpauser;
GO
GRANT SELECT ON p_and_c.normal_cinco to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_cinco to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_cinco to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_cinco to rl_p_and_c_d;
GO