CREATE OR REPLACE VIEW p_and_c.normal_obam
AS SELECT DISTINCT concat('OBAM', '-', a.claim_number)::character varying(256) AS claim_number,
    a.claim_number AS occurrence_number,
    a.cert_number AS claimant_number,
    ((a.expenses_paid::numeric + a.legal_expenses::numeric))::character varying(256) AS paid_expense,
    a.alloc_exp_rsv AS reserve_expense,
        CASE
            WHEN a.loss_type::text ~~* '%disability%'::text THEN a.loss_paid
            ELSE '0.00'::character varying(256)
        END AS paid_indemnity,
        CASE
            WHEN a.loss_type::text !~~* '%disability%'::text THEN a.loss_paid
            ELSE '0.00'::character varying(256)
        END AS paid_medical,
        CASE
            WHEN a.loss_type::text ~~* '%disability%'::text THEN a.loss_reserve
            ELSE '0.00'::character varying(256)
        END AS reserve_indemnity,
        CASE
            WHEN a.loss_type::text !~~* '%disability%'::text THEN a.loss_reserve
            ELSE '0.00'::character varying(256)
        END AS reserve_medical,
    a.recovery_amount AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
    a.claim_status,
    a.claim_description AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    a.accident_location AS claim_city,
    a.accident_state AS claim_state,
    ''::character varying(256) AS claim_zip,
    a.location_description AS claim_site,
    a.accident_state AS benefit_state,
    a.accident_state AS garage_state,
    a.occupation_code AS occupation,
    a.occupation_code AS class_code,
    a.claimant_name,
        CASE
            WHEN a.claimant_name::text ~~* '%versto%'::text THEN ''::text
            ELSE split_part(a.claimant_name::text, ', '::text, 2)
        END AS claimant_first,
    ''::character varying(256) AS claimant_middle,
        CASE
            WHEN a.claimant_name::text = ','::text THEN ''::text
            WHEN a.claimant_name::text ~~* '%versto%'::text THEN ''::text
            ELSE split_part(a.claimant_name::text, ', '::text, 1)
        END AS claimant_last,
    a.driver_first_name AS driver_first,
    ''::character varying(256) AS driver_middle,
    a.driver_last_name AS driver_last,
    a.date_of_loss AS loss_date,
    ''::character varying(256) AS loss_time,
    a.date_reported AS report_date,
    a.closed_date,
    ''::character varying(256) AS reopen_date,
        CASE
            WHEN a.suit::text = 'N'::text THEN 'No'::character varying(256)
            ELSE
            CASE
                WHEN a.suit::text = 'Y'::text THEN 'Yes'::character varying(256)
                ELSE a.suit
            END
        END AS litigation,
    ''::character varying(256) AS days_employed,
    ''::character varying(256) AS claimant_gender,
        CASE
            WHEN a.age::text = ''::text THEN ''::character varying(256)
            ELSE
            CASE
                WHEN a.age::numeric > 0::numeric THEN a.age
                ELSE ''::character varying(256)
            END
        END AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    ''::character varying(256) AS carrier_body_part,
    concat(a.cause_of_accident_description_1, ' - ', a.cause_of_accident_description_2, ' - ', a.cause_of_accident_description_3)::character varying(256) AS carrier_cause,
    concat(a.major_line_description, ' - ', a.loss_type_description)::character varying(256) AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    a.loss_type_description AS carrier_injury_code,
    concat('OBAM', ' - ', a.insured_name, ' - ', a.policy_number, ' - ', a.attaching_date, ' - ', a.major_line_description)::character varying(256) AS carrier_policy_number,
    'raw_obam'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_obam a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_obam OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_obam to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_obam to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_obam to rpauser;
GO
GRANT SELECT ON p_and_c.normal_obam to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_obam to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_obam to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_obam to rl_p_and_c_d;
GO