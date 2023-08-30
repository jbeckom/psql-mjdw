CREATE OR REPLACE VIEW p_and_c.tier_1_results
AS SELECT d.client_id,
    d.completion_date,
    d.respondent_name,
    d.category,
    d.score,
    d.result,
    e.text
   FROM ( SELECT c.client_id,
            c.completion_date,
            c.respondent_name,
            c.category,
            c.score,
                CASE
                    WHEN c.score < 0.2 THEN 'Developmental'::text
                    ELSE
                    CASE
                        WHEN c.score < 0.5 THEN 'Emerging'::text
                        ELSE
                        CASE
                            WHEN c.score < 0.8 THEN 'Moderate'::text
                            ELSE 'Significant'::text
                        END
                    END
                END AS result
           FROM ( SELECT b.client_id,
                    a.completion_date,
                    a.respondent_name,
                    'Risk Management Practices'::text AS category,
                    (a.risk_management_practices / (11.5 - a.no0::numeric))::numeric(3,2) AS score
                   FROM ( SELECT tier_1_answers.company_name,
                            (tier_1_answers.yes0 + tier_1_answers.yes1 + tier_1_answers.yes2 + tier_1_answers.yes4)::numeric + 0.25 * (tier_1_answers.partially2 + tier_1_answers.partially4)::numeric + 0.5 * (tier_1_answers.assessments + tier_1_answers.audits + tier_1_answers.standards + tier_1_answers.maturity_model + tier_1_answers.registers)::numeric + (tier_1_answers.claim_reviews + tier_1_answers.preferred_medical_providers + tier_1_answers.rtw + tier_1_answers.root_cause_analysis + tier_1_answers.special_handling_instructions)::numeric AS risk_management_practices,
                            (tier_1_answers.yes6 + tier_1_answers.yes7 + tier_1_answers.yes8 + tier_1_answers.yes9 + tier_1_answers.yes10)::numeric + 0.25 * (tier_1_answers.partially6 + tier_1_answers.partially7 + tier_1_answers.partially8 + tier_1_answers.partially9 + tier_1_answers.partially10)::numeric AS business_continuity,
                            (tier_1_answers.yes11 + tier_1_answers.yes12 + tier_1_answers.yes13 + tier_1_answers.yes14 + tier_1_answers.yes15)::numeric + 0.25 * (tier_1_answers.partially11 + tier_1_answers.partially12 + tier_1_answers.partially13 + tier_1_answers.partially14 + tier_1_answers.partially15)::numeric AS contractual,
                            (tier_1_answers.yes16 + tier_1_answers.yes17 + tier_1_answers.yes18 + tier_1_answers.yes19 + tier_1_answers.yes20)::numeric + 0.25 * (tier_1_answers.partially16 + tier_1_answers.partially17 + tier_1_answers.partially18 + tier_1_answers.partially19 + tier_1_answers.partially20)::numeric AS cyber,
                            (tier_1_answers.yes21 + tier_1_answers.yes22 + tier_1_answers.yes23 + tier_1_answers.yes24 + tier_1_answers.yes25)::numeric + 0.25 * (tier_1_answers.partially21 + tier_1_answers.partially22 + tier_1_answers.partially23 + tier_1_answers.partially24 + tier_1_answers.partially25)::numeric AS employee_practices,
                            (tier_1_answers.yes26 + tier_1_answers.yes27 + tier_1_answers.yes28 + tier_1_answers.yes29 + tier_1_answers.yes30)::numeric + 0.25 * (tier_1_answers.partially26 + tier_1_answers.partially27 + tier_1_answers.partially28 + tier_1_answers.partially29 + tier_1_answers.partially30)::numeric AS fleet_operations,
                            (tier_1_answers.yes31 + tier_1_answers.yes32 + tier_1_answers.yes33 + tier_1_answers.yes34 + tier_1_answers.yes35)::numeric + 0.25 * (tier_1_answers.partially31 + tier_1_answers.partially32 + tier_1_answers.partially33 + tier_1_answers.partially34 + tier_1_answers.partially35)::numeric AS safety_management,
                            tier_1_answers.no0,
                            tier_1_answers.completion_date,
                            tier_1_answers.respondent_name
                           FROM p_and_c.tier_1_answers) a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.completion_date,
                    a.respondent_name,
                    'Business Continuity'::text AS category,
                    (a.business_continuity / 5::numeric)::numeric(3,2) AS score
                   FROM ( SELECT tier_1_answers.company_name,
                            (tier_1_answers.yes0 + tier_1_answers.yes1 + tier_1_answers.yes2 + tier_1_answers.yes4)::numeric + 0.25 * (tier_1_answers.partially2 + tier_1_answers.partially4)::numeric + 0.5 * (tier_1_answers.assessments + tier_1_answers.audits + tier_1_answers.standards + tier_1_answers.maturity_model + tier_1_answers.registers)::numeric + (tier_1_answers.claim_reviews + tier_1_answers.preferred_medical_providers + tier_1_answers.rtw + tier_1_answers.root_cause_analysis + tier_1_answers.special_handling_instructions)::numeric AS risk_management_practices,
                            (tier_1_answers.yes6 + tier_1_answers.yes7 + tier_1_answers.yes8 + tier_1_answers.yes9 + tier_1_answers.yes10)::numeric + 0.25 * (tier_1_answers.partially6 + tier_1_answers.partially7 + tier_1_answers.partially8 + tier_1_answers.partially9 + tier_1_answers.partially10)::numeric AS business_continuity,
                            (tier_1_answers.yes11 + tier_1_answers.yes12 + tier_1_answers.yes13 + tier_1_answers.yes14 + tier_1_answers.yes15)::numeric + 0.25 * (tier_1_answers.partially11 + tier_1_answers.partially12 + tier_1_answers.partially13 + tier_1_answers.partially14 + tier_1_answers.partially15)::numeric AS contractual,
                            (tier_1_answers.yes16 + tier_1_answers.yes17 + tier_1_answers.yes18 + tier_1_answers.yes19 + tier_1_answers.yes20)::numeric + 0.25 * (tier_1_answers.partially16 + tier_1_answers.partially17 + tier_1_answers.partially18 + tier_1_answers.partially19 + tier_1_answers.partially20)::numeric AS cyber,
                            (tier_1_answers.yes21 + tier_1_answers.yes22 + tier_1_answers.yes23 + tier_1_answers.yes24 + tier_1_answers.yes25)::numeric + 0.25 * (tier_1_answers.partially21 + tier_1_answers.partially22 + tier_1_answers.partially23 + tier_1_answers.partially24 + tier_1_answers.partially25)::numeric AS employee_practices,
                            (tier_1_answers.yes26 + tier_1_answers.yes27 + tier_1_answers.yes28 + tier_1_answers.yes29 + tier_1_answers.yes30)::numeric + 0.25 * (tier_1_answers.partially26 + tier_1_answers.partially27 + tier_1_answers.partially28 + tier_1_answers.partially29 + tier_1_answers.partially30)::numeric AS fleet_operations,
                            (tier_1_answers.yes31 + tier_1_answers.yes32 + tier_1_answers.yes33 + tier_1_answers.yes34 + tier_1_answers.yes35)::numeric + 0.25 * (tier_1_answers.partially31 + tier_1_answers.partially32 + tier_1_answers.partially33 + tier_1_answers.partially34 + tier_1_answers.partially35)::numeric AS safety_management,
                            tier_1_answers.no0,
                            tier_1_answers.completion_date,
                            tier_1_answers.respondent_name
                           FROM p_and_c.tier_1_answers) a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.completion_date,
                    a.respondent_name,
                    'Contractual'::text AS category,
                    (a.contractual / 5::numeric)::numeric(3,2) AS score
                   FROM ( SELECT tier_1_answers.company_name,
                            (tier_1_answers.yes0 + tier_1_answers.yes1 + tier_1_answers.yes2 + tier_1_answers.yes4)::numeric + 0.25 * (tier_1_answers.partially2 + tier_1_answers.partially4)::numeric + 0.5 * (tier_1_answers.assessments + tier_1_answers.audits + tier_1_answers.standards + tier_1_answers.maturity_model + tier_1_answers.registers)::numeric + (tier_1_answers.claim_reviews + tier_1_answers.preferred_medical_providers + tier_1_answers.rtw + tier_1_answers.root_cause_analysis + tier_1_answers.special_handling_instructions)::numeric AS risk_management_practices,
                            (tier_1_answers.yes6 + tier_1_answers.yes7 + tier_1_answers.yes8 + tier_1_answers.yes9 + tier_1_answers.yes10)::numeric + 0.25 * (tier_1_answers.partially6 + tier_1_answers.partially7 + tier_1_answers.partially8 + tier_1_answers.partially9 + tier_1_answers.partially10)::numeric AS business_continuity,
                            (tier_1_answers.yes11 + tier_1_answers.yes12 + tier_1_answers.yes13 + tier_1_answers.yes14 + tier_1_answers.yes15)::numeric + 0.25 * (tier_1_answers.partially11 + tier_1_answers.partially12 + tier_1_answers.partially13 + tier_1_answers.partially14 + tier_1_answers.partially15)::numeric AS contractual,
                            (tier_1_answers.yes16 + tier_1_answers.yes17 + tier_1_answers.yes18 + tier_1_answers.yes19 + tier_1_answers.yes20)::numeric + 0.25 * (tier_1_answers.partially16 + tier_1_answers.partially17 + tier_1_answers.partially18 + tier_1_answers.partially19 + tier_1_answers.partially20)::numeric AS cyber,
                            (tier_1_answers.yes21 + tier_1_answers.yes22 + tier_1_answers.yes23 + tier_1_answers.yes24 + tier_1_answers.yes25)::numeric + 0.25 * (tier_1_answers.partially21 + tier_1_answers.partially22 + tier_1_answers.partially23 + tier_1_answers.partially24 + tier_1_answers.partially25)::numeric AS employee_practices,
                            (tier_1_answers.yes26 + tier_1_answers.yes27 + tier_1_answers.yes28 + tier_1_answers.yes29 + tier_1_answers.yes30)::numeric + 0.25 * (tier_1_answers.partially26 + tier_1_answers.partially27 + tier_1_answers.partially28 + tier_1_answers.partially29 + tier_1_answers.partially30)::numeric AS fleet_operations,
                            (tier_1_answers.yes31 + tier_1_answers.yes32 + tier_1_answers.yes33 + tier_1_answers.yes34 + tier_1_answers.yes35)::numeric + 0.25 * (tier_1_answers.partially31 + tier_1_answers.partially32 + tier_1_answers.partially33 + tier_1_answers.partially34 + tier_1_answers.partially35)::numeric AS safety_management,
                            tier_1_answers.no0,
                            tier_1_answers.completion_date,
                            tier_1_answers.respondent_name
                           FROM p_and_c.tier_1_answers) a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.completion_date,
                    a.respondent_name,
                    'Cyber'::text AS category,
                    (a.cyber / 5::numeric)::numeric(3,2) AS score
                   FROM ( SELECT tier_1_answers.company_name,
                            (tier_1_answers.yes0 + tier_1_answers.yes1 + tier_1_answers.yes2 + tier_1_answers.yes4)::numeric + 0.25 * (tier_1_answers.partially2 + tier_1_answers.partially4)::numeric + 0.5 * (tier_1_answers.assessments + tier_1_answers.audits + tier_1_answers.standards + tier_1_answers.maturity_model + tier_1_answers.registers)::numeric + (tier_1_answers.claim_reviews + tier_1_answers.preferred_medical_providers + tier_1_answers.rtw + tier_1_answers.root_cause_analysis + tier_1_answers.special_handling_instructions)::numeric AS risk_management_practices,
                            (tier_1_answers.yes6 + tier_1_answers.yes7 + tier_1_answers.yes8 + tier_1_answers.yes9 + tier_1_answers.yes10)::numeric + 0.25 * (tier_1_answers.partially6 + tier_1_answers.partially7 + tier_1_answers.partially8 + tier_1_answers.partially9 + tier_1_answers.partially10)::numeric AS business_continuity,
                            (tier_1_answers.yes11 + tier_1_answers.yes12 + tier_1_answers.yes13 + tier_1_answers.yes14 + tier_1_answers.yes15)::numeric + 0.25 * (tier_1_answers.partially11 + tier_1_answers.partially12 + tier_1_answers.partially13 + tier_1_answers.partially14 + tier_1_answers.partially15)::numeric AS contractual,
                            (tier_1_answers.yes16 + tier_1_answers.yes17 + tier_1_answers.yes18 + tier_1_answers.yes19 + tier_1_answers.yes20)::numeric + 0.25 * (tier_1_answers.partially16 + tier_1_answers.partially17 + tier_1_answers.partially18 + tier_1_answers.partially19 + tier_1_answers.partially20)::numeric AS cyber,
                            (tier_1_answers.yes21 + tier_1_answers.yes22 + tier_1_answers.yes23 + tier_1_answers.yes24 + tier_1_answers.yes25)::numeric + 0.25 * (tier_1_answers.partially21 + tier_1_answers.partially22 + tier_1_answers.partially23 + tier_1_answers.partially24 + tier_1_answers.partially25)::numeric AS employee_practices,
                            (tier_1_answers.yes26 + tier_1_answers.yes27 + tier_1_answers.yes28 + tier_1_answers.yes29 + tier_1_answers.yes30)::numeric + 0.25 * (tier_1_answers.partially26 + tier_1_answers.partially27 + tier_1_answers.partially28 + tier_1_answers.partially29 + tier_1_answers.partially30)::numeric AS fleet_operations,
                            (tier_1_answers.yes31 + tier_1_answers.yes32 + tier_1_answers.yes33 + tier_1_answers.yes34 + tier_1_answers.yes35)::numeric + 0.25 * (tier_1_answers.partially31 + tier_1_answers.partially32 + tier_1_answers.partially33 + tier_1_answers.partially34 + tier_1_answers.partially35)::numeric AS safety_management,
                            tier_1_answers.no0,
                            tier_1_answers.completion_date,
                            tier_1_answers.respondent_name
                           FROM p_and_c.tier_1_answers) a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.completion_date,
                    a.respondent_name,
                    'Employee Practices'::text AS category,
                    (a.employee_practices / 5::numeric)::numeric(3,2) AS score
                   FROM ( SELECT tier_1_answers.company_name,
                            (tier_1_answers.yes0 + tier_1_answers.yes1 + tier_1_answers.yes2 + tier_1_answers.yes4)::numeric + 0.25 * (tier_1_answers.partially2 + tier_1_answers.partially4)::numeric + 0.5 * (tier_1_answers.assessments + tier_1_answers.audits + tier_1_answers.standards + tier_1_answers.maturity_model + tier_1_answers.registers)::numeric + (tier_1_answers.claim_reviews + tier_1_answers.preferred_medical_providers + tier_1_answers.rtw + tier_1_answers.root_cause_analysis + tier_1_answers.special_handling_instructions)::numeric AS risk_management_practices,
                            (tier_1_answers.yes6 + tier_1_answers.yes7 + tier_1_answers.yes8 + tier_1_answers.yes9 + tier_1_answers.yes10)::numeric + 0.25 * (tier_1_answers.partially6 + tier_1_answers.partially7 + tier_1_answers.partially8 + tier_1_answers.partially9 + tier_1_answers.partially10)::numeric AS business_continuity,
                            (tier_1_answers.yes11 + tier_1_answers.yes12 + tier_1_answers.yes13 + tier_1_answers.yes14 + tier_1_answers.yes15)::numeric + 0.25 * (tier_1_answers.partially11 + tier_1_answers.partially12 + tier_1_answers.partially13 + tier_1_answers.partially14 + tier_1_answers.partially15)::numeric AS contractual,
                            (tier_1_answers.yes16 + tier_1_answers.yes17 + tier_1_answers.yes18 + tier_1_answers.yes19 + tier_1_answers.yes20)::numeric + 0.25 * (tier_1_answers.partially16 + tier_1_answers.partially17 + tier_1_answers.partially18 + tier_1_answers.partially19 + tier_1_answers.partially20)::numeric AS cyber,
                            (tier_1_answers.yes21 + tier_1_answers.yes22 + tier_1_answers.yes23 + tier_1_answers.yes24 + tier_1_answers.yes25)::numeric + 0.25 * (tier_1_answers.partially21 + tier_1_answers.partially22 + tier_1_answers.partially23 + tier_1_answers.partially24 + tier_1_answers.partially25)::numeric AS employee_practices,
                            (tier_1_answers.yes26 + tier_1_answers.yes27 + tier_1_answers.yes28 + tier_1_answers.yes29 + tier_1_answers.yes30)::numeric + 0.25 * (tier_1_answers.partially26 + tier_1_answers.partially27 + tier_1_answers.partially28 + tier_1_answers.partially29 + tier_1_answers.partially30)::numeric AS fleet_operations,
                            (tier_1_answers.yes31 + tier_1_answers.yes32 + tier_1_answers.yes33 + tier_1_answers.yes34 + tier_1_answers.yes35)::numeric + 0.25 * (tier_1_answers.partially31 + tier_1_answers.partially32 + tier_1_answers.partially33 + tier_1_answers.partially34 + tier_1_answers.partially35)::numeric AS safety_management,
                            tier_1_answers.no0,
                            tier_1_answers.completion_date,
                            tier_1_answers.respondent_name
                           FROM p_and_c.tier_1_answers) a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.completion_date,
                    a.respondent_name,
                    'Fleet Operations'::text AS category,
                    (a.fleet_operations / 5::numeric)::numeric(3,2) AS score
                   FROM ( SELECT tier_1_answers.company_name,
                            (tier_1_answers.yes0 + tier_1_answers.yes1 + tier_1_answers.yes2 + tier_1_answers.yes4)::numeric + 0.25 * (tier_1_answers.partially2 + tier_1_answers.partially4)::numeric + 0.5 * (tier_1_answers.assessments + tier_1_answers.audits + tier_1_answers.standards + tier_1_answers.maturity_model + tier_1_answers.registers)::numeric + (tier_1_answers.claim_reviews + tier_1_answers.preferred_medical_providers + tier_1_answers.rtw + tier_1_answers.root_cause_analysis + tier_1_answers.special_handling_instructions)::numeric AS risk_management_practices,
                            (tier_1_answers.yes6 + tier_1_answers.yes7 + tier_1_answers.yes8 + tier_1_answers.yes9 + tier_1_answers.yes10)::numeric + 0.25 * (tier_1_answers.partially6 + tier_1_answers.partially7 + tier_1_answers.partially8 + tier_1_answers.partially9 + tier_1_answers.partially10)::numeric AS business_continuity,
                            (tier_1_answers.yes11 + tier_1_answers.yes12 + tier_1_answers.yes13 + tier_1_answers.yes14 + tier_1_answers.yes15)::numeric + 0.25 * (tier_1_answers.partially11 + tier_1_answers.partially12 + tier_1_answers.partially13 + tier_1_answers.partially14 + tier_1_answers.partially15)::numeric AS contractual,
                            (tier_1_answers.yes16 + tier_1_answers.yes17 + tier_1_answers.yes18 + tier_1_answers.yes19 + tier_1_answers.yes20)::numeric + 0.25 * (tier_1_answers.partially16 + tier_1_answers.partially17 + tier_1_answers.partially18 + tier_1_answers.partially19 + tier_1_answers.partially20)::numeric AS cyber,
                            (tier_1_answers.yes21 + tier_1_answers.yes22 + tier_1_answers.yes23 + tier_1_answers.yes24 + tier_1_answers.yes25)::numeric + 0.25 * (tier_1_answers.partially21 + tier_1_answers.partially22 + tier_1_answers.partially23 + tier_1_answers.partially24 + tier_1_answers.partially25)::numeric AS employee_practices,
                            (tier_1_answers.yes26 + tier_1_answers.yes27 + tier_1_answers.yes28 + tier_1_answers.yes29 + tier_1_answers.yes30)::numeric + 0.25 * (tier_1_answers.partially26 + tier_1_answers.partially27 + tier_1_answers.partially28 + tier_1_answers.partially29 + tier_1_answers.partially30)::numeric AS fleet_operations,
                            (tier_1_answers.yes31 + tier_1_answers.yes32 + tier_1_answers.yes33 + tier_1_answers.yes34 + tier_1_answers.yes35)::numeric + 0.25 * (tier_1_answers.partially31 + tier_1_answers.partially32 + tier_1_answers.partially33 + tier_1_answers.partially34 + tier_1_answers.partially35)::numeric AS safety_management,
                            tier_1_answers.no0,
                            tier_1_answers.completion_date,
                            tier_1_answers.respondent_name
                           FROM p_and_c.tier_1_answers) a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.completion_date,
                    a.respondent_name,
                    'Safety Management'::text AS category,
                    (a.safety_management / 5::numeric)::numeric(3,2) AS score
                   FROM ( SELECT tier_1_answers.company_name,
                            (tier_1_answers.yes0 + tier_1_answers.yes1 + tier_1_answers.yes2 + tier_1_answers.yes4)::numeric + 0.25 * (tier_1_answers.partially2 + tier_1_answers.partially4)::numeric + 0.5 * (tier_1_answers.assessments + tier_1_answers.audits + tier_1_answers.standards + tier_1_answers.maturity_model + tier_1_answers.registers)::numeric + (tier_1_answers.claim_reviews + tier_1_answers.preferred_medical_providers + tier_1_answers.rtw + tier_1_answers.root_cause_analysis + tier_1_answers.special_handling_instructions)::numeric AS risk_management_practices,
                            (tier_1_answers.yes6 + tier_1_answers.yes7 + tier_1_answers.yes8 + tier_1_answers.yes9 + tier_1_answers.yes10)::numeric + 0.25 * (tier_1_answers.partially6 + tier_1_answers.partially7 + tier_1_answers.partially8 + tier_1_answers.partially9 + tier_1_answers.partially10)::numeric AS business_continuity,
                            (tier_1_answers.yes11 + tier_1_answers.yes12 + tier_1_answers.yes13 + tier_1_answers.yes14 + tier_1_answers.yes15)::numeric + 0.25 * (tier_1_answers.partially11 + tier_1_answers.partially12 + tier_1_answers.partially13 + tier_1_answers.partially14 + tier_1_answers.partially15)::numeric AS contractual,
                            (tier_1_answers.yes16 + tier_1_answers.yes17 + tier_1_answers.yes18 + tier_1_answers.yes19 + tier_1_answers.yes20)::numeric + 0.25 * (tier_1_answers.partially16 + tier_1_answers.partially17 + tier_1_answers.partially18 + tier_1_answers.partially19 + tier_1_answers.partially20)::numeric AS cyber,
                            (tier_1_answers.yes21 + tier_1_answers.yes22 + tier_1_answers.yes23 + tier_1_answers.yes24 + tier_1_answers.yes25)::numeric + 0.25 * (tier_1_answers.partially21 + tier_1_answers.partially22 + tier_1_answers.partially23 + tier_1_answers.partially24 + tier_1_answers.partially25)::numeric AS employee_practices,
                            (tier_1_answers.yes26 + tier_1_answers.yes27 + tier_1_answers.yes28 + tier_1_answers.yes29 + tier_1_answers.yes30)::numeric + 0.25 * (tier_1_answers.partially26 + tier_1_answers.partially27 + tier_1_answers.partially28 + tier_1_answers.partially29 + tier_1_answers.partially30)::numeric AS fleet_operations,
                            (tier_1_answers.yes31 + tier_1_answers.yes32 + tier_1_answers.yes33 + tier_1_answers.yes34 + tier_1_answers.yes35)::numeric + 0.25 * (tier_1_answers.partially31 + tier_1_answers.partially32 + tier_1_answers.partially33 + tier_1_answers.partially34 + tier_1_answers.partially35)::numeric AS safety_management,
                            tier_1_answers.no0,
                            tier_1_answers.completion_date,
                            tier_1_answers.respondent_name
                           FROM p_and_c.tier_1_answers) a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.completion_date,
                    a.respondent_name,
                    'Overall'::text AS category,
                    ((a.risk_management_practices + a.business_continuity + a.contractual + a.cyber + a.employee_practices + a.fleet_operations + a.safety_management) / (41.5 - a.no0::numeric))::numeric(3,2) AS score
                   FROM ( SELECT tier_1_answers.company_name,
                            (tier_1_answers.yes0 + tier_1_answers.yes1 + tier_1_answers.yes2 + tier_1_answers.yes4)::numeric + 0.25 * (tier_1_answers.partially2 + tier_1_answers.partially4)::numeric + 0.5 * (tier_1_answers.assessments + tier_1_answers.audits + tier_1_answers.standards + tier_1_answers.maturity_model + tier_1_answers.registers)::numeric + (tier_1_answers.claim_reviews + tier_1_answers.preferred_medical_providers + tier_1_answers.rtw + tier_1_answers.root_cause_analysis + tier_1_answers.special_handling_instructions)::numeric AS risk_management_practices,
                            (tier_1_answers.yes6 + tier_1_answers.yes7 + tier_1_answers.yes8 + tier_1_answers.yes9 + tier_1_answers.yes10)::numeric + 0.25 * (tier_1_answers.partially6 + tier_1_answers.partially7 + tier_1_answers.partially8 + tier_1_answers.partially9 + tier_1_answers.partially10)::numeric AS business_continuity,
                            (tier_1_answers.yes11 + tier_1_answers.yes12 + tier_1_answers.yes13 + tier_1_answers.yes14 + tier_1_answers.yes15)::numeric + 0.25 * (tier_1_answers.partially11 + tier_1_answers.partially12 + tier_1_answers.partially13 + tier_1_answers.partially14 + tier_1_answers.partially15)::numeric AS contractual,
                            (tier_1_answers.yes16 + tier_1_answers.yes17 + tier_1_answers.yes18 + tier_1_answers.yes19 + tier_1_answers.yes20)::numeric + 0.25 * (tier_1_answers.partially16 + tier_1_answers.partially17 + tier_1_answers.partially18 + tier_1_answers.partially19 + tier_1_answers.partially20)::numeric AS cyber,
                            (tier_1_answers.yes21 + tier_1_answers.yes22 + tier_1_answers.yes23 + tier_1_answers.yes24 + tier_1_answers.yes25)::numeric + 0.25 * (tier_1_answers.partially21 + tier_1_answers.partially22 + tier_1_answers.partially23 + tier_1_answers.partially24 + tier_1_answers.partially25)::numeric AS employee_practices,
                            (tier_1_answers.yes26 + tier_1_answers.yes27 + tier_1_answers.yes28 + tier_1_answers.yes29 + tier_1_answers.yes30)::numeric + 0.25 * (tier_1_answers.partially26 + tier_1_answers.partially27 + tier_1_answers.partially28 + tier_1_answers.partially29 + tier_1_answers.partially30)::numeric AS fleet_operations,
                            (tier_1_answers.yes31 + tier_1_answers.yes32 + tier_1_answers.yes33 + tier_1_answers.yes34 + tier_1_answers.yes35)::numeric + 0.25 * (tier_1_answers.partially31 + tier_1_answers.partially32 + tier_1_answers.partially33 + tier_1_answers.partially34 + tier_1_answers.partially35)::numeric AS safety_management,
                            tier_1_answers.no0,
                            tier_1_answers.completion_date,
                            tier_1_answers.respondent_name
                           FROM p_and_c.tier_1_answers) a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text) c) d
     LEFT JOIN p_and_c.assessment_text e ON d.category = e.category::text AND d.result = e.result::text
  WHERE e.assessment::text = 'tier_1'::text;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.tier_1_results OWNER TO mj_admin;
GO

Grant select on table p_and_c.tier_1_results to rl_pc_data_analyst;
GO

Grant select on table p_and_c.tier_1_results to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.tier_1_results to rpauser;
GO
GRANT SELECT ON p_and_c.tier_1_results to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.tier_1_results to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.tier_1_results to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.tier_1_results to rl_p_and_c_d;
GO