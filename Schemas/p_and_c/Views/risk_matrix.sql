CREATE OR REPLACE VIEW p_and_c.risk_matrix
AS SELECT finished.company_name,
    finished.id,
    finished.completion_date,
    finished.line,
        CASE
            WHEN finished.frequency > 10::numeric THEN 10::numeric
            ELSE
            CASE
                WHEN finished.frequency < 0::numeric THEN 0::numeric
                ELSE round(finished.frequency, 1)
            END
        END AS frequency,
        CASE
            WHEN finished.severity > 10::numeric THEN 10::numeric
            ELSE
            CASE
                WHEN finished.severity < 0::numeric THEN 0::numeric
                ELSE round(finished.severity, 1)
            END
        END AS severity
   FROM ( SELECT DISTINCT a.company_name,
            c.id,
            a.completion_date,
            'Continuity'::text AS line,
            0.1 * d.am_best_business_interruption * (8::numeric + (
                CASE
                    WHEN d.sic_category_id = 'D'::text THEN 1.3
                    ELSE
                    CASE
                        WHEN d.sic_category_id = 'C'::text THEN 0.7
                        ELSE 1::numeric
                    END
                END +
                CASE
                    WHEN a.decentralized = 1 THEN 0.7
                    ELSE 1::numeric
                END)) * (1.3 - ((a.yes6 + a.yes7 + a.yes8 + a.yes9 + a.yes10)::numeric + 0.25 * (a.partially6 + a.partially7 + a.partially8 + a.partially9 + a.partially10)::numeric) * 0.2 * 0.6) AS frequency,
            0.2 * d.am_best_business_interruption * (3::numeric + (
                CASE
                    WHEN d.sic_category_id = 'D'::text THEN 1.3
                    ELSE
                    CASE
                        WHEN d.sic_category_id = 'C'::text THEN 0.7
                        ELSE 1::numeric
                    END
                END +
                CASE
                    WHEN a.decentralized = 1 THEN 0.7
                    ELSE 1::numeric
                END)) * (1.3 - ((a.yes6 + a.yes7 + a.yes8 + a.yes9 + a.yes10)::numeric + 0.25 * (a.partially6 + a.partially7 + a.partially8 + a.partially9 + a.partially10)::numeric) * 0.2 * 0.6) AS severity
           FROM p_and_c.tier_1_answers a
             LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
             LEFT JOIN p_and_c.clients c ON b.client_id::text = c.id::text
             LEFT JOIN p_and_c.industry_codes d ON "left"(c.industry_id::text, 4) = d.sic_id_4
        UNION ALL
         SELECT DISTINCT a.company_name,
            c.id,
            a.completion_date,
            'Contractual'::text AS line,
            d.contractual_risk * (1.3 - ((a.yes11 + a.yes12 + a.yes13 + a.yes14 + a.yes15)::numeric + 0.25 * (a.partially11 + a.partially12 + a.partially13 + a.partially14 + a.partially15)::numeric) * 0.2 * 0.6) * 0.8 AS frequency,
            d.contractual_risk * (1.3 - ((a.yes11 + a.yes12 + a.yes13 + a.yes14 + a.yes15)::numeric + 0.25 * (a.partially11 + a.partially12 + a.partially13 + a.partially14 + a.partially15)::numeric) * 0.2 * 0.6) * 1.2 AS severity
           FROM p_and_c.tier_1_answers a
             LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
             LEFT JOIN p_and_c.clients c ON b.client_id::text = c.id::text
             LEFT JOIN p_and_c.industry_codes d ON "left"(c.industry_id::text, 4) = d.sic_id_4
        UNION ALL
         SELECT DISTINCT a.company_name,
            c.id,
            a.completion_date,
            'Cyber'::text AS line,
            d.ponemon_cyber_frequency * (1.25 - ((a.yes16 + a.yes17 + a.yes18 + a.yes19 + a.yes20)::numeric + 0.25 * (a.partially16 + a.partially17 + a.partially18 + a.partially19 + a.partially20)::numeric) * 0.2 * 0.5) AS frequency,
            d.ponemon_cyber_severity * (1.25 - ((a.yes16 + a.yes17 + a.yes18 + a.yes19 + a.yes20)::numeric + 0.25 * (a.partially16 + a.partially17 + a.partially18 + a.partially19 + a.partially20)::numeric) * 0.2 * 0.5) AS severity
           FROM p_and_c.tier_1_answers a
             LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
             LEFT JOIN p_and_c.clients c ON b.client_id::text = c.id::text
             LEFT JOIN p_and_c.industry_codes d ON "left"(c.industry_id::text, 4) = d.sic_id_4
        UNION ALL
         SELECT a.company_name,
            c.id,
            a.completion_date,
            'Employee Practices'::text AS line,
            10::numeric / (1::numeric + exp('-0.00276'::numeric * (sum(f.employee_headcount) - 500::numeric))) * (1.0 - ((a.yes21 + a.yes22 + a.yes23 + a.yes24 + a.yes25)::numeric + 0.25 * (a.partially21 + a.partially22 + a.partially23 + a.partially24 + a.partially25)::numeric) * 0.2 * 0.6) * 1.2 AS frequency,
            10::numeric / (1::numeric + exp('-0.00276'::numeric * (sum(f.employee_headcount) - 500::numeric))) * (1.0 - ((a.yes21 + a.yes22 + a.yes23 + a.yes24 + a.yes25)::numeric + 0.25 * (a.partially21 + a.partially22 + a.partially23 + a.partially24 + a.partially25)::numeric) * 0.2 * 0.6) * 0.8 AS severity
           FROM p_and_c.tier_1_answers a
             LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
             LEFT JOIN p_and_c.clients c ON b.client_id::text = c.id::text
             LEFT JOIN p_and_c.industry_codes d ON "left"(c.industry_id::text, 4) = d.sic_id_4
             LEFT JOIN p_and_c.all_policies e ON c.id::text = e.client_id::text
             LEFT JOIN p_and_c.all_employee_headcount f ON e.policy_id = f.policy_id
          WHERE a.completion_date >= e.policy_start_date AND (a.completion_date - '1 year'::interval) < e.policy_start_date AND e.coverage_type_id::text = 'WCO'::text
          GROUP BY a.company_name, c.id, a.completion_date, a.yes21, a.yes22, a.yes23, a.yes24, a.yes25, a.partially21, a.partially22, a.partially23, a.partially24, a.partially25
        UNION ALL
         SELECT a.company_name,
            c.id,
            a.completion_date,
            'Fleet'::text AS line,
            (0.2 * ((d.am_best_auto_liab + d.am_best_auto_pd) / 2::numeric) * 3::numeric + 0.4 * (10::numeric / (1::numeric + exp('-0.0555'::numeric * (count(f.policy_id)::numeric - 37.5))))) * (1.3 - ((a.yes26 + a.yes27 + a.yes28 + a.yes29 + a.yes30)::numeric + 0.25 * (a.partially26 + a.partially27 + a.partially28 + a.partially29 + a.partially30)::numeric) * 0.2 * 0.6) AS frequency,
            (0.2 * ((d.am_best_auto_liab + d.am_best_auto_pd) / 2::numeric) * 4::numeric + 0.2 * (10::numeric / (1::numeric + exp('-0.0555'::numeric * (count(f.policy_id)::numeric - 37.5))))) * (1.3 - ((a.yes26 + a.yes27 + a.yes28 + a.yes29 + a.yes30)::numeric + 0.25 * (a.partially26 + a.partially27 + a.partially28 + a.partially29 + a.partially30)::numeric) * 0.2 * 0.6) AS severity
           FROM p_and_c.tier_1_answers a
             LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
             LEFT JOIN p_and_c.clients c ON b.client_id::text = c.id::text
             LEFT JOIN p_and_c.industry_codes d ON "left"(c.industry_id::text, 4) = d.sic_id_4
             LEFT JOIN p_and_c.all_policies e ON c.id::text = e.client_id::text
             LEFT JOIN p_and_c.all_autos f ON e.policy_id = f.policy_id
          WHERE a.completion_date >= e.policy_start_date AND (a.completion_date - '1 year'::interval) < e.policy_start_date AND e.coverage_type_id::text = 'CAU'::text
          GROUP BY a.company_name, c.id, a.completion_date, a.yes26, a.yes27, a.yes28, a.yes29, a.yes30, a.partially26, a.partially27, a.partially28, a.partially29, a.partially30, d.am_best_auto_liab, d.am_best_auto_pd
        UNION ALL
         SELECT a.company_name,
            c.id,
            a.completion_date,
            'Safety'::text AS line,
            (0.1 * d.am_best_wco * (4::numeric + 2::numeric * max(e.mod) + 2::numeric) + 0.2 * (10::numeric / (1::numeric + exp('-0.00276'::numeric * (sum(f.employee_headcount) - 500::numeric))))) * (1.3 - 0.6 * ((a.yes31 + a.yes32 + a.yes33 + a.yes34 + a.yes35)::numeric + 0.25 * (a.partially31 + a.partially32 + a.partially33 + a.partially34 + a.partially35)::numeric) * 0.2) AS frequency,
            (0.1 * d.am_best_wco * (6::numeric + 1.5 * max(e.mod) + 1::numeric) + 0.15 * (10::numeric / (1::numeric + exp('-0.00276'::numeric * (sum(f.employee_headcount) - 500::numeric))))) * (1.3 - 0.6 * ((a.yes31 + a.yes32 + a.yes33 + a.yes34 + a.yes35)::numeric + 0.25 * (a.partially31 + a.partially32 + a.partially33 + a.partially34 + a.partially35)::numeric) * 0.2) AS severity
           FROM p_and_c.tier_1_answers a
             LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
             LEFT JOIN p_and_c.clients c ON b.client_id::text = c.id::text
             LEFT JOIN p_and_c.industry_codes d ON "left"(c.industry_id::text, 4) = d.sic_id_4
             LEFT JOIN p_and_c.all_policies e ON c.id::text = e.client_id::text
             LEFT JOIN p_and_c.all_employee_headcount f ON e.policy_id = f.policy_id
          WHERE a.completion_date >= e.policy_start_date AND (a.completion_date - '1 year'::interval) < e.policy_start_date AND e.coverage_type_id::text = 'WCO'::text
          GROUP BY a.company_name, c.id, a.completion_date, a.yes31, a.yes32, a.yes33, a.yes34, a.yes35, d.am_best_wco, a.partially31, a.partially32, a.partially33, a.partially34, a.partially35) finished;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.risk_matrix OWNER TO mj_admin;
GO

Grant select on table p_and_c.risk_matrix to rl_pc_data_analyst;
GO

Grant select on table p_and_c.risk_matrix to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.risk_matrix to rpauser;
GO
GRANT SELECT ON p_and_c.risk_matrix to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.risk_matrix to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.risk_matrix to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.risk_matrix to rl_p_and_c_d;
GO