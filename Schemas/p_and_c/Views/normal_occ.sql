CREATE OR REPLACE VIEW p_and_c.normal_occ
AS SELECT DISTINCT concat('OCC', '-', a.claim_number)::character varying(256) AS claim_number,
    a.claim_number AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    a.expense_paid AS paid_expense,
    a.expense_reserves AS reserve_expense,
    a.indemnity_paid AS paid_indemnity,
    a.medical_paid AS paid_medical,
    a.indemnity_reserves AS reserve_indemnity,
    a.medical_reserves AS reserve_medical,
    a.actual_recov AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
        CASE
            WHEN a.status::text = 'C'::text THEN 'Closed'::character varying(256)
            ELSE
            CASE
                WHEN a.status::text = 'O'::text THEN 'Open'::character varying(256)
                ELSE
                CASE
                    WHEN a.status::text = 'R'::text THEN 'Reopen'::character varying(256)
                    ELSE ''::character varying(256)
                END
            END
        END AS claim_status,
    ''::character varying(256) AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    a.state AS claim_state,
    ''::character varying(256) AS claim_zip,
    ''::character varying(256) AS claim_site,
    a.state AS benefit_state,
    ''::character varying(256) AS garage_state,
    ''::character varying(256) AS occupation,
    a.ncci_class AS class_code,
    a.claimant_name,
    split_part(a.claimant_name::text, ' '::text, 2)::character varying(256) AS claimant_first,
    split_part(split_part(a.claimant_name::text, ', '::text, 2), ' '::text, 2)::character varying(256) AS claimant_middle,
    split_part(a.claimant_name::text, ','::text, 1)::character varying(256) AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    a.date_of_injury AS loss_date,
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
    a.injury_desc AS carrier_body_part,
    a.injury_desc AS carrier_cause,
    a.claim_type AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    a.claim_type AS carrier_injury_code,
    concat('OCC', ' - ', a.insured, ' - ', a.policy_number, ' - ', a.start_date)::character varying(256) AS carrier_policy_number,
    'raw_occ'::character varying(256) AS source_table,
    a.uploaded_at
   FROM p_and_c.raw_occ a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_occ OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_occ to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_occ to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_occ to rpauser;
GO
GRANT SELECT ON p_and_c.normal_occ to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_occ to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_occ to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_occ to rl_p_and_c_d;
GO