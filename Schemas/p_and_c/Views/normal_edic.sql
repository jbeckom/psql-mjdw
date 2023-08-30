CREATE OR REPLACE VIEW p_and_c.normal_edic
AS SELECT DISTINCT concat('EDIC', '-', split_part(a.claim_number::text, ' '::text, 1))::character varying(256) AS claim_number,
    split_part(a.claim_number::text, ' '::text, 1)::character varying(256) AS occurrence_number,
    "right"(a.claim_number::text, 2)::character varying(256) AS claimant_number,
    a.expense_paid AS paid_expense,
    a.expense_reserve AS reserve_expense,
    a.indemnity_paid AS paid_indemnity,
    a.medical_paid AS paid_medical,
    a.indemnity_reserve AS reserve_indemnity,
    a.medical_reserve AS reserve_medical,
    a.subro_salvage AS subrogation,
    a.deductible_recovery AS reimbursed,
    initcap(a.claim_status::text) AS claim_status,
    a.description_of_loss AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    "left"(a.loss_state_loc_veh_num::text, 2) AS claim_state,
    ''::character varying(256) AS claim_zip,
    ''::character varying(256) AS claim_site,
    ''::character varying(256) AS benefit_state,
    ''::character varying(256) AS garage_state,
    ''::character varying(256) AS occupation,
    a.driver_class_cd AS class_code,
    a.claimant_name,
        CASE
            WHEN a.claimant_name::text ~~ '%,%'::text THEN split_part(a.claimant_name::text, ', '::text, 2)
            ELSE split_part(a.claimant_name::text, ' '::text, 1)
        END AS claimant_first,
    ''::character varying(256) AS claimant_middle,
        CASE
            WHEN a.claimant_name::text ~~ '%,%'::text THEN split_part(a.claimant_name::text, ', '::text, 1)
            ELSE split_part(a.claimant_name::text, ' '::text, 2)
        END AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    a.date_of_loss AS loss_date,
    ''::character varying(256) AS loss_time,
    a.date_reported AS report_date,
    a.closed_date,
    ''::character varying(256) AS reopen_date,
    ''::character varying(256) AS litigation,
    ''::character varying(256) AS days_employed,
    ''::character varying(256) AS claimant_gender,
    ''::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    ''::character varying(256) AS carrier_body_part,
    a.cause_of_loss AS carrier_cause,
    concat('EDIC', ' - ', a.lob)::character varying(256) AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    a.cause_of_loss AS carrier_injury_code,
    concat('EDIC', ' - ', a.insured, ' - ', concat(date_part('month'::text, a.date_of_loss::date), '/', date_part('year'::text, a.date_of_loss::date)), ' - ', a.policy_number, ' - ', a.cause_of_loss)::character varying(256) AS carrier_policy_number,
    'raw_edic'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_edic a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_edic OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_edic to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_edic to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_edic to rpauser;
GO
GRANT SELECT ON p_and_c.normal_edic to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_edic to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_edic to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_edic to rl_p_and_c_d;
GO