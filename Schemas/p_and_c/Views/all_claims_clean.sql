CREATE OR REPLACE VIEW p_and_c.all_claims_clean
AS SELECT a.claim_number,
    a.occurrence_number,
    a.claimant_number,
        CASE
            WHEN a.paid_expense::text = ''::text THEN 0.00::numeric(20,2)
            ELSE replace(replace(replace(replace(a.paid_expense::text, ','::text, ''::text), '$'::text, ''::text), ')'::text, ''::text), '('::text, '-'::text)::numeric(20,2)
        END AS paid_expense,
        CASE
            WHEN a.reserve_expense::text = ''::text THEN 0.00::numeric(20,2)
            ELSE replace(replace(replace(replace(a.reserve_expense::text, ','::text, ''::text), '$'::text, ''::text), ')'::text, ''::text), '('::text, '-'::text)::numeric(20,2)
        END AS reserve_expense,
        CASE
            WHEN a.paid_indemnity::text = ''::text THEN 0.00::numeric(20,2)
            ELSE replace(replace(replace(replace(a.paid_indemnity::text, ','::text, ''::text), '$'::text, ''::text), ')'::text, ''::text), '('::text, '-'::text)::numeric(20,2)
        END AS paid_indemnity,
        CASE
            WHEN a.paid_medical::text = ''::text THEN 0.00::numeric(20,2)
            ELSE replace(replace(replace(replace(a.paid_medical::text, ','::text, ''::text), '$'::text, ''::text), ')'::text, ''::text), '('::text, '-'::text)::numeric(20,2)
        END AS paid_medical,
        CASE
            WHEN a.reserve_indemnity::text = ''::text THEN 0.00::numeric(20,2)
            ELSE replace(replace(replace(replace(a.reserve_indemnity::text, ','::text, ''::text), '$'::text, ''::text), ')'::text, ''::text), '('::text, '-'::text)::numeric(20,2)
        END AS reserve_indemnity,
        CASE
            WHEN a.reserve_medical::text = ''::text THEN 0.00::numeric(20,2)
            ELSE replace(replace(replace(replace(a.reserve_medical::text, ','::text, ''::text), '$'::text, ''::text), ')'::text, ''::text), '('::text, '-'::text)::numeric(20,2)
        END AS reserve_medical,
        CASE
            WHEN a.subrogation::text = ''::text THEN 0.00::numeric(20,2)
            ELSE replace(replace(replace(replace(a.subrogation::text, ','::text, ''::text), '$'::text, ''::text), ')'::text, ''::text), '('::text, '-'::text)::numeric(20,2)
        END AS subrogation,
        CASE
            WHEN a.reimbursed::text = ''::text THEN 0.00::numeric(20,2)
            ELSE replace(replace(replace(replace(a.reimbursed::text, ','::text, ''::text), '$'::text, ''::text), ')'::text, ''::text), '('::text, '-'::text)::numeric(20,2)
        END AS reimbursed,
        CASE
            WHEN a.claim_status::text = ''::text THEN NULL::character varying(256)
            ELSE a.claim_status
        END AS claim_status,
        CASE
            WHEN a.description_text = ''::text THEN NULL::character varying(4096)::text
            ELSE a.description_text
        END AS description_text,
        CASE
            WHEN a.claim_address_1::text = ''::text THEN NULL::character varying(256)
            ELSE a.claim_address_1
        END AS claim_address_1,
        CASE
            WHEN a.claim_address_2::text = ''::text THEN NULL::character varying(256)
            ELSE a.claim_address_2
        END AS claim_address_2,
        CASE
            WHEN a.claim_city::text = ''::text THEN NULL::character varying(256)
            ELSE a.claim_city
        END AS claim_city,
        CASE
            WHEN a.claim_state::text = ''::text THEN NULL::character varying(256)
            ELSE a.claim_state
        END AS claim_state,
        CASE
            WHEN a.claim_zip::text = ''::text THEN NULL::character varying(256)
            ELSE a.claim_zip
        END AS claim_zip,
        CASE
            WHEN a.claim_site::text = ''::text THEN NULL::character varying(256)
            ELSE a.claim_site
        END AS claim_site,
        CASE
            WHEN a.benefit_state::text = ''::text THEN NULL::character varying(256)
            ELSE a.benefit_state
        END AS benefit_state,
        CASE
            WHEN a.garage_state::text = ''::text THEN NULL::character varying(256)
            ELSE a.garage_state
        END AS garage_state,
        CASE
            WHEN a.occupation::text = ''::text THEN NULL::character varying(256)
            ELSE a.occupation
        END AS occupation,
        CASE
            WHEN a.class_code::text = ''::text THEN NULL::character varying(256)
            ELSE a.class_code
        END AS class_code,
        CASE
            WHEN a.claimant_name::text = ''::text THEN NULL::character varying(256)
            ELSE a.claimant_name
        END AS claimant_name,
        CASE
            WHEN a.claimant_first::text = ''::text THEN NULL::character varying(256)
            ELSE a.claimant_first
        END AS claimant_first,
        CASE
            WHEN a.claimant_middle::text = ''::text THEN NULL::character varying(256)
            ELSE a.claimant_middle
        END AS claimant_middle,
        CASE
            WHEN a.claimant_last::text = ''::text THEN NULL::character varying(256)
            ELSE a.claimant_last
        END AS claimant_last,
        CASE
            WHEN a.driver_first::text = ''::text THEN NULL::character varying(256)
            ELSE a.driver_first
        END AS driver_first,
        CASE
            WHEN a.driver_middle::text = ''::text THEN NULL::character varying(256)
            ELSE a.driver_middle
        END AS driver_middle,
        CASE
            WHEN a.driver_last::text = ''::text THEN NULL::character varying(256)
            ELSE a.driver_last
        END AS driver_last,
        CASE
            WHEN a.loss_date::text = '1900-01-01'::text THEN NULL::date
            ELSE
            CASE
                WHEN a.loss_date::text = ''::text THEN NULL::date
                ELSE trim(a.loss_date)::date
            END
        END AS loss_date,
        CASE
            WHEN a.loss_time::text = '00:00:00'::text THEN NULL::time without time zone
            ELSE
            CASE
                WHEN a.loss_time::text = ''::text THEN NULL::time without time zone
                ELSE
                CASE
                    WHEN a.loss_time::text = 'PM'::text THEN NULL::time without time zone
                    ELSE
                    CASE
                        WHEN a.loss_time::text = 'AM'::text THEN NULL::time without time zone
                        ELSE a.loss_time::time without time zone
                    END
                END
            END
        END AS loss_time,
        CASE
            WHEN a.report_date::text = '1900-01-01'::text THEN NULL::date
            ELSE
            CASE
                WHEN a.report_date::text = ''::text THEN NULL::date
                ELSE trim(a.report_date)::date
            END
        END AS report_date,
        CASE
            WHEN a.closed_date::text = '1900-01-01'::text THEN NULL::date
            ELSE
            CASE
                WHEN a.closed_date::text = ''::text THEN NULL::date
                ELSE trim(a.closed_date)::date
            END
        END AS closed_date,
        CASE
            WHEN a.reopen_date::text = '1900-01-01'::text THEN NULL::date
            ELSE
            CASE
                WHEN a.reopen_date::text = ''::text THEN NULL::date
                ELSE a.reopen_date::date
            END
        END AS reopen_date,
        CASE
            WHEN a.litigation::text = ''::text THEN NULL::character varying(256)
            ELSE a.litigation
        END AS litigation,
        CASE
            WHEN a.days_employed::text = ''::text THEN NULL::integer
            ELSE replace(a.days_employed, ',', '')::double precision::integer
        END AS days_employed,
        CASE
            WHEN a.claimant_gender::text = ''::text THEN NULL::character varying(256)
            ELSE a.claimant_gender
        END AS claimant_gender,
        CASE
            WHEN a.claimant_age in ('0','0.0') THEN NULL::integer
            ELSE
            CASE
                WHEN a.claimant_age::text = ''::text THEN NULL::integer
                ELSE replace(a.claimant_age,'.0','')::integer
            END
        END AS claimant_age,
        CASE
            WHEN a.claimant_shift in ('0','0.0') THEN NULL::integer
            ELSE
            CASE
                WHEN a.claimant_shift::text = ''::text THEN NULL::integer
                ELSE replace(a.claimant_shift,'.0','')::integer
            END
        END AS claimant_shift,
        CASE
            WHEN a.claimant_supervisor::text = ''::text THEN NULL::character varying(256)
            ELSE a.claimant_supervisor
        END AS claimant_supervisor,
        CASE
            WHEN a.carrier_body_part::text = ''::text THEN 'Unknown'::character varying(256)
            ELSE a.carrier_body_part
        END::text::character varying(256) AS carrier_body_part,
        CASE
            WHEN a.carrier_cause::text = ''::text THEN 'Unknown'::character varying(256)
            ELSE a.carrier_cause
        END::text::character varying(256) AS carrier_cause,
        CASE
            WHEN a.carrier_coverage_type::text = ''::text THEN 'Unknown'::character varying(256)
            ELSE a.carrier_coverage_type
        END::text::character varying(256) AS carrier_coverage_type,
        CASE
            WHEN a.carrier_nature::text = ''::text THEN 'Unknown'::character varying(256)
            ELSE a.carrier_nature
        END::text::character varying(256) AS carrier_nature,
        CASE
            WHEN a.carrier_injury_code::text = ''::text THEN 'Unknown'::character varying(256)
            ELSE a.carrier_injury_code
        END::text::character varying(256) AS carrier_injury_code,
        CASE
            WHEN a.carrier_policy_number::text = ''::text THEN 'Unknown'::character varying(256)
            ELSE a.carrier_policy_number
        END::text::character varying(256) AS carrier_policy_number,
    a.source_table,
    a.uploaded_at::date AS uploaded_at
   FROM p_and_c.all_claims_raw a;
GO
  
/*** PERMISSIONS ***/
ALTER VIEW p_and_c.all_claims_clean OWNER TO mj_admin;
GO

Grant select on table p_and_c.all_claims_clean to rl_pc_data_analyst;
GO

Grant select on table p_and_c.all_claims_clean to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.all_claims_clean to rpauser;
GO
GRANT SELECT ON p_and_c.all_claims_clean to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.all_claims_clean to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.all_claims_clean to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.all_claims_clean to rl_p_and_c_d;
GO