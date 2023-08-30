CREATE OR REPLACE VIEW p_and_c.normal_sompo_cau
AS SELECT DISTINCT concat('SOMPO_CAU', '-', a."claim_#_wins")::character varying(256) AS claim_number,
    a."claim_#_wins" AS occurrence_number,
    a.suffix AS claimant_number,
    a.expense_paid AS paid_expense,
    a.expense_reserve AS reserve_expense,
    a.indemnity_paid AS paid_indemnity,
    a.medical_paid AS paid_medical,
    ((replace(a.indemnity_reserve,',','')::numeric + replace(a.expense_reserve,',','')::numeric))::character varying(256) AS reserve_indemnity,
    a.medical_reserve AS reserve_medical,
    (('-1'::integer::numeric * replace(replace(replace(a.subro_recovery,',',''),'(',''),')','')::numeric))::character varying(256) AS subrogation,
    (('-1'::integer::numeric * replace(replace(replace(a.claim_recovery,',',''),'(',''),')','')::numeric + '-1'::integer::numeric * replace(replace(replace(a.salvage_recovery,',',''),'(',''),')','')::numeric))::character varying(256) AS reimbursed,
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
    split_part(a.driver_name::text, ' '::text, 1) AS driver_first,
    ''::character varying(256) AS driver_middle,
    split_part(a.driver_name::text, ' '::text, 2) AS driver_last,
    a.accident_date AS loss_date,
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
    a.accident_description::character varying(256) AS carrier_cause,
    concat('SOMPO_CAU', ' - ', a.coverage_name)::character varying(256) AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat('SOMPO_CAU', ' - ', a.named_insured, ' - ', a.policy_effective_year, ' - ', a.policy)::character varying(256) AS carrier_policy_number,
    'raw_sompo_cau'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_sompo_cau a
  WHERE a."claim_#_wins"::text <> 'NOCLAIMS'::text;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_sompo_cau OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_sompo_cau to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_sompo_cau to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_sompo_cau to rpauser;
GO
GRANT SELECT ON p_and_c.normal_sompo_cau to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_sompo_cau to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_sompo_cau to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_sompo_cau to rl_p_and_c_d;
GO