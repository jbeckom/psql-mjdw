CREATE OR REPLACE VIEW p_and_c.normal_samic_az
AS SELECT DISTINCT concat('SAMIC', '-', a."Claim_Number")::character varying(256) AS claim_number,
    a."Claim_Number" AS occurrence_number,
    ''::character varying(256) AS claimant_number,
    a."Paid_Expenses" AS paid_expense,
    ''::character varying(256) AS reserve_expense,
    a."Paid_Losses" AS paid_indemnity,
    '0.00'::character varying(256) AS paid_medical,
    a."Reserved_Losses" AS reserve_indemnity,
    '0.00'::character varying(256) AS reserve_medical,
    '0.00'::character varying(256) AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
    a."Claim_Status" AS claim_status,
    a."Loss_Description" AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    ''::character varying(256) AS claim_state,
    ''::character varying(256) AS claim_zip,
    ''::character varying(256) AS claim_site,
    ''::character varying(256) AS benefit_state,
    ''::character varying(256) AS garage_state,
    ''::character varying(256) AS occupation,
    ''::character varying(256) AS class_code,
    ''::character varying(256) AS claimant_name,
    ''::character varying(256) AS claimant_first,
    ''::character varying(256) AS claimant_middle,
    ''::character varying(256) AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    a."Date_Of_Loss" AS loss_date,
    ''::character varying(256) AS loss_time,
    ''::character varying(256) AS report_date,
    a."Date_Closed" AS closed_date,
    ''::character varying(256) AS reopen_date,
    ''::character varying(256) AS litigation,
    ''::character varying(256) AS days_employed,
    ''::character varying(256) AS claimant_gender,
    ''::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    ''::character varying(256) AS carrier_body_part,
    ''::character varying(256) AS carrier_cause,
    concat('SAMIC', ' - ', a."Coverage_Line")::character varying(256) AS carrier_coverage_type,
    ''::character varying(256) AS carrier_nature,
    ''::character varying(256) AS carrier_injury_code,
    concat('SAMIC', ' - ', a."Policy_Number", ' - ', a."Coverage_Line", ' - ', a.filename)::character varying(256) AS carrier_policy_number,
    'raw_samic_az'::character varying(256) AS source_table,
    a.uploaded_at
   FROM p_and_c.raw_samic_az a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_samic_az OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_samic_az to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_samic_az to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_samic_az to rpauser;
GO
GRANT SELECT ON p_and_c.normal_samic_az to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_samic_az to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_samic_az to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_samic_az to rl_p_and_c_d;
GO