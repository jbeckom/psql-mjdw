CREATE OR REPLACE VIEW p_and_c.normal_sompo_gli
AS SELECT DISTINCT concat('SOMPO_GLI', '-',
        CASE
            WHEN a."claim_#"::text = ''::text THEN a."tpa_claim_#"
            ELSE a."claim_#"
        END)::character varying(256) AS claim_number,
        CASE
            WHEN a."claim_#"::text = ''::text THEN a."tpa_claim_#"
            ELSE a."claim_#"
        END AS occurrence_number,
    a.suffix AS claimant_number,
    a.expense_paid AS paid_expense,
    a.expense_reserve AS reserve_expense,
    a.indemnity_paid AS paid_indemnity,
    '0.00'::character varying(256) AS paid_medical,
    replace(a.indemnity_reserve,',','')::character varying(256) AS reserve_indemnity,
    '0.00'::character varying(256) AS reserve_medical,
    (('-1'::integer * replace(a.subro_recovery,',','')::double precision))::character varying(256) AS subrogation,
    (('-1'::integer * replace(a.claim_recovery,',','')::double precision))::character varying(256) AS reimbursed,
        CASE
            WHEN a.status::text = 'CLOSED'::text THEN 'Closed'::character varying(256)
            ELSE
            CASE
                WHEN a.status::text = 'OPEN'::text THEN 'Open'::character varying(256)
                ELSE a.status
            END
        END AS claim_status,
    a.accident_description AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    a.state AS claim_state,
    ''::character varying(256) AS claim_zip,
    a.loc_code AS claim_site,
    a.state AS benefit_state,
    ''::character varying(256) AS garage_state,
    ''::character varying(256) AS occupation,
    ''::character varying(256) AS class_code,
    a.claimant_name,
        CASE
            WHEN a.claimant_name::text ~~* '%KYB%'::text THEN ''::character varying(256)
            ELSE split_part(a.claimant_name::text, ' '::text, 1)::character varying(256)
        END AS claimant_first,
    ''::character varying(256) AS claimant_middle,
        CASE
            WHEN a.claimant_name::text ~~* '%KYB%'::text THEN ''::character varying(256)
            ELSE split_part(a.claimant_name::text, ' '::text, 2)::character varying(256)
        END AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    a.accident_date::character varying(256) AS loss_date,
    ''::character varying(256) AS loss_time,
    a.report_date::character varying(256),
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
    'SOMPO_GLI - GLI'::character varying(256) AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat('SOMPO_GLI', ' - ', a.named_insured, ' - ', a.policy_effective_year, ' - ', a."policy_#")::character varying(256) AS carrier_policy_number,
    'raw_sompo_gli'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_sompo_gli a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_sompo_gli OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_sompo_gli to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_sompo_gli to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_sompo_gli to rpauser;
GO
GRANT SELECT ON p_and_c.normal_sompo_gli to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_sompo_gli to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_sompo_gli to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_sompo_gli to rl_p_and_c_d;
GO