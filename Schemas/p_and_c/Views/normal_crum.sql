CREATE OR REPLACE VIEW p_and_c.normal_crum
AS SELECT DISTINCT concat('CRUM', '-', a.claim_number)::character varying(256) AS claim_number,
    a.claim_number AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    a.alae AS paid_expense,
    '0.00'::character varying(256) AS reserve_expense,
    a.paid AS paid_indemnity,
    '0.00'::character varying(256) AS paid_medical,
    a.os_reserve AS reserve_indemnity,
    '0,00'::character varying(256) AS reserve_medical,
    a.subro_salvage AS subrogation,
    '0.00'::character varying AS reimbursed,
        CASE
            WHEN a.claim_status::text = 'C'::text THEN 'Closed'::character varying(256)
            ELSE
            CASE
                WHEN a.claim_status::text = 'O'::text THEN 'Open'::character varying(256)
                ELSE a.claim_status
            END
        END AS claim_status,
    a.accident_description::character varying(256) AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    a.accident_state AS claim_state,
    ''::character varying(256) AS claim_zip,
    a.loc_dept AS claim_site,
    a.accident_state AS benefit_state,
    a.accident_state AS garage_state,
    ''::character varying(256) AS occupation,
    ''::character varying(256) AS class_code,
    a.claimant_name,
    ''::character varying(256) AS claimant_first,
    ''::character varying(256) AS claimant_middle,
    ''::character varying(256) AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    a.date_of_loss AS loss_date,
    ''::character varying(256) AS loss_time,
    a.date_reported AS report_date,
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
    concat('CRUM', ' - ', a.claim_type, ' - ', a.damage_type)::character varying(256) AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat('CRUM', ' - ', a.insured_name, ' - ', a.claim_type, ' - ', a.date_of_loss, ' - ', a.policy_number)::character varying(256) AS carrier_policy_number,
    'raw_crum'::character varying(256) AS source_table,
    a.uploaded_at
   FROM p_and_c.raw_crum a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_crum OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_crum to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_crum to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_crum to rpauser;
GO
GRANT SELECT ON p_and_c.normal_crum to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_crum to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_crum to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_crum to rl_p_and_c_d;
GO