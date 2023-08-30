CREATE OR REPLACE VIEW p_and_c.normal_nav
AS SELECT DISTINCT concat('NAV', '-', a.claim_number)::character varying(256) AS claim_number,
    a.claim_number AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    '0.00'::character varying(256) AS paid_expense,
    '0.00'::character varying(256) AS reserve_expense,
    a.gross_paid AS paid_indemnity,
    '0.00'::character varying(256) AS paid_medical,
    a.gross_outstanding AS reserve_indemnity,
    '0.00'::character varying(256) AS reserve_medical,
    '0.00'::character varying(256) AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
    a.status AS claim_status,
    ''::character varying(256) AS description_text,
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
    a.claimant_name,
    split_part(a.claimant_name::text, ', '::text, 2) AS claimant_first,
    ''::character varying(256) AS claimant_middle,
    split_part(a.claimant_name::text, ', '::text, 1) AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    a.date_of_loss AS loss_date,
    ''::character varying(256) AS loss_time,
    ''::character varying(256) AS report_date,
    ''::character varying(256) AS closed_date,
    ''::character varying(256) AS reopen_date,
    ''::character varying(256) AS litigation,
    ''::character varying(256) AS days_employed,
    ''::character varying(256) AS claimant_gender,
    ''::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    ''::character varying(256) AS carrier_body_part,
    ''::character varying(256) AS carrier_cause,
    a.claim_title AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat('NAV', ' - ', a.assured_name, ' - ', a.effective_date, ' - ', a.policy_number)::character varying(256) AS carrier_policy_number,
    'raw_nav'::character varying(256) AS source_table,
    a.uploaded_at
   FROM p_and_c.raw_nav a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_nav OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_nav to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_nav to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_nav to rpauser;
GO
GRANT SELECT ON p_and_c.normal_nav to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_nav to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_nav to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_nav to rl_p_and_c_d;
GO