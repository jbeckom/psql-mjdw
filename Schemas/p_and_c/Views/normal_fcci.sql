CREATE OR REPLACE VIEW p_and_c.normal_fcci
AS SELECT DISTINCT concat('FCCI', '-', split_part(a."Claim Number"::text, '-'::text, 1))::character varying(256) AS claim_number,
    split_part(a."Claim Number"::text, '-'::text, 1)::character varying(256) AS occurrence_number,
    split_part(a."Claim Number"::text, '-'::text, 2)::character varying(256) AS claimant_number,
    a."Paid Expenses" AS paid_expense,
    '0.00'::character varying(256) AS reserve_expense,
    a."Paid" AS paid_indemnity,
    '0.00'::character varying(256) AS paid_medical,
    ((replace(replace(replace(replace(a."Incurred"::text, ','::text, ''::text), '$'::text, ''::text), ')'::text, ''::text), '('::text, '-'::text)::numeric + replace(replace(replace(replace(a."Total Recoveries"::text, ','::text, ''::text), '$'::text, ''::text), ')'::text, ''::text), '('::text, '-'::text)::numeric - replace(replace(replace(replace(a."Paid"::text, ','::text, ''::text), '$'::text, ''::text), ')'::text, ''::text), '('::text, '-'::text)::numeric - replace(replace(replace(replace(a."Paid Expenses"::text, ','::text, ''::text), '$'::text, ''::text), ')'::text, ''::text), '('::text, '-'::text)::numeric))::character varying(256) AS reserve_indemnity,
    ''::character varying(256) AS reserve_medical,
    concat('-', a."Total Recoveries")::character varying(256) AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
        CASE
            WHEN (replace(replace(replace(replace(a."Incurred"::text, ','::text, ''::text), '$'::text, ''::text), ')'::text, ''::text), '('::text, '-'::text)::numeric + replace(replace(replace(replace(a."Total Recoveries"::text, ','::text, ''::text), '$'::text, ''::text), ')'::text, ''::text), '('::text, '-'::text)::numeric - replace(replace(replace(replace(a."Paid"::text, ','::text, ''::text), '$'::text, ''::text), ')'::text, ''::text), '('::text, '-'::text)::numeric - replace(replace(replace(replace(a."Paid Expenses"::text, ','::text, ''::text), '$'::text, ''::text), ')'::text, ''::text), '('::text, '-'::text)::numeric) < 3::numeric THEN 'Closed'::character varying(256)
            ELSE 'Open'::character varying(256)
        END AS claim_status,
    b.lossdesc AS description_text,
    b.address1::character varying(256) AS claim_address_1,
    b.address2::character varying(256) AS claim_address_2,
    b.city::character varying(256) AS claim_city,
    b.state::character varying(256) AS claim_state,
    b.zip5::character varying(256) AS claim_zip,
    ''::character varying(256) AS claim_site,
    b.ca_state::character varying(256) AS benefit_state,
    b.ca_state::character varying(256) AS garage_state,
    b.occup::character varying(256) AS occupation,
    b.classcd::character varying(256) AS class_code,
    a."Claimant Name" AS claimant_name,
        CASE
            WHEN a."Claimant Name"::text ~~ '% % %'::text THEN ''::character varying(256)
            ELSE split_part(a."Claimant Name"::text, ' '::text, 1)::character varying(256)
        END AS claimant_first,
    ''::character varying(256) AS claimant_middle,
        CASE
            WHEN a."Claimant Name"::text ~~ '% % %'::text THEN ''::character varying(256)
            ELSE split_part(a."Claimant Name"::text, ' '::text, 2)::character varying(256)
        END AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    ''::character varying(256) AS driver_last,
    a."Date of Accident" AS loss_date,
    b.acctime::character varying(256) AS loss_time,
    b.reptdate::character varying(256) AS report_date,
    b.closdate::character varying(256) AS closed_date,
    ''::character varying(256) AS reopen_date,
    ''::character varying(256) AS litigation,
        CASE
            WHEN b.dateofhire::text = ''::text THEN ''::character varying
            ELSE ((a."Date of Accident"::date - b.dateofhire::date))::character varying(256)
        END AS days_employed,
    ''::character varying(256) AS claimant_gender,
    ''::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    b.injbdprt::character varying(256) AS carrier_body_part,
    b.injcause::character varying(256) AS carrier_cause,
        CASE
            WHEN "left"(a."Policy"::text, 2) <> 'CP'::text THEN concat('FCCI', ' - ', "left"(a."Policy"::text, 2))::character varying(256)
            ELSE concat('FCCI', ' - ', "left"(a."Policy"::text, 2), ' - ', b.injcause)::character varying(256)
        END AS carrier_coverage_type,
    b.injnatr::character varying(256) AS carrier_nature,
    b.injtype::character varying(256) AS carrier_injury_code,
    concat('FCCI', ' - ', a."Policyholder Name", ' - ', a."Policy", ' - ',
        CASE
            WHEN b.polyefdt IS NULL THEN concat(date_part('year'::text, a."Date of Accident"::date), '/', date_part('month'::text, a."Date of Accident"::date))::character varying
            ELSE b.polyefdt
        END)::character varying(256) AS carrier_policy_number,
    'raw_fcci'::character varying(256) AS source_table,
    a.uploaded_at::character varying(256) AS uploaded_at
   FROM p_and_c.raw_fcci a
     LEFT JOIN p_and_c.raw_fcci_detail_201906 b ON a."Claim Number"::text = b.claimno::text
  WHERE a."Policyholder Name"::text !~~* '%THERMO%'::text AND a."Policyholder Name"::text !~~* '%MILLENIUM%'::text;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_fcci OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_fcci to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_fcci to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_fcci to rpauser;
GO
GRANT SELECT ON p_and_c.normal_fcci to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_fcci to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_fcci to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_fcci to rl_p_and_c_d;
GO