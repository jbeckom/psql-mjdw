CREATE OR REPLACE VIEW p_and_c.normal_1000001
AS SELECT DISTINCT concat('1000001', '-', a."Claim Number")::character varying(256) AS claim_number,
    a."Occurrence Number" AS occurrence_number,
    split_part(a."Claim Number"::text, '-'::text, 2)::character varying(256) AS claimant_number,
    ((a."Legal PTD"::numeric(18,2) + a."Non-Legal PTD"::numeric(18,2)))::character varying(256) AS paid_expense,
    ((a."Legal Outsd"::numeric(18,2) + a."Non-Legal Outsd"::numeric(18,2)))::character varying(256) AS reserve_expense,
    a."Ind/PD PTD" AS paid_indemnity,
    a."Med/BI PTD" AS paid_medical,
    a."Ind/PD Outsd" AS reserve_indemnity,
    a."Med/BI Outsd" AS reserve_medical,
    a."Total Recov" AS subrogation,
    '0.00'::character varying(256) AS reimbursed,
        CASE
            WHEN a."Claim Status Description"::text = 'Reopened'::character varying(256)::text THEN 'Reopen'::character varying(256)
            ELSE
            CASE
                WHEN a."Claim Status Description"::text = 'Cancelled'::text THEN 'Closed'::character varying(256)
                ELSE a."Claim Status Description"
            END
        END AS claim_status,
    a."Cause Description"::text AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    a."Loss State" AS claim_state,
    ''::character varying(256) AS claim_zip,
    a."Location Code" AS claim_site,
    a."Benefit State" AS benefit_state,
    a."Garage State" AS garage_state,
    a."Occupation" AS occupation,
    a."NCCI Class Code" AS class_code,
    a."Claimant Name" AS claimant_name,
    initcap(split_part(split_part(a."Claimant Name"::text, ', '::text, 2), ' '::text, 1))::character varying(256) AS claimant_first,
    initcap(split_part(split_part(a."Claimant Name"::text, ', '::text, 2), ' '::text, 2))::character varying(256) AS claimant_middle,
    initcap(split_part(a."Claimant Name"::text, ', '::text, 1))::character varying(256) AS claimant_last,
    ''::character varying(256) AS driver_first,
    ''::character varying(256) AS driver_middle,
    initcap(a."Insured Driver Last Name"::text)::character varying(256) AS driver_last,
    a."Loss Date" AS loss_date,
    ''::character varying(256) AS loss_time,
    btrim(a."Reported Date"::text)::character varying(256) AS report_date,
        CASE
            WHEN a."Claim Status Code"::text = 'R'::character varying(256)::text THEN ''::character varying(256)
            ELSE btrim(a."Closed/Reopened Date"::text)::character varying(256)
        END AS closed_date,
        CASE
            WHEN a."Claim Status Code"::text = 'R'::character varying(256)::text THEN btrim(a."Closed/Reopened Date"::text)::character varying(256)
            ELSE ''::character varying(256)
        END AS reopen_date,
        CASE
            WHEN a."Litigation Ind"::text = 'Y'::character varying(256)::text THEN 'Yes'::character varying(256)
            ELSE 'No'::character varying(256)
        END AS litigation,
        CASE
            WHEN b."Claimant Hire Date"::text = ''::text THEN ''::character varying(256)
            ELSE ((a."Loss Date"::date - b."Claimant Hire Date"::date))::character varying(256)
        END AS days_employed,
        CASE
            WHEN a."Clmt Sex"::text = 'M'::character varying(256)::text THEN 'Male'::character varying(256)
            ELSE
            CASE
                WHEN a."Clmt Sex"::text = 'F'::character varying(256)::text THEN 'Female'::character varying(256)
                ELSE ''::character varying(256)
            END
        END AS claimant_gender,
    a."Clmt Age" AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    a."Body Part" AS carrier_body_part,
    a."Cause Description" AS carrier_cause,
    concat('1000001', ' - ', a."Minor Cov Description")::character varying(256) AS carrier_coverage_type,
    a."Injury Desc" AS carrier_nature,
    a."NCCI Inj Code" AS carrier_injury_code,
    concat('1000001', ' - ', a."Level 7 Code", ' - ', split_part(a."Minor Cov Description"::text, '-'::character varying(256)::text, 1), ' - ', split_part(a."Experience Period"::text, '-'::character varying(256)::text, 1), ' - ', a."Policy Number")::character varying(256) AS carrier_policy_number,
    'raw_1000001'::character varying(256) AS source_table,
    a.uploaded_at
   FROM ( SELECT a_1."Program No",
            a_1."Program Name",
            a_1."Branch No",
            a_1."Claim Office",
            a_1."Occurrence Number",
            a_1."Claim Number",
            a_1."Insurer Name",
            a_1."S/I",
            a_1."Insurer Code",
            a_1."Loss State",
            a_1."Benefit State",
            a_1."Garage State",
            a_1."Premium State",
            a_1."Claimant Name",
            a_1."Occupation",
            a_1."Loss Date",
            a_1."Reported Date",
            a_1."Claim Status Code",
            a_1."Claim Status Description",
            a_1."Closed/Reopened Date",
            a_1."Privacy Claim",
            a_1."Litigation Ind",
            a_1."LOB Code",
            a_1."Minor Cov Cd",
            a_1."Minor Cov Description",
            a_1."Ind/PD PTD",
            a_1."Ind/PD Outsd",
            a_1."Ind/PD Inc",
            a_1."Med/BI PTD",
            a_1."Med/BI Outsd",
            a_1."Med/BI Inc",
            a_1."Legal PTD",
            a_1."Legal Outsd",
            a_1."Legal Inc",
            a_1."Non-Legal PTD",
            a_1."Non-Legal Outsd",
            a_1."Non-Legal Inc",
            a_1."Total PTD",
            a_1."Total Outsd",
            a_1."Total Inc (Gross)",
            a_1."Ind/PD Recov",
            a_1."Med/BI Recov",
            a_1."Legal Recov",
            a_1."Non-Legal Recov",
            a_1."Legacy Recov",
            a_1."Total Recov",
            a_1."Cause Description",
            a_1."Injury Desc",
            a_1."Body Part",
            a_1."Controverted",
            a_1."Denial Date",
            a_1."Recision Date",
            a_1."Level 2 Code",
            a_1."Level 2 Name",
            a_1."Level 3 Code",
            a_1."Level 3 Name",
            a_1."Level 4 Code",
            a_1."Level 4 Name",
            a_1."Level 5 Code",
            a_1."Level 5 Name",
            a_1."Level 6 Code",
            a_1."Level 6 Name",
            a_1."Level 7 Code",
            a_1."Level 7 Name",
            a_1."Location Code",
            a_1."Location Description",
            a_1."NCCI Class Code",
            a_1."NCCI Inj Code",
            a_1."NCCI Inj Desc",
            a_1."Experience Period",
            a_1."Adjuster",
            a_1."Client Clm No",
            a_1."Fed/State Clm No",
            a_1."Policy Number",
            a_1."Juris Days Lost",
            a_1."Clmt Age",
            a_1."Clmt Sex",
            a_1."Clmt Empl No",
            a_1."Clmt Job Code",
            a_1."Avg Wkly Wage",
            a_1."Insured Driver Last Name",
            a_1."Client Program Status",
            a_1."CP Term Date",
            a_1."Claims Made Date",
            a_1."Geo Region Code",
            a_1."Cat Code",
            a_1."MCO Number",
            a_1."Insurer Cat Cd",
            a_1.filename,
            a_1.uploaded_at
           FROM p_and_c.raw_1000001 a_1) a
     LEFT JOIN ( SELECT raw_1000001_supp."Loc Descrip Lvl3",
            raw_1000001_supp."Claim Number",
            raw_1000001_supp."Claimant",
            raw_1000001_supp."Carrier",
            raw_1000001_supp."Accident Date",
            raw_1000001_supp."Report Date",
            raw_1000001_supp."Close Date",
            raw_1000001_supp."Activity Date",
            raw_1000001_supp."Coverage",
            raw_1000001_supp."State Cd",
            raw_1000001_supp."Status",
            raw_1000001_supp."Litigation",
            raw_1000001_supp."Location",
            raw_1000001_supp."Cause/Hazard",
            raw_1000001_supp."Nature",
            raw_1000001_supp."Part",
            raw_1000001_supp."Policy Number",
            raw_1000001_supp."Claimant Hire Date",
            raw_1000001_supp."Cov Loss Type Desc",
            raw_1000001_supp."Adjuster Name",
            raw_1000001_supp."Description",
            raw_1000001_supp."Ind/Pd/Cmpr Paid",
            raw_1000001_supp."Ind/Pd/Cmpr Outstanding",
            raw_1000001_supp."Ind/Pd/Cmpr Incurred",
            raw_1000001_supp."Med/Bi/Coll Paid",
            raw_1000001_supp."Med/Bi/Coll Outstanding",
            raw_1000001_supp."Med/Bi/Coll Incurred",
            raw_1000001_supp."Expense Paid",
            raw_1000001_supp."Expense Outstanding",
            raw_1000001_supp."Expense Incurred",
            raw_1000001_supp."Recovery Paid",
            raw_1000001_supp."Recovery Outstanding",
            raw_1000001_supp."Recovery Incurred",
            raw_1000001_supp."Paid",
            raw_1000001_supp."Outstanding",
            raw_1000001_supp."Incurred",
            raw_1000001_supp.filename,
            raw_1000001_supp.uploaded_at
           FROM p_and_c.raw_1000001_supp
             LEFT JOIN p_and_c.raw_1000001_supp b_1 ON raw_1000001_supp."Claim Number"::text = b_1."Claim Number"::text AND raw_1000001_supp.uploaded_at::date < b_1.uploaded_at::date
          WHERE raw_1000001_supp."Claimant Hire Date"::text <> ''::text) b ON a."Claim Number"::text = split_part(b."Claim Number"::text, ' '::text, 2);
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_1000001 OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_1000001 to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_1000001 to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_1000001 to rpauser;
GO
GRANT SELECT ON p_and_c.normal_1000001 to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_1000001 to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_1000001 to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_1000001 to rl_p_and_c_d;
GO