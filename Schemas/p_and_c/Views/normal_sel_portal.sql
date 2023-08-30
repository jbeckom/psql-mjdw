CREATE OR REPLACE VIEW p_and_c.normal_sel_portal
AS SELECT DISTINCT concat('SEL', '-', a.loss_file)::character varying(256) AS claim_number,
    a.loss_file AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    a.expense_payments AS paid_expense,
    ''::character varying(256) AS reserve_expense,
    a.loss_payments AS paid_indemnity,
    '0.00'::character varying(256) AS paid_medical,
    a.loss_reserves AS reserve_indemnity,
    '0.00'::character varying(256) AS reserve_medical,
    (('-1'::integer::numeric *
        CASE
            WHEN a.loss_recoveries::text = ''::text THEN 0::numeric
            ELSE replace(a.loss_recoveries::text, ','::text, ''::text)::numeric
        END))::character varying(256) AS subrogation,
    '0.00'::character varying AS reimbursed,
        CASE
            WHEN a.status::text = 'CLOSED'::text THEN 'Closed'::character varying(256)
            ELSE
            CASE
                WHEN a.status::text = 'OPEN'::text THEN 'Open'::character varying(256)
                ELSE
                CASE
                    WHEN a.status::text = 'Pending'::text THEN 'Open'::character varying(256)
                    ELSE
                    CASE
                        WHEN a.status::text = 'Report Only'::text THEN 'Closed'::character varying(256)
                        ELSE a.status
                    END
                END
            END
        END AS claim_status,
    a.loss_description AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    ''::character varying(256) AS claim_state,
    ''::character varying(256) AS claim_zip,
    a.location_identifier_exposure_location AS claim_site,
    ''::character varying(256) AS benefit_state,
    ''::character varying(256) AS garage_state,
    ''::character varying(256) AS occupation,
    a.class_code,
    a.claimant AS claimant_name,
        CASE
            WHEN a.claimant::text ~~* '%&%'::text THEN a.claimant
            WHEN a.claimant::text ~~* '%LLC%'::text THEN a.claimant
            ELSE split_part(a.claimant::text, ' '::text, 2)::character varying(256)
        END AS claimant_first,
    ''::character varying(256) AS claimant_middle,
        CASE
            WHEN a.claimant::text ~~* '%&%'::text THEN ''::character varying(256)
            WHEN a.claimant::text ~~* '%LLC%'::text THEN ''::character varying(256)
            ELSE split_part(a.claimant::text, ','::text, 1)::character varying(256)
        END AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    a.date_of_loss AS loss_date,
    ''::character varying(256) AS loss_time,
    ((a.date_of_loss::date + a.lag_time::integer))::character varying(256) AS report_date,
        CASE
            WHEN a.status::text = 'CLOSED'::text THEN a.date
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
    "right"(a.loss_description::text, strpos(reverse(a.loss_description::text), '-'::text) - 1)::character varying(256) AS carrier_cause,
    concat('SEL', ' - ', a.large_account, ' - ', a.coverage)::character varying(256) AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat('SEL', ' - ', a.client_name, ' - ', a.large_account, ' - ', a.policy, ' - ', date_part('month'::text, a.date_of_loss::date), '/', date_part('year'::text, a.date_of_loss::date))::character varying(256) AS carrier_policy_number,
    'raw_sel_portal'::character varying(256) AS source_table,
    a.uploaded_at
   FROM p_and_c.raw_sel_portal a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_sel_portal OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_sel_portal to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_sel_portal to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_sel_portal to rpauser;
GO
GRANT SELECT ON p_and_c.normal_sel_portal to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_sel_portal to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_sel_portal to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_sel_portal to rl_p_and_c_d;
GO