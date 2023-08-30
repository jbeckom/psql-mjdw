CREATE OR REPLACE VIEW p_and_c.normal_asc
AS SELECT DISTINCT concat('ASC', '-', a."Claim #")::character varying(256) AS claim_number,
    a."Claim #" AS occurrence_number,
    a."Claim Count" AS claimant_number,
        CASE
            WHEN a."Expense Paid Amount"::text = 'N/A'::text THEN '0.00'::character varying(256)
            ELSE a."Expense Paid Amount"
        END AS paid_expense,
    '0.00'::character varying(256) AS reserve_expense,
        CASE
            WHEN a."Policy Line"::text <> 'WC'::text THEN a."Loss Payment Amount"
            ELSE
            CASE
                WHEN a."Loss Payment Indemnity Amount"::text = 'N/A'::text THEN '0.00'::character varying(256)
                ELSE a."Loss Payment Indemnity Amount"
            END
        END AS paid_indemnity,
        CASE
            WHEN a."Policy Line"::text <> 'WC'::text THEN '0.00'::character varying(256)
            ELSE
            CASE
                WHEN a."Loss Payment Medical Amount"::text = 'N/A'::text THEN '0.00'::character varying(256)
                ELSE a."Loss Payment Medical Amount"
            END
        END AS paid_medical,
        CASE
            WHEN a."Policy Line"::text <> 'WC'::text THEN a."Loss Reserve Amount"
            ELSE
            CASE
                WHEN a."Loss Reserve Indemnity Amount"::text = 'N/A'::text THEN '0.00'::character varying(256)
                ELSE a."Loss Reserve Indemnity Amount"
            END
        END AS reserve_indemnity,
        CASE
            WHEN a."Policy Line"::text <> 'WC'::text THEN '0.00'::character varying(256)
            ELSE
            CASE
                WHEN a."Loss Reserve Medical Amount"::text = 'N/A'::text THEN '0.00'::character varying(256)
                ELSE a."Loss Reserve Medical Amount"
            END
        END AS reserve_medical,
        CASE
            WHEN a."Subrogation Amount"::text = 'N/A'::text THEN 0::numeric
            ELSE
            CASE
                WHEN a."Subrogation Amount"::text = ''::text THEN 0::numeric
                ELSE replace(replace(a."Subrogation Amount"::text, ','::text, ''::text), '$'::text, ''::text)::numeric(18,2)
            END
        END::character varying(256) AS subrogation,
    ((
        CASE
            WHEN a."Loss Recovery Amount"::text = 'N/A'::text THEN 0::numeric
            ELSE
            CASE
                WHEN a."Loss Recovery Amount"::text = ''::text THEN 0::numeric
                ELSE replace(replace(a."Loss Recovery Amount"::text, ','::text, ''::text), '$'::text, ''::text)::numeric(18,2)
            END
        END +
        CASE
            WHEN a."Expense Recovery Amount"::text = 'N/A'::text THEN 0::numeric
            ELSE
            CASE
                WHEN a."Expense Recovery Amount"::text = ''::text THEN 0::numeric
                ELSE replace(replace(a."Expense Recovery Amount"::text, ','::text, ''::text), '$'::text, ''::text)::numeric(18,2)
            END
        END))::character varying(256) AS reimbursed,
    a."Claim Status" AS claim_status,
    a."Accident Description" AS description_text,
    a."Location Address 1" AS claim_address_1,
    a."Location Address 2" AS claim_address_2,
    a."Location City" AS claim_city,
        CASE
            WHEN a."Location State"::text = 'N/A'::text THEN a."Accident State Code"
            ELSE a."Location State"
        END AS claim_state,
    a."Location Zip Code" AS claim_zip,
    a."Location No" AS claim_site,
    a."Benefit State Code" AS benefit_state,
        CASE
            WHEN a."Garaging Location State"::text = 'N/A'::text THEN a."Accident State Code"
            ELSE a."Garaging Location State"
        END AS garage_state,
    a."Occupation" AS occupation,
    a."Class Code" AS class_code,
    a."Claimant Name" AS claimant_name,
        CASE
            WHEN a."Claimant Name"::text ~~ '% % % %'::text OR a."Claimant Name"::text ~~ '%.%'::text THEN ''::character varying(256)
            ELSE split_part(a."Claimant Name"::text, ' '::text, 2)::character varying(256)
        END AS claimant_first,
        CASE
            WHEN a."Claimant Name"::text ~~ '% _'::text THEN "right"(a."Claimant Name"::text, 1)::character varying(256)
            ELSE ''::character varying(256)
        END AS claimant_middle,
    split_part(a."Claimant Name"::text, ', '::text, 1)::character varying(256) AS claimant_last,
        CASE
            WHEN a."Driver"::text = 'N/A'::text THEN ''::character varying(256)::text
            ELSE split_part(a."Driver"::text, ', '::text, 2)
        END AS driver_first,
    ''::character varying(256) AS driver_middle,
        CASE
            WHEN a."Driver"::text = 'N/A'::text THEN ''::character varying(256)::text
            ELSE split_part(a."Driver"::text, ', '::text, 1)
        END AS driver_last,
        CASE
            WHEN a."Date of Loss"::text = 'N/A'::text THEN NULL::character varying
            ELSE a."Date of Loss"
        END::character varying(256) AS loss_date,
    a."Time of Loss" AS loss_time,
        CASE
            WHEN a."Claim Received Date"::text = 'N/A'::text THEN NULL::character varying
            ELSE a."Claim Received Date"
        END::character varying(256) AS report_date,
        CASE
            WHEN a."Claim Close Date"::text = 'N/A'::text THEN NULL::character varying
            ELSE a."Claim Close Date"
        END::character varying(256) AS closed_date,
        CASE
            WHEN a."Re-open Date"::text = 'N/A'::text THEN NULL::character varying
            ELSE a."Re-open Date"
        END::character varying(256) AS reopen_date,
        CASE
            WHEN a."Litigation"::text = 'In litigation'::text THEN 'Yes'::character varying(256)
            ELSE 'No'::character varying(256)
        END AS litigation,
        CASE
            WHEN a."Date of Hire"::text = ''::text OR a."Date of Hire"::text = 'N/A'::text OR a."Date of Hire"::text = 'AC-Composite Uninsured Motorists'::text THEN ''::character varying(256)
            ELSE
            CASE
                WHEN (a."Date of Loss"::date - a."Date of Hire"::date) > 25000 THEN ''::character varying(256)
                ELSE ((a."Date of Loss"::date - a."Date of Hire"::date))::character varying(256)
            END
        END AS days_employed,
        CASE
            WHEN a."Claimant Gender"::text = 'Male'::text THEN 'Male'::character varying(256)
            ELSE
            CASE
                WHEN a."Claimant Gender"::text = 'Female'::text THEN 'Female'::character varying(256)
                ELSE ''::character varying(256)
            END
        END AS claimant_gender,
        CASE
            WHEN a."Policy Line"::text = 'CA'::text THEN NULL::integer
            ELSE
            CASE
                WHEN a."Claimant Age Range"::text = '<= 20'::text THEN 19
                ELSE
                CASE
                    WHEN a."Claimant Age Range"::text = '21 - 30'::text THEN 25
                    ELSE
                    CASE
                        WHEN a."Claimant Age Range"::text = '31 - 40'::text THEN 35
                        ELSE
                        CASE
                            WHEN a."Claimant Age Range"::text = '41 - 50'::text THEN 45
                            ELSE
                            CASE
                                WHEN a."Claimant Age Range"::text = '51 - 60'::text THEN 55
                                ELSE
                                CASE
                                    WHEN a."Claimant Age Range"::text = '61 - 70'::text THEN 65
                                    ELSE
                                    CASE
