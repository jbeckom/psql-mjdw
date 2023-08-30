CREATE OR REPLACE VIEW p_and_c.tier_2_safety_results
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
                    WHEN z.section = 'Exposure'::text THEN
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
                        WHEN z.score < 0.5 THEN 'Developmental'::text
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
                    a.company_name,
                    a."Completion_Date"::date AS completion_date,
                    a.respondent,
                    'Exposure'::text AS section,
                    'Workforce Dynamics'::text AS category,
                    NULL::text AS type,
                    ((2 * (a.ft_ml + a.ft_l + a.pt_l + a.temp_l + a.seasonal_l))::numeric + 1.5 * (a.ft_m + a.pt_ml + a.temp_m + a.seasonal_m)::numeric + (1 * (a.ft_sm + a.pt_m + a.temp_s + a.seasonal_s + a.less_25_50 + a.unk_50 + a.less8_60 + a.unk_60 + a.less10_70 + a.more10_70 + a.unk_70))::numeric + 0.5 * (a.ft_s + a.pt_s + a.less_50_50 + a.less15_60 + a."2_80")::numeric -
                        CASE
                            WHEN a.ft = 0 THEN 0.5
                            ELSE 0::numeric
                        END -
                        CASE
                            WHEN a.pt = 0 THEN 0.5
                            ELSE 0::numeric
                        END -
                        CASE
                            WHEN a.temp = 0 THEN 1
                            ELSE 0
                        END::numeric -
                        CASE
                            WHEN a.seasonal = 0 THEN 1
                            ELSE 0
                        END::numeric) / (4 + 2 * (a.ft + a.pt + a.temp + a.seasonal))::numeric AS score
                   FROM p_and_c.tier_2_safety_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name,
                    a."Completion_Date"::date AS completion_date,
                    a.respondent,
                    'Exposure'::text AS section,
                    'Workplace Hazards'::text AS category,
                    'Confined Space'::text AS type,
                    4 * a.cat_2 + 3 * a.high_2 + 2 * a.mod_2 + 1 * a.neg_2 AS score
                   FROM p_and_c.tier_2_safety_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name,
                    a."Completion_Date"::date AS completion_date,
                    a.respondent,
                    'Exposure'::text AS section,
                    'Workplace Hazards'::text AS category,
                    'Driving (Daily)'::text AS type,
                    4 * a.cat_3 + 3 * a.high_3 + 2 * a.mod_3 + 1 * a.neg_3 AS score
                   FROM p_and_c.tier_2_safety_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name,
                    a."Completion_Date"::date AS completion_date,
                    a.respondent,
                    'Exposure'::text AS section,
                    'Workplace Hazards'::text AS category,
                    'Electrical Work'::text AS type,
                    4 * a.cat_4 + 3 * a.high_4 + 2 * a.mod_4 + 1 * a.neg_4 AS score
                   FROM p_and_c.tier_2_safety_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name,
                    a."Completion_Date"::date AS completion_date,
                    a.respondent,
                    'Exposure'::text AS section,
                    'Workplace Hazards'::text AS category,
                    'Ergonomics/Repetitive Motion'::text AS type,
                    4 * a.cat_5 + 3 * a.high_5 + 2 * a.mod_5 + 1 * a.neg_5 AS score
                   FROM p_and_c.tier_2_safety_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name,
                    a."Completion_Date"::date AS completion_date,
                    a.respondent,
                    'Exposure'::text AS section,
                    'Workplace Hazards'::text AS category,
                    'Fall from Heights'::text AS type,
                    4 * a.cat_6 + 3 * a.high_6 + 2 * a.mod_6 + 1 * a.neg_6 AS score
                   FROM p_and_c.tier_2_safety_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name,
                    a."Completion_Date"::date AS completion_date,
                    a.respondent,
                    'Exposure'::text AS section,
                    'Workplace Hazards'::text AS category,
                    'Fork Truck'::text AS type,
                    4 * a.cat_7 + 3 * a.high_7 + 2 * a.mod_7 + 1 * a.neg_7 AS score
                   FROM p_and_c.tier_2_safety_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name,
                    a."Completion_Date"::date AS completion_date,
                    a.respondent,
                    'Exposure'::text AS section,
                    'Workplace Hazards'::text AS category,
                    'Hazardous Chemicals'::text AS type,
                    4 * a.cat_8 + 3 * a.high_8 + 2 * a.mod_8 + 1 * a.neg_8 AS score
                   FROM p_and_c.tier_2_safety_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name,
                    a."Completion_Date"::date AS completion_date,
                    a.respondent,
                    'Exposure'::text AS section,
                    'Workplace Hazards'::text AS category,
                    'Heavy Equipment Operation'::text AS type,
                    4 * a.cat_9 + 3 * a.high_9 + 2 * a.mod_9 + 1 * a.neg_9 AS score
                   FROM p_and_c.tier_2_safety_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name,
                    a."Completion_Date"::date AS completion_date,
                    a.respondent,
                    'Exposure'::text AS section,
                    'Workplace Hazards'::text AS category,
                    'Machine Guarding'::text AS type,
                    4 * a.cat_10 + 3 * a.high_10 + 2 * a.mod_10 + 1 * a.neg_10 AS score
                   FROM p_and_c.tier_2_safety_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name,
                    a."Completion_Date"::date AS completion_date,
                    a.respondent,
                    'Exposure'::text AS section,
                    'Workplace Hazards'::text AS category,
                    'Manual Material Handling/Lifting'::text AS type,
                    4 * a.cat_11 + 3 * a.high_11 + 2 * a.mod_11 + 1 * a.neg_11 AS score
                   FROM p_and_c.tier_2_safety_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name,
                    a."Completion_Date"::date AS completion_date,
                    a.respondent,
                    'Exposure'::text AS section,
                    'Workplace Hazards'::text AS category,
                    'Noise'::text AS type,
                    4 * a.cat_12 + 3 * a.high_12 + 2 * a.mod_12 + 1 * a.neg_12 AS score
                   FROM p_and_c.tier_2_safety_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name,
                    a."Completion_Date"::date AS completion_date,
                    a.respondent,
                    'Exposure'::text AS section,
                    'Workplace Hazards'::text AS category,
                    'Welding'::text AS type,
                    4 * a.cat_13 + 3 * a.high_13 + 2 * a.mod_13 + 1 * a.neg_13 AS score
                   FROM p_and_c.tier_2_safety_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name,
                    a."Completion_Date"::date AS completion_date,
                    a.respondent,
                    'Exposure'::text AS section,
                    'Workplace Hazards'::text AS category,
                    NULL::text AS type,
                    (5 * a.cat_2 + 3 * a.high_2 + 2 * a.mod_2 + 1 * a.neg_2 + 5 * a.cat_3 + 3 * a.high_3 + 2 * a.mod_3 + 1 * a.neg_3 + 5 * a.cat_4 + 3 * a.high_4 + 2 * a.mod_4 + 1 * a.neg_4 + 5 * a.cat_5 + 3 * a.high_5 + 2 * a.mod_5 + 1 * a.neg_5 + 5 * a.cat_6 + 3 * a.high_6 + 2 * a.mod_6 + 1 * a.neg_6 + 5 * a.cat_7 + 3 * a.high_7 + 2 * a.mod_7 + 1 * a.neg_7 + 5 * a.cat_8 + 3 * a.high_8 + 2 * a.mod_8 + 1 * a.neg_8 + 5 * a.cat_9 + 3 * a.high_9 + 2 * a.mod_9 + 1 * a.neg_9 + 5 * a.cat_10 + 3 * a.high_10 + 2 * a.mod_10 + 1 * a.neg_10 + 5 * a.cat_11 + 3 * a.high_11 + 2 * a.mod_11 + 1 * a.neg_11 + 5 * a.cat_12 + 3 * a.high_12 + 2 * a.mod_12 + 1 * a.neg_12 + 5 * a.cat_13 + 3 * a.high_13 + 2 * a.mod_13 + 1 * a.neg_13)::numeric / (36 + 2 * (a.cat_2 + a.cat_3 + a.cat_4 + a.cat_5 + a.cat_6 + a.cat_7 + a.cat_8 + a.cat_9 + a.cat_10 + a.cat_11 + a.cat_12 + a.cat_13))::numeric AS score
                   FROM p_and_c.tier_2_safety_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name,
                    a."Completion_Date"::date AS completion_date,
                    a.respondent,
                    'Safety Management'::text AS section,
                    'Administrative Controls'::text AS category,
                    NULL::text AS type,
                    ((4 * (a.saf_10 + a.less10_30 + a.more10_30 + a.more10_40 + a.more75_50 + a.yes_130 + a.yes_190 + a.yes_200 + a.yes_210) + 3 * (a.less5_30 + a.less10_40 + a.yes_60 + a.yes_80 + a.yes_100 + a.yes_140 + a.yes_170 + a.yes_182))::numeric + 2.5 * a.less75_50::numeric + (2 * (a.rm_10 + a.less5_40 + a.yes_151))::numeric + (1 * (a.hr_10 + a.part_60 + a.part_80 + a.part_100 + a.part_130 + a.part_140 + a.yes_150 + a.part_150 + a.part_151 + a.part_170 + a.part_190 + a.part_200 + a.part_210 + a.part_182))::numeric + 0.5 * (a.post_con_180 + a.reas_180 + a.con_110 + a.driv_110 + a.elec_110 + a.fall_110 + a.ghs_110 + a.equip_110 + a.ladd_110 + a.hot_110 + a.loto_110 + a.mach_110 + a.ppe_110 + a.other_110 + a.app_160 + a.back_160 + a.drug_160 + a.int_160 + a.phys_160 + a.mvr_160 + a.ann_180 + a.post_180 + a.pre_180 + a.rand_180)::numeric) / (61 + 3 * a.yes_170 + 3 * a.part_170 + 1 * a.yes_140 + 1 * a.part_140)::numeric AS score
                   FROM p_and_c.tier_2_safety_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name,
                    a."Completion_Date"::date AS completion_date,
                    a.respondent,
                    'Safety Management'::text AS section,
                    'Employee Training'::text AS category,
                    NULL::text AS type,
                    ((3 * a.yes_20 + 1 * (a.part_20 + a.at_30))::numeric + 0.5 * (a.day_30 + a.wk_30 + a.mon_30 + a.qtly_30 + a.ann_30 + a.post_30)::numeric) / (3 + 4 * a.yes_20 + 4 * a.part_20)::numeric AS score
                   FROM p_and_c.tier_2_safety_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name,
                    a."Completion_Date"::date AS completion_date,
                    a.respondent,
                    'Safety Management'::text AS section,
                    'Claims Management'::text AS category,
                    NULL::text AS type,
                    ((3 * a.yes_2 + 2 * a.yes_0 + 1 * (a.part_0 + a.rev_1 + a.pmp_1 + a.root_1 + a.spec_1 + a.part_2))::numeric + 0.5 * (a.at_3 + a.post_3 + a.rtw_3 + a.exec_3 + a.light_3 + a.ack_3 + a.train_3 + a.pol_3)::numeric) / (9 + 4 * a.yes_2 + 4 * a.part_2)::numeric AS score
                   FROM p_and_c.tier_2_safety_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name,
                    a."Completion_Date"::date AS completion_date,
                    a.respondent,
                    'Safety Management'::text AS section,
                    'Active Shooter Preparedness'::text AS category,
                    NULL::text AS type,
                    (4 * (a.yes_1_4 + a.yes_2_4 + a.yes_3_4) + 1 * (a.part_1_4 + a.part_2_4 + a.part_3_4))::numeric / 12::numeric
                   FROM p_and_c.tier_2_safety_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name,
                    a."Completion_Date"::date AS completion_date,
                    a.respondent,
                    'Exposure'::text AS section,
                    NULL::text AS category,
                    NULL::text AS type,
                    (5 * a.cat_2 + 3 * a.high_2 + 2 * a.mod_2 + 1 * a.neg_2 + 5 * a.cat_3 + 3 * a.high_3 + 2 * a.mod_3 + 1 * a.neg_3 + 5 * a.cat_4 + 3 * a.high_4 + 2 * a.mod_4 + 1 * a.neg_4 + 5 * a.cat_5 + 3 * a.high_5 + 2 * a.mod_5 + 1 * a.neg_5 + 5 * a.cat_6 + 3 * a.high_6 + 2 * a.mod_6 + 1 * a.neg_6 + 5 * a.cat_7 + 3 * a.high_7 + 2 * a.mod_7 + 1 * a.neg_7 + 5 * a.cat_8 + 3 * a.high_8 + 2 * a.mod_8 + 1 * a.neg_8 + 5 * a.cat_9 + 3 * a.high_9 + 2 * a.mod_9 + 1 * a.neg_9 + 5 * a.cat_10 + 3 * a.high_10 + 2 * a.mod_10 + 1 * a.neg_10 + 5 * a.cat_11 + 3 * a.high_11 + 2 * a.mod_11 + 1 * a.neg_11 + 5 * a.cat_12 + 3 * a.high_12 + 2 * a.mod_12 + 1 * a.neg_12 + 5 * a.cat_13 + 3 * a.high_13 + 2 * a.mod_13 + 1 * a.neg_13)::numeric / (36 + 2 * (a.cat_2 + a.cat_3 + a.cat_4 + a.cat_5 + a.cat_6 + a.cat_7 + a.cat_8 + a.cat_9 + a.cat_10 + a.cat_11 + a.cat_12 + a.cat_13))::numeric * 0.8 + ((2 * (a.ft_ml + a.ft_l + a.pt_l + a.temp_l + a.seasonal_l))::numeric + 1.5 * (a.ft_m + a.pt_ml + a.temp_m + a.seasonal_m)::numeric + (1 * (a.ft_sm + a.pt_m + a.temp_s + a.seasonal_s + a.less_25_50 + a.unk_50 + a.less8_60 + a.unk_60 + a.less10_70 + a.more10_70 + a.unk_70))::numeric + 0.5 * (a.ft_s + a.pt_s + a.less_50_50 + a.less15_60 + a."2_80")::numeric -
                        CASE
                            WHEN a.ft = 0 THEN 0.5
                            ELSE 0::numeric
                        END -
                        CASE
                            WHEN a.pt = 0 THEN 0.5
                            ELSE 0::numeric
                        END -
                        CASE
                            WHEN a.temp = 0 THEN 1
                            ELSE 0
                        END::numeric -
                        CASE
                            WHEN a.seasonal = 0 THEN 1
                            ELSE 0
                        END::numeric) / (4 + 2 * (a.ft + a.pt + a.temp + a.seasonal))::numeric * 0.2 AS score
                   FROM p_and_c.tier_2_safety_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name,
                    a."Completion_Date"::date AS completion_date,
                    a.respondent,
                    'Safety Management'::text AS section,
                    NULL::text AS category,
                    NULL::text AS type,
                    ((4 * (a.saf_10 + a.less10_30 + a.more10_30 + a.more10_40 + a.more75_50 + a.yes_130 + a.yes_190 + a.yes_200 + a.yes_210) + 3 * (a.less5_30 + a.less10_40 + a.yes_60 + a.yes_80 + a.yes_100 + a.yes_140 + a.yes_170 + a.yes_182))::numeric + 2.5 * a.less75_50::numeric + (2 * (a.rm_10 + a.less5_40 + a.yes_151))::numeric + (1 * (a.hr_10 + a.part_60 + a.part_80 + a.part_100 + a.part_130 + a.part_140 + a.yes_150 + a.part_150 + a.part_151 + a.part_170 + a.part_190 + a.part_200 + a.part_210 + a.part_182))::numeric + 0.5 * (a.post_con_180 + a.reas_180 + a.con_110 + a.driv_110 + a.elec_110 + a.fall_110 + a.ghs_110 + a.equip_110 + a.ladd_110 + a.hot_110 + a.loto_110 + a.mach_110 + a.ppe_110 + a.other_110 + a.app_160 + a.back_160 + a.drug_160 + a.int_160 + a.phys_160 + a.mvr_160 + a.ann_180 + a.post_180 + a.pre_180 + a.rand_180)::numeric) / (61 + 3 * a.yes_170 + 3 * a.part_170 + 1 * a.yes_140 + 1 * a.part_140)::numeric * 0.5 + ((3 * a.yes_20 + 1 * (a.part_20 + a.at_30))::numeric + 0.5 * (a.day_30 + a.wk_30 + a.mon_30 + a.qtly_30 + a.ann_30 + a.post_30)::numeric) / (3 + 4 * a.yes_20 + 4 * a.part_20)::numeric * 0.30 + ((3 * a.yes_2 + 2 * a.yes_0 + 1 * (a.part_0 + a.rev_1 + a.pmp_1 + a.root_1 + a.spec_1 + a.part_2))::numeric + 0.5 * (a.at_3 + a.post_3 + a.rtw_3 + a.exec_3 + a.light_3 + a.ack_3 + a.train_3 + a.pol_3)::numeric) / (9 + 4 * a.yes_2 + 4 * a.part_2)::numeric * 0.15 + (4 * (a.yes_1_4 + a.yes_2_4 + a.yes_3_4) + 1 * (a.part_1_4 + a.part_2_4 + a.part_3_4))::numeric / 12::numeric * 0.05 AS score
                   FROM p_and_c.tier_2_safety_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name,
                    a."Completion_Date"::date AS completion_date,
                    a.respondent,
                    'Overall'::text AS section,
                    NULL::text AS category,
                    NULL::text AS type,
                    (1::numeric - ((5 * a.cat_2 + 3 * a.high_2 + 2 * a.mod_2 + 1 * a.neg_2 + 5 * a.cat_3 + 3 * a.high_3 + 2 * a.mod_3 + 1 * a.neg_3 + 5 * a.cat_4 + 3 * a.high_4 + 2 * a.mod_4 + 1 * a.neg_4 + 5 * a.cat_5 + 3 * a.high_5 + 2 * a.mod_5 + 1 * a.neg_5 + 5 * a.cat_6 + 3 * a.high_6 + 2 * a.mod_6 + 1 * a.neg_6 + 5 * a.cat_7 + 3 * a.high_7 + 2 * a.mod_7 + 1 * a.neg_7 + 5 * a.cat_8 + 3 * a.high_8 + 2 * a.mod_8 + 1 * a.neg_8 + 5 * a.cat_9 + 3 * a.high_9 + 2 * a.mod_9 + 1 * a.neg_9 + 5 * a.cat_10 + 3 * a.high_10 + 2 * a.mod_10 + 1 * a.neg_10 + 5 * a.cat_11 + 3 * a.high_11 + 2 * a.mod_11 + 1 * a.neg_11 + 5 * a.cat_12 + 3 * a.high_12 + 2 * a.mod_12 + 1 * a.neg_12 + 5 * a.cat_13 + 3 * a.high_13 + 2 * a.mod_13 + 1 * a.neg_13)::numeric / (36 + 2 * (a.cat_2 + a.cat_3 + a.cat_4 + a.cat_5 + a.cat_6 + a.cat_7 + a.cat_8 + a.cat_9 + a.cat_10 + a.cat_11 + a.cat_12 + a.cat_13))::numeric * 0.8 + ((2 * (a.ft_ml + a.ft_l + a.pt_l + a.temp_l + a.seasonal_l))::numeric + 1.5 * (a.ft_m + a.pt_ml + a.temp_m + a.seasonal_m)::numeric + (1 * (a.ft_sm + a.pt_m + a.temp_s + a.seasonal_s + a.less_25_50 + a.unk_50 + a.less8_60 + a.unk_60 + a.less10_70 + a.more10_70 + a.unk_70))::numeric + 0.5 * (a.ft_s + a.pt_s + a.less_50_50 + a.less15_60 + a."2_80")::numeric -
                        CASE
                            WHEN a.ft = 0 THEN 0.5
                            ELSE 0::numeric
                        END -
                        CASE
                            WHEN a.pt = 0 THEN 0.5
                            ELSE 0::numeric
                        END -
                        CASE
                            WHEN a.temp = 0 THEN 1
                            ELSE 0
                        END::numeric -
                        CASE
                            WHEN a.seasonal = 0 THEN 1
                            ELSE 0
                        END::numeric) / (4 + 2 * (a.ft + a.pt + a.temp + a.seasonal))::numeric * 0.2)) * 0.6 + (((4 * (a.saf_10 + a.less10_30 + a.more10_30 + a.more10_40 + a.more75_50 + a.yes_130 + a.yes_190 + a.yes_200 + a.yes_210) + 3 * (a.less5_30 + a.less10_40 + a.yes_60 + a.yes_80 + a.yes_100 + a.yes_140 + a.yes_170 + a.yes_182))::numeric + 2.5 * a.less75_50::numeric + (2 * (a.rm_10 + a.less5_40 + a.yes_151))::numeric + (1 * (a.hr_10 + a.part_60 + a.part_80 + a.part_100 + a.part_130 + a.part_140 + a.yes_150 + a.part_150 + a.part_151 + a.part_170 + a.part_190 + a.part_200 + a.part_210 + a.part_182))::numeric + 0.5 * (a.post_con_180 + a.reas_180 + a.con_110 + a.driv_110 + a.elec_110 + a.fall_110 + a.ghs_110 + a.equip_110 + a.ladd_110 + a.hot_110 + a.loto_110 + a.mach_110 + a.ppe_110 + a.other_110 + a.app_160 + a.back_160 + a.drug_160 + a.int_160 + a.phys_160 + a.mvr_160 + a.ann_180 + a.post_180 + a.pre_180 + a.rand_180)::numeric) / (61 + 3 * a.yes_170 + 3 * a.part_170 + 1 * a.yes_140 + 1 * a.part_140)::numeric * 0.5 + ((3 * a.yes_20 + 1 * (a.part_20 + a.at_30))::numeric + 0.5 * (a.day_30 + a.wk_30 + a.mon_30 + a.qtly_30 + a.ann_30 + a.post_30)::numeric) / (3 + 4 * a.yes_20 + 4 * a.part_20)::numeric * 0.30 + ((3 * a.yes_2 + 2 * a.yes_0 + 1 * (a.part_0 + a.rev_1 + a.pmp_1 + a.root_1 + a.spec_1 + a.part_2))::numeric + 0.5 * (a.at_3 + a.post_3 + a.rtw_3 + a.exec_3 + a.light_3 + a.ack_3 + a.train_3 + a.pol_3)::numeric) / (9 + 4 * a.yes_2 + 4 * a.part_2)::numeric * 0.15 + (4 * (a.yes_1_4 + a.yes_2_4 + a.yes_3_4) + 1 * (a.part_1_4 + a.part_2_4 + a.part_3_4))::numeric / 12::numeric * 0.05) * 0.4
                   FROM p_and_c.tier_2_safety_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text) z) y
     LEFT JOIN p_and_c.assessment_text x ON COALESCE(y.category, y.section) = x.category::text AND x.result::text = y.result
  WHERE x.assessment::text = 'tier_2_safety'::text;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.tier_2_safety_results OWNER TO mj_admin;
GO

Grant select on table p_and_c.tier_2_safety_results to rl_pc_data_analyst;
GO

Grant select on table p_and_c.tier_2_safety_results to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.tier_2_safety_results to rpauser;
GO
GRANT SELECT ON p_and_c.tier_2_safety_results to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.tier_2_safety_results to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.tier_2_safety_results to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.tier_2_safety_results to rl_p_and_c_d;
GO