CREATE OR REPLACE VIEW p_and_c.normal_aig
AS SELECT DISTINCT concat('AIG', '-', a.claim_number)::character varying(256) AS claim_number,
    a.claim_number AS occurrence_number,
    split_part(a.claim_number::text, '-'::text, 3)::character varying(256) AS claimant_number,
    a.alloc_exp_paid AS paid_expense,
    '0.00'::character varying(256) AS reserve_expense,
    a.ind_bi_paid AS paid_indemnity,
    a.med_pd_paid AS paid_medical,
    a.total_reserves AS reserve_indemnity,
    '0.00'::character varying(256) AS reserve_medical,
    a.total_recoveries AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
        CASE
            WHEN a.status::text = 'N/O'::text THEN 'Closed'::character varying(256)
            ELSE a.status
        END AS claim_status,
    a.accident_loss_description AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    "left"(split_part(a.st_terr_ctry::text, ': '::text, 2), 2)::character varying(256) AS claim_state,
    ''::character varying(256) AS claim_zip,
    ''::character varying(256) AS claim_site,
    "left"(split_part(a.st_terr_ctry::text, ': '::text, 2), 2)::character varying(256) AS benefit_state,
    "left"(split_part(a.st_terr_ctry::text, ': '::text, 2), 2)::character varying(256) AS garage_state,
    ''::character varying(256) AS occupation,
    ''::character varying(256) AS class_code,
    a.claimant_name,
    split_part(a.claimant_name::text, ' '::text, 1)::character varying(256) AS claimant_first,
        CASE
            WHEN a.claimant_name::text ~~ '% % %'::text THEN split_part(a.claimant_name::text, ' '::text, 2)::character varying(256)
            ELSE ''::character varying(256)
        END AS claimant_middle,
        CASE
            WHEN a.claimant_name::text ~~ '% % %'::text THEN split_part(a.claimant_name::text, ' '::text, 3)::character varying(256)
            ELSE split_part(a.claimant_name::text, ' '::text, 2)::character varying(256)
        END AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    a.loss_date,
    ''::character varying(256) AS loss_time,
    a.receipt_date AS report_date,
    a.closed_date,
    ''::character varying(256) AS reopen_date,
    ''::character varying(256) AS litigation,
    ''::character varying(256) AS days_employed,
    ''::character varying(256) AS claimant_gender,
    ''::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    ''::character varying(256) AS carrier_body_part,
    concat('AIG', ' - ', a.accident_loss_description)::character varying(256) AS carrier_cause,
    concat('AIG', ' - ', a.loss_type, ' - ', a.major_class_code)::character varying(256) AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat('AIG', ' - ', a.insured, ' - ', a.loss_type, ' - ', a.policy, ' - ', a.policy_start_date, ' - ', a.policy_end_date)::character varying(256) AS carrier_policy_number,
    'raw_aig'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_aig a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_aig OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_aig to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_aig to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_aig to rpauser;
GO
GRANT SELECT ON p_and_c.normal_aig to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_aig to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_aig to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_aig to rl_p_and_c_d;
GO