WHEN a."Claimant Age Range"::text = '> 70'::text THEN 75
ELSE NULL::integer
                                    END
                                END
                            END
                        END
                    END
                END
            END
        END::character varying(256) AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    a."Body Part" AS carrier_body_part,
        CASE
            WHEN a."Coverage Major Group"::text = 'Commercial Auto'::text THEN concat('Auto - ', a."Accident Description")::character varying(256)
            ELSE a."Injury Cause"
        END AS carrier_cause,
        CASE
            WHEN a."Auto Coverage Type"::text = ANY (ARRAY['N/A'::character varying::text, 'Not Applicable'::character varying::text]) THEN concat('ASC', ' - ', a."Coverage Major Group", ' - ', a."Exposure")::character varying(256)
            ELSE concat('ASC', ' - ', a."Auto Coverage Type", ' - ', a."Cause of Loss")::character varying(256)
        END AS carrier_coverage_type,
    a."Injury Type" AS carrier_nature,
    a."WC Claim Type" AS carrier_injury_code,
    concat('ASC', ' - ', a."Account Holder", ' - ', a."Coverage Major Group", ' - ', a."Policy Effective Date"::date, ' - ', a."Policy")::character varying(256) AS carrier_policy_number,
    'raw_asc'::character varying(256) AS source_table,
    a.uploaded_at
   FROM p_and_c.raw_asc a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_asc OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_asc to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_asc to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_asc to rpauser;
GO
GRANT SELECT ON p_and_c.normal_asc to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_asc to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_asc to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_asc to rl_p_and_c_d;
GO