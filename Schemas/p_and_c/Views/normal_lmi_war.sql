CREATE OR REPLACE VIEW p_and_c.normal_lmi_war
AS SELECT DISTINCT concat('LMI_WAR_', '-', a.claim_number)::character varying(256) AS claim_number,
    a.claim_number AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    a.paid_exp AS paid_expense,
    ((a.inc_exp::numeric - a.paid_exp::numeric))::character varying(256) AS reserve_expense,
    a.paid_indem AS paid_indemnity,
    a.paid_med AS paid_medical,
    ((a.inc_indem::numeric - a.paid_indem::numeric))::character varying(256) AS reserve_indemnity,
    ((a.inc_med::numeric - a.paid_med::numeric))::character varying(256) AS reserve_medical,
    '0.00'::character varying(256) AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
    a.status AS claim_status,
    ''::character varying(256) AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    a.jurisdiction_state AS claim_state,
    ''::character varying(256) AS claim_zip,
    a.location_code_desc AS claim_site,
    a.jurisdiction_state AS benefit_state,
    ''::character varying(256) AS garage_state,
    ''::character varying(256) AS occupation,
    ''::character varying(256) AS class_code,
    a.claimant_name,
    split_part(split_part(a.claimant_name::text, ', '::text, 2), ' '::text, 1) AS claimant_first,
    split_part(a.claimant_name::text, ' '::text, 3) AS claimant_middle,
    split_part(a.claimant_name::text, ', '::text, 1) AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    a.loss_date,
    ''::character varying(256) AS loss_time,
    a.report_date,
    a.close_date AS closed_date,
    ''::character varying(256) AS reopen_date,
    ''::character varying(256) AS litigation,
    ''::character varying(256) AS days_employed,
    ''::character varying(256) AS claimant_gender,
    ''::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    a.part_of_body AS carrier_body_part,
    a.cause AS carrier_cause,
    a.lob AS carrier_coverage_type,
    a.nature_of_injury AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat('LMI_WAR - ', a.client_id, ' - ', a.effective_date, ' - ', a.lob)::character varying(256) AS carrier_policy_number,
    'raw_lmi_war'::character varying(256) AS source_table,
    a.uploaded_at
   FROM p_and_c.raw_lmi_war a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_lmi_war OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_lmi_war to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_lmi_war to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_lmi_war to rpauser;
GO
GRANT SELECT ON p_and_c.normal_lmi_war to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_lmi_war to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_lmi_war to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_lmi_war to rl_p_and_c_d;
GO