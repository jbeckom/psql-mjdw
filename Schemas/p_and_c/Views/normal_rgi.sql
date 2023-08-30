CREATE OR REPLACE VIEW p_and_c.normal_rgi
AS SELECT DISTINCT concat('RGI', '-', a.claimno_oneclaimno)::character varying(256) AS claim_number,
    a.claimno_oneclaimno AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    a.alloc_exp_paid AS paid_expense,
    ''::character varying(256) AS reserve_expense,
    a.ind_bi_paid AS paid_indemnity,
    a.med_pd_paid AS paid_medical,
    '0.00'::character varying(256) AS reserve_indemnity,
    '0.00'::character varying(256) AS reserve_medical,
    a.total_recoveries AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
    a.status AS claim_status,
    a.accident_loss_description AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    a.state_terr AS claim_state,
    ''::character varying(256) AS claim_zip,
    ''::character varying(256) AS claim_site,
    a.state_terr AS benefit_state,
    ''::character varying(256) AS garage_state,
    ''::character varying(256) AS occupation,
    ''::character varying(256) AS class_code,
    a.claimant_name,
        CASE
            WHEN a.claimant_name::text ~~* '% % %'::text THEN ''::character varying(256)
            WHEN a.claimant_name::text ~~* '%,%'::text THEN split_part(a.claimant_name::text, ' '::text, 2)::character varying(256)
            ELSE split_part(a.claimant_name::text, ' '::text, 1)::character varying(256)
        END AS claimant_first,
    ''::character varying(256) AS claimant_middle,
        CASE
            WHEN a.claimant_name::text ~~* '% % %'::text THEN ''::character varying(256)
            WHEN a.claimant_name::text ~~* '%,%'::text THEN split_part(a.claimant_name::text, ','::text, 1)::character varying(256)
            ELSE split_part(a.claimant_name::text, ' '::text, 2)::character varying(256)
        END AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    a.loss_date,
    ''::character varying(256) AS loss_time,
    a.report_date,
    a.closed_date,
    ''::character varying(256) AS reopen_date,
    ''::character varying(256) AS litigation,
    ''::character varying(256) AS days_employed,
    ''::character varying(256) AS claimant_gender,
    ''::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    ''::character varying(256) AS carrier_body_part,
    ''::character varying(256) AS carrier_cause,
        CASE
            WHEN a.ind_bi_paid::numeric > 0::numeric THEN 'RGI - GL - Bodily Injury'::character varying(256)
            WHEN a.med_pd_paid::numeric > 0::numeric THEN 'RGI - GL - Property Damage'::character varying(256)
            ELSE 'RGI - GL - Not Reported'::character varying(256)
        END AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat('RGI - ', a.insured, ' - ', a.policy, ' - ', "left"(a.policy_dates::text, 10))::character varying(256) AS carrier_policy_number,
    'raw_rgi'::character varying(256) AS source_table,
    a.uploaded_at
   FROM p_and_c.raw_rgi a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_rgi OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_rgi to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_rgi to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_rgi to rpauser;
GO
GRANT SELECT ON p_and_c.normal_rgi to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_rgi to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_rgi to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_rgi to rl_p_and_c_d;
GO