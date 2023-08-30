CREATE OR REPLACE VIEW p_and_c.normal_sencc_cau
AS SELECT DISTINCT concat('SENCC_CAU', '-', a."Claim_#")::character varying(256) AS claim_number,
    a."Claim_#" AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    a."Paid_Expense" AS paid_expense,
    ''::character varying(256) AS reserve_expense,
    a."Paid_Loss" AS paid_indemnity,
    ''::character varying(256) AS paid_medical,
    a."Reserve" AS reserve_indemnity,
    ''::character varying(256) AS reserve_medical,
    '0.00'::character varying(256) AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
    a."Claim_Status" AS claim_status,
    a."Description" AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    a."Location_City" AS claim_city,
    a."Location_State" AS claim_state,
    ''::character varying(256) AS claim_zip,
    a."Loc_Name" AS claim_site,
    a."Location_State" AS benefit_state,
    ''::character varying(256) AS garage_state,
    ''::character varying(256) AS occupation,
    ''::character varying(256) AS class_code,
    a."Driver_Name" AS claimant_name,
    split_part(a."Driver_Name"::text, ' '::text, 2)::character varying(256) AS claimant_first,
    ''::character varying(256) AS claimant_middle,
    split_part(a."Driver_Name"::text, ','::text, 1)::character varying(256) AS claimant_last,
    split_part(a."Driver_Name"::text, ' '::text, 2)::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    split_part(a."Driver_Name"::text, ','::text, 1)::character varying(256) AS driver_last,
    a."Loss_Date" AS loss_date,
    ''::character varying(256) AS loss_time,
    a."Date_Reported_to_Sentry" AS report_date,
    a."Close_Date" AS closed_date,
    a."Reopen_Date" AS reopen_date,
    ''::character varying(256) AS litigation,
    ''::character varying(256) AS days_employed,
    ''::character varying(256) AS claimant_gender,
    ''::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    ''::character varying(256) AS carrier_body_part,
    a."Description"::character varying(256) AS carrier_cause,
    concat('SENCC_CAU', ' - ', 'Auto', ' - ', a."Claim_Type")::character varying(256) AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat('SENCC_CAU', ' - ', 'Account ', a."Account_#", ' - ', 'Auto', ' - ', a."Policy_Effective_Date")::character varying(256) AS carrier_policy_number,
    'raw_sencc_cau'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_sencc_cau a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_sencc_cau OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_sencc_cau to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_sencc_cau to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_sencc_cau to rpauser;
GO
GRANT SELECT ON p_and_c.normal_sencc_cau to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_sencc_cau to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_sencc_cau to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_sencc_cau to rl_p_and_c_d;
GO