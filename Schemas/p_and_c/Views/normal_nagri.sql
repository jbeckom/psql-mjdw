CREATE OR REPLACE VIEW p_and_c.normal_nagri
AS SELECT DISTINCT concat('NAGRI', '-',
        CASE
            WHEN a.claim::text = '827086GH'::text THEN '796196GH'::character varying(256)
            ELSE a.claim
        END)::character varying(256) AS claim_number,
    a.claim AS occurrence_number,
    a.claimant AS claimant_number,
        CASE WHEN a.expense_paid IN ('', ' $-   ')
     		THEN '0'::character varying(256)
    		ELSE regexp_replace(a.expense_paid, '[-,$\s]', '', 'g')::character varying(256)
		END AS paid_expense,
		CASE WHEN a.expense_reserve IN ('', ' $-   ')
     		THEN '0'::character varying(256)
    		ELSE regexp_replace(a.expense_reserve, '[-,$\s]', '', 'g')::character varying(256)
		END AS reserve_expense,
        CASE WHEN a.indemnity_paid IN ('', ' $-   ')
     		THEN '0'::character varying(256)
    		ELSE regexp_replace(a.indemnity_paid , '[-,$\s]', '', 'g')::character varying(256)
		END AS paid_indemnity,
		CASE WHEN a.medical_paid IN ('', ' $-   ')
     		THEN '0'::character varying(256)
    		ELSE regexp_replace(a.medical_paid , '[-,$\s]', '', 'g')::character varying(256)
		END AS paid_medical,
        CASE WHEN a.indemnity_reserve IN ('', ' $-   ')
     		THEN '0'::character varying(256)
    		ELSE regexp_replace(a.indemnity_reserve , '[-,$\s]', '', 'g')::character varying(256)
		END AS reserve_indemnity,
        CASE WHEN a.medical_reserve IN ('', ' $-   ')
     		THEN '0'::character varying(256)
    		ELSE regexp_replace(a.medical_reserve, '[-,$\s]', '', 'g')::character varying(256)
		END AS reserve_medical,
        CASE WHEN a.subrogation IN ('', ' $-   ')
     		THEN '0'::character varying(256)
    		ELSE regexp_replace(a.subrogation , '[-,$\s]', '', 'g')::character varying(256)
		END AS subrogation,
		(
    		(
        		CASE
            		WHEN a.recovery IN ('', ' $-   ') THEN '0'::numeric
            			ELSE replace(regexp_replace(a.recovery, '[-,$\s)]', '', 'g'), '(', '-')::numeric(20, 2)
        		END
        +
        		CASE
            		WHEN a.salvage IN ('', ' $-   ') THEN '0'::numeric
            			ELSE replace(regexp_replace(a.salvage, '[-,$\s)]', '', 'g'), '(', '-')::numeric(20, 2)
        		END
    		)
		)::character varying(256) AS reimbursed,
        CASE
            WHEN a.claim_status::text ~~ '%C%'::character varying(256)::text THEN 'Closed'::character varying(256)
            ELSE
            CASE
                WHEN a.claim_status::text ~~ '%O%'::character varying(256)::text THEN 'Open'::character varying(256)
                ELSE ''::character varying(256)
            END
        END AS claim_status,
    a.claim_description AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    ''::character varying(256) AS claim_city,
    a.accident_state AS claim_state,
    ''::character varying(256) AS claim_zip,
    a.risk_code AS claim_site,
    a.jurisdiction_state AS benefit_state,
    a.insured_state AS garage_state,
    a.occupation,
    a.class_code,
    a.claimant_name,
        CASE
            WHEN a.claimant_name::text ~~ '% % %'::text THEN ''::text
            ELSE split_part(a.claimant_name::text, ' '::text, 1)
        END AS claimant_first,
    ''::character varying(256) AS claimant_middle,
        CASE
            WHEN a.claimant_name::text ~~ '% % %'::text THEN ''::text
            ELSE split_part(a.claimant_name::text, ' '::text, 2)
        END AS claimant_last,
    split_part(a.driver::text, ' '::text, 1) AS driver_first,
    ''::character varying(256) AS driver_middle,
    split_part(a.driver::text, ' '::text, 2) AS driver_last,
    a.accident_date AS loss_date,
        CASE
            WHEN length(a.time_of_loss::text) = 1 THEN concat('00:0', a.time_of_loss)::character varying
            ELSE
            CASE
                WHEN length(a.time_of_loss::text) = 2 THEN concat('00:', a.time_of_loss)::character varying
                ELSE
                CASE
                    WHEN length(a.time_of_loss::text) = 3 THEN concat('0', "left"(a.time_of_loss::text, 1), ':', "right"(a.time_of_loss::text, 2))::character varying
                    ELSE a.time_of_loss
                END
            END
        END::character varying(256) AS loss_time,
    a.report_date,
    a.closed_date,
    ''::character varying(256) AS reopen_date,
    ''::character varying(256) AS litigation,
        CASE
            WHEN a.accident_date::text = ''::text THEN ''::character varying
            ELSE
            CASE
                WHEN a.date_of_hire::text = ''::text THEN ''::character varying
                ELSE ((a.accident_date::date - a.date_of_hire::date))::character varying(256)
            END
        END::character varying(256) AS days_employed,
        CASE
            WHEN a.sex::text = 'M'::text THEN 'Male'::text
            ELSE
            CASE
                WHEN a.sex::text = 'F'::text THEN 'Female'::text
                ELSE ''::text
            END
        END::character varying(256) AS claimant_gender,
        CASE
            WHEN a.date_of_birth::text = ''::text THEN ''::character varying(256)
            ELSE
            CASE
                WHEN a.accident_date::text = ''::text THEN ''::character varying(256)
                ELSE
                CASE
                    WHEN date_part('year'::text, age(a.accident_date::date::timestamp with time zone, a.date_of_birth::date::timestamp with time zone)) < 0::double precision THEN ((99 + date_part('year'::text, age(a.accident_date::date::timestamp with time zone, a.date_of_birth::date::timestamp with time zone))::integer))::character varying(256)
                    ELSE date_part('year'::text, age(a.accident_date::date::timestamp with time zone, a.date_of_birth::date::timestamp with time zone))::character varying(256)
                END
            END
        END AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    a.body_part AS carrier_body_part,
        CASE
            WHEN a.line_of_business::text = 'Work Comp'::text THEN concat(a.cause_of_injury, ' - ', a.cause_group)::character varying(256)
            ELSE a.company_type_of_loss
        END AS carrier_cause,
    concat('NAGRI', ' - ', a.line_of_business, ' - ', a.type_of_loss)::character varying(256) AS carrier_coverage_type,
    a.nature_of_injury AS carrier_nature,
    a.type_of_injury AS carrier_injury_code,
    concat('NAGRI', ' - ', a.insured_name, ' - ', a.line_of_business, ' - ', a.effective_date::date, ' - ', a.policy)::character varying(256) AS carrier_policy_number,
    'raw_nagri'::character varying(256) AS source_table,
    a.uploaded_at
   FROM p_and_c.raw_nagri a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_nagri OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_nagri to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_nagri to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_nagri to rpauser;
GO
GRANT SELECT ON p_and_c.normal_nagri to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_nagri to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_nagri to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_nagri to rl_p_and_c_d;
GO