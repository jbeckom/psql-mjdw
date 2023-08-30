CREATE OR REPLACE VIEW p_and_c.normal_sompo_wc
AS SELECT DISTINCT concat('SOMPO_WC', '-', a.claim_number_tpa)::character varying(256) AS claim_number,
    a.claim_number_tpa AS occurrence_number,
    a.suffix AS claimant_number,
    a.exp_paid AS paid_expense,
    a.exp_reserve AS reserve_expense,
    a.ind_paid AS paid_indemnity,
    a.med_paid AS paid_medical,
    ((replace(a.ind_reserve::text, ','::text, ''::text)::numeric + replace(a.exp_reserve::text, ','::text, ''::text)::numeric))::character varying(256) AS reserve_indemnity,
    a.med_reserve AS reserve_medical,
    a.subro_recovery AS subrogation,
    ((replace(a.claim_recovery::text, ','::text, ''::text)::numeric + replace(a.salvage_recovery::text, ','::text, ''::text)::numeric + replace(a.deductible_reimbursement::text, ','::text, ''::text)::numeric))::character varying(256) AS reimbursed,
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
    split_part(a.claimant_name::text, ' '::text, 1)::character varying(256) AS claimant_first,
    ''::character varying(256) AS claimant_middle,
    concat(split_part(a.claimant_name::text, ' '::text, 2), ' ', split_part(a.claimant_name::text, ' '::text, 3), ' ', split_part(a.claimant_name::text, ' '::text, 4))::character varying(256) AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
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
    a.body_part_and_damage AS carrier_body_part,
    a.cause_of_injury_and_situation AS carrier_cause,
    concat('SOMPO_WC', ' - ', a.business_unit)::character varying(256) AS carrier_coverage_type,
    a.nature_of_injury AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat('SOMPO_WC', ' - ', a.named_insured, ' - ', a.effective_year, ' - ', a.policy)::character varying(256) AS carrier_policy_number,
    'raw_sompo_wc'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_sompo_wc a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_sompo_wc OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_sompo_wc to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_sompo_wc to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_sompo_wc to rpauser;
GO
GRANT SELECT ON p_and_c.normal_sompo_wc to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_sompo_wc to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_sompo_wc to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_sompo_wc to rl_p_and_c_d;
GO