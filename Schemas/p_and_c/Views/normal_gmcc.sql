CREATE OR REPLACE VIEW p_and_c.normal_gmcc
AS SELECT DISTINCT concat('GMCC', '-', a.claim_number)::character varying(256) AS claim_number,
    a.claim_number AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    '0.00'::character varying(256) AS pais_expense,
    '0.00'::character varying(256) AS reserve_expense,
    a.amt_paid AS paid_indemnity,
    '0.00'::character varying(256) AS paid_medical,
    a.reserve AS reserve_indemnity,
    '0.00'::character varying(256) AS reserve_medical,
    '0.00'::character varying(256) AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
        CASE
            WHEN a.reserve::numeric > 0::numeric THEN 'Open'::character varying(256)
            ELSE 'Closed'::character varying(256)
        END AS claim_status,
    a.description AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    ''::character varying(256) AS claim_state,
    ''::character varying(256) AS claim_zip,
    a.loc_unit AS claim_site,
    ''::character varying(256) AS benefit_state,
    ''::character varying(256) AS garage_state,
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
        CASE
            WHEN a.policy_number::text ~~ 'CA%'::text THEN a.description
            ELSE a.cause_of_loss
        END AS carrier_cause,
    concat('GMCC', ' - ', "left"(a.policy_number::text, 2), ' - ', a.cause_of_loss)::character varying(256) AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    a.cause_of_loss AS carrier_injury_code,
    concat('GMCC', ' - ', a.name_insured, ' - ', concat(date_part('month'::text, a.loss_date::date), '/', date_part('year'::text, a.loss_date::date)), ' - ', a.policy_number, ' - ', a.cause_of_loss)::character varying(256) AS carrier_policy_number,
    'raw_gmcc'::character varying(256) AS source_table,
    a.uploaded_at
   FROM p_and_c.raw_gmcc a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_gmcc OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_gmcc to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_gmcc to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_gmcc to rpauser;
GO
GRANT SELECT ON p_and_c.normal_gmcc to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_gmcc to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_gmcc to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_gmcc to rl_p_and_c_d;
GO