CREATE OR REPLACE VIEW p_and_c.tier_2_continuity_results
AS SELECT y.client_id,
    y.company_name,
    y.completion_date,
    y.respondent,
    y.section,
    y.category,
    y.type,
    y.score,
    y.result,
    x.text
   FROM ( SELECT z.client_id,
            z.company_name,
            z.completion_date,
            z.respondent,
            z.section,
            z.category,
            z.type,
            round(z.score, 2) AS score,
                CASE
                    WHEN z.section = 'Risk Assessment'::text THEN
                    CASE
                        WHEN z.score < 0.15 THEN 'Low'::text
                        ELSE
                        CASE
                            WHEN z.score < 0.35 THEN 'Moderate'::text
                            ELSE
                            CASE
                                WHEN z.score < 0.75 THEN 'High'::text
                                ELSE 'Critical'::text
                            END
                        END
                    END
                    ELSE
                    CASE
                        WHEN z.score < 0.49 THEN 'Developmental'::text
                        ELSE
                        CASE
                            WHEN z.score < 0.7 THEN 'Moderate'::text
                            ELSE
                            CASE
                                WHEN z.score < 0.8 THEN 'Significant'::text
                                ELSE 'Best Practices'::text
                            END
                        END
                    END
                END AS result
           FROM ( SELECT b.client_id,
                    a.company_name::text AS company_name,
                    a."Completion_Date" AS completion_date,
                    a.respondent::text AS respondent,
                    'Risk Assessment'::text AS section,
                    'Business Interruption Risk'::text AS category,
                    NULL::text AS type,
                    (1 * (a.rare_0 + a.rare_1 + a.rare_10 + a.rare_20 + a.rare_30 + a.rare_40 + a.rare_50 + a.rare_60 + a.rare_70 + a.rare_80 + a.rare_90) + 2 * (a.unli_0 + a.unli_1 + a.unli_10 + a.unli_20 + a.unli_30 + a.unli_40 + a.unli_50 + a.unli_60 + a.unli_70 + a.unli_80 + a.unli_90) + 3 * (a.poss_0 + a.poss_1 + a.poss_10 + a.poss_20 + a.poss_30 + a.poss_40 + a.poss_50 + a.poss_60 + a.poss_70 + a.poss_80 + a.poss_90) + 4 * (a.like_0 + a.like_1 + a.like_10 + a.like_20 + a.like_30 + a.like_40 + a.like_50 + a.like_60 + a.like_70 + a.like_80 + a.like_90) + 5 * (a.cert_0 + a.cert_1 + a.cert_10 + a.cert_20 + a.cert_30 + a.cert_40 + a.cert_50 + a.cert_60 + a.cert_70 + a.cert_80 + a.cert_90))::numeric / 55::numeric AS score
                   FROM p_and_c.tier_2_continuity_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name::text AS company_name,
                    a."Completion_Date" AS completion_date,
                    a.respondent::text AS respondent,
                    'Risk Assessment'::text AS section,
                    'Business Interruption Risk'::text AS category,
                    'Active Shooter'::text AS type,
                    (1 * a.rare_0 + 2 * a.unli_0 + 3 * a.poss_0 + 4 * a.like_0 + 5 * a.cert_0)::numeric AS score
                   FROM p_and_c.tier_2_continuity_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name::text AS company_name,
                    a."Completion_Date" AS completion_date,
                    a.respondent::text AS respondent,
                    'Risk Assessment'::text AS section,
                    'Business Interruption Risk'::text AS category,
                    'Civil Disruption'::text AS type,
                    (1 * a.rare_1 + 2 * a.unli_1 + 3 * a.poss_1 + 4 * a.like_1 + 5 * a.cert_1)::numeric AS score
                   FROM p_and_c.tier_2_continuity_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name::text AS company_name,
                    a."Completion_Date" AS completion_date,
                    a.respondent::text AS respondent,
                    'Risk Assessment'::text AS section,
                    'Business Interruption Risk'::text AS category,
                    'Critical Equipment Failure'::text AS type,
                    (1 * a.rare_10 + 2 * a.unli_10 + 3 * a.poss_10 + 4 * a.like_10 + 5 * a.cert_10)::numeric AS score
                   FROM p_and_c.tier_2_continuity_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name::text AS company_name,
                    a."Completion_Date" AS completion_date,
                    a.respondent::text AS respondent,
                    'Risk Assessment'::text AS section,
                    'Business Interruption Risk'::text AS category,
                    'IT Disruption'::text AS type,
                    (1 * a.rare_20 + 2 * a.unli_20 + 3 * a.poss_20 + 4 * a.like_20 + 5 * a.cert_20)::numeric AS score
                   FROM p_and_c.tier_2_continuity_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name::text AS company_name,
                    a."Completion_Date" AS completion_date,
                    a.respondent::text AS respondent,
                    'Risk Assessment'::text AS section,
                    'Business Interruption Risk'::text AS category,
                    'Labor Strike'::text AS type,
                    (1 * a.rare_30 + 2 * a.unli_30 + 3 * a.poss_30 + 4 * a.like_30 + 5 * a.cert_30)::numeric AS score
                   FROM p_and_c.tier_2_continuity_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name::text AS company_name,
                    a."Completion_Date" AS completion_date,
                    a.respondent::text AS respondent,
                    'Risk Assessment'::text AS section,
                    'Business Interruption Risk'::text AS category,
                    'Loss of Key Customer'::text AS type,
                    (1 * a.rare_40 + 2 * a.unli_40 + 3 * a.poss_40 + 4 * a.like_40 + 5 * a.cert_40)::numeric AS score
                   FROM p_and_c.tier_2_continuity_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name::text AS company_name,
                    a."Completion_Date" AS completion_date,
                    a.respondent::text AS respondent,
                    'Risk Assessment'::text AS section,
                    'Business Interruption Risk'::text AS category,
                    'Loss of Utilities'::text AS type,
                    (1 * a.rare_50 + 2 * a.unli_50 + 3 * a.poss_50 + 4 * a.like_50 + 5 * a.cert_50)::numeric AS score
                   FROM p_and_c.tier_2_continuity_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name::text AS company_name,
                    a."Completion_Date" AS completion_date,
                    a.respondent::text AS respondent,
                    'Risk Assessment'::text AS section,
                    'Business Interruption Risk'::text AS category,
                    'Product Recall'::text AS type,
                    (1 * a.rare_60 + 2 * a.unli_60 + 3 * a.poss_60 + 4 * a.like_60 + 5 * a.cert_60)::numeric AS score
                   FROM p_and_c.tier_2_continuity_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name::text AS company_name,
                    a."Completion_Date" AS completion_date,
                    a.respondent::text AS respondent,
                    'Risk Assessment'::text AS section,
                    'Business Interruption Risk'::text AS category,
                    'Regulatory Disruption'::text AS type,
                    (1 * a.rare_70 + 2 * a.unli_70 + 3 * a.poss_70 + 4 * a.like_70 + 5 * a.cert_70)::numeric AS score
                   FROM p_and_c.tier_2_continuity_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name::text AS company_name,
                    a."Completion_Date" AS completion_date,
                    a.respondent::text AS respondent,
                    'Risk Assessment'::text AS section,
                    'Business Interruption Risk'::text AS category,
                    'Structure Fire'::text AS type,
                    (1 * a.rare_80 + 2 * a.unli_80 + 3 * a.poss_80 + 4 * a.like_80 + 5 * a.cert_80)::numeric AS score
                   FROM p_and_c.tier_2_continuity_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name::text AS company_name,
                    a."Completion_Date" AS completion_date,
                    a.respondent::text AS respondent,
                    'Risk Assessment'::text AS section,
                    'Business Interruption Risk'::text AS category,
                    'Supply Chain Disruption'::text AS type,
                    (1 * a.rare_90 + 2 * a.unli_90 + 3 * a.poss_90 + 4 * a.like_90 + 5 * a.cert_90)::numeric AS score
                   FROM p_and_c.tier_2_continuity_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name::text AS company_name,
                    a."Completion_Date" AS completion_date,
                    a.respondent::text AS respondent,
                    'Risk Assessment'::text AS section,
                    'Cyber Risk'::text AS category,
                    NULL::text AS type,
                    (4 * (a.yes_0 + a.part_0 + a.yes_1 + a.part_1 + a.unsure_2 + a.wk_2) + 3 * a.days_2 + 2 * a.day_2 + a.hr_2)::numeric / 12::numeric AS score
                   FROM p_and_c.tier_2_continuity_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name::text AS company_name,
                    a."Completion_Date" AS completion_date,
                    a.respondent::text AS respondent,
                    'Risk Assessment'::text AS section,
                    'Disaster Risk'::text AS category,
                    NULL::text AS type,
                    (4 * (a.yes_10 + a.part_10) + 3 * (a.high_11 + a.high_12 + a.high_13 + a.high_14 + a.high_15) + 2 * (a.med_11 + a.med_12 + a.med_13 + a.med_14 + a.med_15) + 1 * (a.low_11 + a.low_12 + a.low_13 + a.low_14 + a.low_15))::numeric / 19::numeric AS score
                   FROM p_and_c.tier_2_continuity_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name::text AS company_name,
                    a."Completion_Date" AS completion_date,
                    a.respondent::text AS respondent,
                    'Risk Assessment'::text AS section,
                    'Regulatory Risk'::text AS category,
                    NULL::text AS type,
                    (4 * (a.high_10 + a.high_20) + 3 * (a.mod_10 + a.mod_20) + 2 * (a.min_10 + a.min_20))::numeric / 8::numeric AS score
                   FROM p_and_c.tier_2_continuity_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name::text AS company_name,
                    a."Completion_Date" AS completion_date,
                    a.respondent::text AS respondent,
                    'Risk Assessment'::text AS section,
                    'Reputational Risk'::text AS category,
                    NULL::text AS type,
                    (4 * (a.yes_1_2 + a.part_1_2 + a.uns_1_2 + a.yes_2 + a.part_2 + a.yes_3 + a.part_3 + a.uns_3 + a.yes_4 + a.part_4 + a.cri_10 + a.cri_20 + a.cri_30 + a.cri_40 + a.cri_50) + 3 * (a.sig_10 + a.sig_20 + a.sig_30 + a.sig_40 + a.sig_50) + 2 * (a.mod_10 + a.mod_20 + a.mod_30 + a.mod_40 + a.mod_50) + 1 * (a.neg_10 + a.neg_20 + a.neg_30 + a.neg_40 + a.neg_50))::numeric / 36::numeric AS score
                   FROM p_and_c.tier_2_continuity_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name::text AS company_name,
                    a."Completion_Date" AS completion_date,
                    a.respondent::text AS respondent,
                    'Risk Assessment'::text AS section,
                    NULL::text AS category,
                    NULL::text AS type,
                    (5 * (a.cert_0 + a.cert_1 + a.cert_10 + a.cert_20 + a.cert_30 + a.cert_40 + a.cert_50 + a.cert_60 + a.cert_70 + a.cert_80 + a.cert_90) + 4 * (a.like_0 + a.like_1 + a.like_10 + a.like_20 + a.like_30 + a.like_40 + a.like_50 + a.like_60 + a.like_70 + a.like_80 + a.like_90 + a.yes_0 + a.part_0 + a.yes_1 + a.part_1 + a.wk_2 + a.unsure_2 + a.yes_10 + a.part_10 + a.high_10 + a.high_20 + a.yes_1_2 + a.part_1_2 + a.uns_1_2 + a.yes_2 + a.part_2 + a.yes_3 + a.part_3 + a.uns_3 + a.yes_4 + a.part_4 + a.cri_10 + a.cri_20 + a.cri_30 + a.cri_40 + a.cri_50) + 3 * (a.high_11 + a.poss_0 + a.poss_1 + a.poss_10 + a.poss_20 + a.poss_30 + a.poss_40 + a.poss_50 + a.poss_60 + a.poss_70 + a.poss_80 + a.poss_90 + a.days_2 + a.high_12 + a.high_13 + a.high_14 + a.high_15 + a.mod_10 + a.mod_20 + a.sig_10 + a.sig_20 + a.sig_30 + a.sig_40 + a.sig_50) + 2 * (a.med_11 + a.unli_0 + a.unli_1 + a.unli_10 + a.unli_20 + a.unli_30 + a.unli_40 + a.unli_50 + a.unli_60 + a.unli_70 + a.unli_80 + a.unli_90 + a.day_2 + a.med_12 + a.med_13 + a.med_14 + a.med_15 + a.min_10 + a.min_20 + a.mod_10 + a.mod_20 + a.mod_30 + a.mod_40 + a.mod_50) + 1 * (a.low_11 + a.rare_0 + a.rare_1 + a.rare_10 + a.rare_20 + a.rare_30 + a.rare_40 + a.rare_50 + a.rare_60 + a.rare_70 + a.rare_80 + a.rare_90 + a.hr_2 + a.low_12 + a.low_13 + a.low_14 + a.low_15 + a.neg_10 + a.neg_20 + a.neg_30 + a.neg_40 + a.neg_50))::numeric / 130::numeric AS score
                   FROM p_and_c.tier_2_continuity_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name::text AS company_name,
                    a."Completion_Date" AS completion_date,
                    a.respondent::text AS respondent,
                    'Risk Control'::text AS section,
                    'Administrative Controls'::text AS category,
                    NULL::text AS type,
                    (4 * (a.yes_10_1 + a.yes_20 + a.full_30 + a.yes_50 + a.yes_60 + a.yes_70 + a.yes_80 + a.yes_text) + 2 * a.fun_30 + (a.part_10_1 + a.part_20 + a.walk_30 + a.tab_30 + a.evac_40 + a.equip_40 + a.call_40 + a.part_50 + a.part_60 + a.part_70 + a.part_80 + a.part_text))::numeric / 35::numeric AS score
                   FROM p_and_c.tier_2_continuity_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name::text AS company_name,
                    a."Completion_Date" AS completion_date,
                    a.respondent::text AS respondent,
                    'Risk Control'::text AS section,
                    'Disaster Recovery'::text AS category,
                    NULL::text AS type,
                    (4 * (a.yes_cont + a.yes_1_4 + a.yes_2_4 + a.yes_3_4 + a.yes_4_4 + a.yes_5 + a.yes_6 + a.yes_7) + 2 * (a.yes_8 + a.yes_9 + a.und25_10 + a.over25_10) + 1 * (a.part_cont + a.part_1_4 + a.part_2_4 + a.part_3_4 + a.part_4_4 + a.part_5 + a.part_6 + a.part_7 + a.part_8 + a.on_10 + a.und5_10))::numeric / (30 + 2 * (a.yes_7 + a.yes_9) + 4 * (a.yes_10_1 + a.part_10_1))::numeric AS score
                   FROM p_and_c.tier_2_continuity_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name::text AS company_name,
                    a."Completion_Date" AS completion_date,
                    a.respondent::text AS respondent,
                    'Risk Control'::text AS section,
                    'Business Impact Analysis'::text AS category,
                    NULL::text AS type,
                    (4 * (a.yes_10_2 + a.yes_20_2 + a.yes_30) + 1 * (a.part_10_2 + a.part_20_2 + a.part_30))::numeric / 12::numeric AS score
                   FROM p_and_c.tier_2_continuity_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name::text AS company_name,
                    a."Completion_Date" AS completion_date,
                    a.respondent::text AS respondent,
                    'Risk Control'::text AS section,
                    'CyberSecurity'::text AS category,
                    NULL::text AS type,
                    (4 * (a.yes_1_3 + a.yes_2_3 + a.yes_3_3 + a.yes_4_3) + 1 * (a.part_1_3 + a.part_2_3 + a.part_3_3 + a.part_4_3))::numeric / 16::numeric AS score
                   FROM p_and_c.tier_2_continuity_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name::text AS company_name,
                    a."Completion_Date" AS completion_date,
                    a.respondent::text AS respondent,
                    'Risk Control'::text AS section,
                    'Crisis Management'::text AS category,
                    NULL::text AS type,
                    ((4 * (a.yes_0_5 + a.yes_3_5 + a.yes_4_5 + a.yes_5_5) + 1 * (a.part_0_5 + a.part_1_5 + a.part_3_5 + a.part_4_5 + a.part_5_5))::numeric + 0.5 * (a.fund_2 + a.pr_2 + a.chain_2 + a.stake_2)::numeric) / (16 + 4 * a.yes_0_5)::numeric AS score
                   FROM p_and_c.tier_2_continuity_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name::text AS company_name,
                    a."Completion_Date" AS completion_date,
                    a.respondent::text AS respondent,
                    'Risk Control'::text AS section,
                    'Active Shooter Preparedness'::text AS category,
                    NULL::text AS type,
                    (4 * (a.yes_1_6 + a.yes_2_6 + a.yes_3_6) + 1 * (a.part_1_6 + a.part_2_6 + a.part_3_6))::numeric / 12::numeric
                   FROM p_and_c.tier_2_continuity_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name::text AS company_name,
                    a."Completion_Date" AS completion_date,
                    a.respondent::text AS respondent,
                    'Risk Control'::text AS section,
                    NULL::text AS category,
                    NULL::text AS type,
                    ((4 * (a.yes_1_6 + a.yes_2_6 + a.yes_3_6 + a.yes_text + a.yes_cont + a.yes_10_1 + a.yes_20 + a.full_30 + a.yes_50 + a.yes_60 + a.yes_70 + a.yes_80 + a.yes_1_4 + a.yes_2_4 + a.yes_3_4 + a.yes_4_4 + a.yes_5 + a.yes_6 + a.yes_7 + a.yes_10_2 + a.yes_20_2 + a.yes_30 + a.yes_1_3 + a.yes_2_3 + a.yes_3_3 + a.yes_4_3 + a.yes_0_5 + a.yes_3_5 + a.yes_4_5 + a.yes_5_5) + 2 * (a.fun_30 + a.yes_8 + a.yes_9 + a.und25_10 + a.over25_10) + 1 * (a.part_1_6 + a.part_2_6 + a.part_3_6 + a.part_text + a.part_cont + a.part_10_1 + a.part_20 + a.walk_30 + a.tab_30 + a.evac_40 + a.equip_40 + a.call_40 + a.part_50 + a.part_60 + a.part_70 + a.part_80 + a.part_1_4 + a.part_2_4 + a.part_3_4 + a.part_4_4 + a.part_5 + a.part_6 + a.part_7 + a.part_8 + a.on_10 + a.und5_10 + a.part_10_2 + a.part_20_2 + a.part_30 + a.part_1_3 + a.part_2_3 + a.part_3_3 + a.part_4_3 + a.part_0_5 + a.part_1_5 + a.part_3_5 + a.part_4_5 + a.part_5_5))::numeric + 0.5 * (a.fund_2 + a.pr_2 + a.chain_2 + a.stake_2)::numeric) / (121 + 2 * (a.yes_7 + a.yes_9) + 4 * (a.yes_0_5 + a.yes_cont + a.part_cont))::numeric AS score
                   FROM p_and_c.tier_2_continuity_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name::text AS company_name,
                    a."Completion_Date" AS completion_date,
                    a.respondent::text AS respondent,
                    'Overall'::text AS section,
                    NULL::text AS category,
                    NULL::text AS type,
                    0.6 * (1::numeric - (5 * (a.cert_0 + a.cert_1 + a.cert_10 + a.cert_20 + a.cert_30 + a.cert_40 + a.cert_50 + a.cert_60 + a.cert_70 + a.cert_80 + a.cert_90) + 4 * (a.like_0 + a.like_1 + a.like_10 + a.like_20 + a.like_30 + a.like_40 + a.like_50 + a.like_60 + a.like_70 + a.like_80 + a.like_90 + a.yes_0 + a.part_0 + a.yes_1 + a.part_1 + a.wk_2 + a.unsure_2 + a.yes_10 + a.part_10 + a.high_10 + a.high_20 + a.yes_1_2 + a.part_1_2 + a.uns_1_2 + a.yes_2 + a.part_2 + a.yes_3 + a.part_3 + a.uns_3 + a.yes_4 + a.part_4 + a.cri_10 + a.cri_20 + a.cri_30 + a.cri_40 + a.cri_50) + 3 * (a.high_11 + a.poss_0 + a.poss_1 + a.poss_10 + a.poss_20 + a.poss_30 + a.poss_40 + a.poss_50 + a.poss_60 + a.poss_70 + a.poss_80 + a.poss_90 + a.days_2 + a.high_12 + a.high_13 + a.high_14 + a.high_15 + a.mod_10 + a.mod_20 + a.sig_10 + a.sig_20 + a.sig_30 + a.sig_40 + a.sig_50) + 2 * (a.med_11 + a.unli_0 + a.unli_1 + a.unli_10 + a.unli_20 + a.unli_30 + a.unli_40 + a.unli_50 + a.unli_60 + a.unli_70 + a.unli_80 + a.unli_90 + a.day_2 + a.med_12 + a.med_13 + a.med_14 + a.med_15 + a.min_10 + a.min_20 + a.mod_10 + a.mod_20 + a.mod_30 + a.mod_40 + a.mod_50) + 1 * (a.low_11 + a.rare_0 + a.rare_1 + a.rare_10 + a.rare_20 + a.rare_30 + a.rare_40 + a.rare_50 + a.rare_60 + a.rare_70 + a.rare_80 + a.rare_90 + a.hr_2 + a.low_12 + a.low_13 + a.low_14 + a.low_15 + a.neg_10 + a.neg_20 + a.neg_30 + a.neg_40 + a.neg_50))::numeric / 130::numeric) + 0.4 * (((4 * (a.yes_1_6 + a.yes_2_6 + a.yes_3_6 + a.yes_text + a.yes_cont + a.yes_10_1 + a.yes_20 + a.full_30 + a.yes_50 + a.yes_60 + a.yes_70 + a.yes_80 + a.yes_1_4 + a.yes_2_4 + a.yes_3_4 + a.yes_4_4 + a.yes_5 + a.yes_6 + a.yes_7 + a.yes_10_2 + a.yes_20_2 + a.yes_30 + a.yes_1_3 + a.yes_2_3 + a.yes_3_3 + a.yes_4_3 + a.yes_0_5 + a.yes_3_5 + a.yes_4_5 + a.yes_5_5) + 2 * (a.fun_30 + a.yes_8 + a.yes_9 + a.und25_10 + a.over25_10) + 1 * (a.part_1_6 + a.part_2_6 + a.part_3_6 + a.part_text + a.part_cont + a.part_10_1 + a.part_20 + a.walk_30 + a.tab_30 + a.evac_40 + a.equip_40 + a.call_40 + a.part_50 + a.part_60 + a.part_70 + a.part_80 + a.part_1_4 + a.part_2_4 + a.part_3_4 + a.part_4_4 + a.part_5 + a.part_6 + a.part_7 + a.part_8 + a.on_10 + a.und5_10 + a.part_10_2 + a.part_20_2 + a.part_30 + a.part_1_3 + a.part_2_3 + a.part_3_3 + a.part_4_3 + a.part_0_5 + a.part_1_5 + a.part_3_5 + a.part_4_5 + a.part_5_5))::numeric + 0.5 * (a.fund_2 + a.pr_2 + a.chain_2 + a.stake_2)::numeric) / (121 + 2 * (a.yes_7 + a.yes_9) + 4 * (a.yes_0_5 + a.yes_cont + a.part_cont))::numeric) AS score
                   FROM p_and_c.tier_2_continuity_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text) z) y
     LEFT JOIN p_and_c.assessment_text x ON COALESCE(y.category, y.section) = x.category::text AND x.result::text = y.result
  WHERE x.assessment::text = 'tier_2_continuity'::text;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.tier_2_continuity_results OWNER TO mj_admin;
GO

Grant select on table p_and_c.tier_2_continuity_results to rl_pc_data_analyst;
GO

Grant select on table p_and_c.tier_2_continuity_results to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.tier_2_continuity_results to rpauser;
GO
GRANT SELECT ON p_and_c.tier_2_continuity_results to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.tier_2_continuity_results to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.tier_2_continuity_results to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.tier_2_continuity_results to rl_p_and_c_d;
GO