CREATE OR REPLACE VIEW p_and_c.normal_starr
AS SELECT DISTINCT concat('STARR', '-', a.claim_number)::character varying(256) AS claim_number,
    a.claim_number AS occurrence_number,
    a.occurrence_id AS claimant_number,
    a.expense_paid AS paid_expense,
    a.expense_outstanding AS reserve_expense,
    a.ind_bi_paid AS paid_indemnity,
    a.med_propdmg_paid AS paid_medical,
    a.ind_bi_outstanding AS reserve_indemnity,
    a.med_propdmg_outstanding AS reserve_medical,
    case when 
    a.recovered_incurred= '' then '0.00'::character varying (256)
    else (('-1'::integer * a.recovered_incurred::double precision))::character varying(256) END AS subrogation,
    a.reimbursed,
        CASE
            WHEN a.claim_status::text = 'Reopened'::text THEN 'Reopen'::character varying(256)
            ELSE a.claim_status
        END AS claim_status,
    a.desc_of_accident AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    a.juris_acc_state AS claim_state,
    ''::character varying(256) AS claim_zip,
    concat(a.location_codes_13, ' - ', a.location_codes_46)::character varying(256) AS claim_site,
    a.juris_acc_state AS benefit_state,
    ''::character varying(256) AS garage_state,
    a.occupation,
    ''::character varying(256) AS class_code,
    a.claimant_name,
        CASE
            WHEN a.claimant_name::text ~~* '% inc%'::text THEN ''::character varying(256)
            WHEN a.claimant_name::text ~~* '%/%'::text THEN reverse(split_part(reverse(a.claimant_name::text), ' '::text, 2))::character varying(256)
            WHEN a.claimant_name::text !~~ '%,%'::text THEN ''::character varying(256)
            ELSE split_part(a.claimant_name::text, ' '::text, 2)::character varying(256)
        END AS claimant_first,
        CASE
            WHEN a.claimant_name::text ~~* '% inc%'::text THEN ''::character varying(256)
            WHEN a.claimant_name::text ~~* '%/%'::text THEN ''::character varying(256)
            WHEN a.claimant_name::text !~~ '%,%'::text THEN ''::character varying(256)
            ELSE split_part(a.claimant_name::text, ' '::text, 3)::character varying(256)
        END AS claimant_middle,
        CASE
            WHEN a.claimant_name::text ~~* '% inc%'::text THEN ''::character varying(256)
            WHEN a.claimant_name::text ~~* '%/%'::text THEN reverse(split_part(reverse(a.claimant_name::text), ' '::text, 1))::character varying(256)
            WHEN a.claimant_name::text !~~ '%,%'::text THEN ''::character varying(256)
            ELSE split_part(a.claimant_name::text, ','::text, 1)::character varying(256)
        END AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    a.accident_date AS loss_date,
    ''::character varying(256) AS loss_time,
    ''::character varying(256) AS report_date,
    ''::character varying(256) AS closed_date,
    ''::character varying(256) AS reopen_date,
        CASE
            WHEN a.litigation::text = 'Y'::text THEN 'Yes'::character varying(256)
            ELSE
            CASE
                WHEN a.litigation::text = 'N'::text THEN 'No'::character varying(256)
                ELSE ''::character varying(256)
            END
        END AS litigation,
        CASE
            WHEN a.hire_date::text = ANY (ARRAY[NULL::character varying::text, ''::character varying::text]) THEN ''::character varying(256)
            ELSE ((a.accident_date::date - a.hire_date::date))::character varying(256)
        END AS days_employed,
    ''::character varying(256) AS claimant_gender,
    ''::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    a.part_of_body AS carrier_body_part,
    a.accident_type AS carrier_cause,
    concat('STARR', ' - ', a.claim_class_locs)::character varying(256) AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat('STARR', ' - ', a.insured, ' - ', a.claim_class_locs, ' - ', a.policy_number, ' - ', a.policy_effective_dates)::character varying(256) AS carrier_policy_number,
    'raw_starr'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_starr a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_starr OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_starr to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_starr to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_starr to rpauser;
GO
GRANT SELECT ON p_and_c.normal_starr to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_starr to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_starr to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_starr to rl_p_and_c_d;
GO