CREATE OR REPLACE VIEW p_and_c.normal_aig_intelli
AS 
SELECT DISTINCT concat('AIG', '-', a."Claim #")::character varying(256) AS claim_number,
    a."Claim #" AS occurrence_number,
    split_part(a."Claim #"::text, '-'::text, 3)::character varying(256) AS claimant_number,
    a."Alloc Exp Paid" AS expense_paid,
    '0.00'::character varying(256) AS expense_reserve,
    a."Ind/BI Paid" AS paid_indemnity,
    a."Med/PD Paid" AS paid_medical,
    a."Total Reserves" AS reserve_indemnity,
    '0.00'::character varying(256) AS reserve_medical,
    a."Subrogation" AS subrogation,
    a."Other Recoveries" AS reimbursed,
    a."Status" AS claim_status,
    a."Accident/Loss Description" AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    a."State/Terr/Country" AS claim_state,
    ''::character varying(256) AS claim_zip,
    ''::character varying(256) AS claim_site,
    a."Benefit State" AS benefit_state,
    ''::character varying(256) AS garage_state,
    ''::character varying(256) AS occupation,
    ''::character varying(256) AS class_code,
    a."Claimant Name" AS claimant_name,
    split_part(a."Claimant Name"::text, ' '::text, 2) AS claimant_first,
    ''::character varying(256) AS claimant_middle,
    split_part(a."Claimant Name"::text, ' '::text, 1) AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    a."Loss Date" AS loss_date,
    ''::character varying(256) AS loss_time,
    a."Receipt Date" AS report_date,
    a."Closed Date" AS closed_date,
    ''::character varying(256) AS reopen_date,
    ''::character varying(256) AS litigation,
    ''::character varying(256) AS days_employed,
    ''::character varying(256) AS claimant_gender,
    ''::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    ''::character varying(256) AS carrier_body_part,
    ''::character varying(256) AS carrier_cause,
    concat('AIG', ' - ', a."LOB", ' - ', a."Major Class Code Description")::character varying(256) AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat('AIG', ' - ', a."Policy-Asco-Mod", ' - ', a."Policy Term", ' - ', a."LOB")::character varying(256) AS carrier_policy_number,
    'raw_aig_intelli'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_aig_intelli a
   where a."Claim #" is not null and a."Claim #" != '';
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_aig_intelli OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_aig_intelli to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_aig_intelli to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_aig_intelli to rpauser;
GO
GRANT SELECT ON p_and_c.normal_aig_intelli to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_aig_intelli to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_aig_intelli to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_aig_intelli to rl_p_and_c_d;
GO