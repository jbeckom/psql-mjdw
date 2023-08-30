CREATE OR REPLACE VIEW p_and_c.tier_2_cyber_results
AS SELECT y.client_id,
    y.company_name AS "Company Name",
    y.completion_date,
    y.respondent,
    y.section,
    y.category AS "Category",
    y.type,
    y.score AS "Score",
    y.result AS "Result",
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
                    WHEN z.section = 'Exposures'::text THEN
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
                    a.s1_ss1_q10_a1_id258160::text AS company_name,
                    a.completion_date,
                    a.s1_ss1_q11_a1_id258161::text AS respondent,
                    'Exposures'::text AS section,
                    'Systems Exposure'::text AS category,
                    'Critical Systems'::text AS type,
                    (4 * a.no_10 + 4 * a.part_10 + 4 * a.uns_10 + 1 * a.hour_20 + 2 * a.one_20 + 3 * a.two_20 + 4 * a.week_20 + 4 * a.uns_20)::numeric / 8::numeric AS score
                   FROM p_and_c.tier_2_cyber_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.s1_ss1_q10_a1_id258160::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.s1_ss1_q10_a1_id258160::text AS company_name,
                    a.completion_date,
                    a.s1_ss1_q11_a1_id258161::text AS respondent,
                    'Exposures'::text AS section,
                    'Systems Exposure'::text AS category,
                    'Systems Access'::text AS type,
                    (4 * a.yes_10_2 + 4 * a.part_10_2 + 4 * a.uns_10_2 + 4 * a.yes_20_2 + 4 * a.part_20_2 + 4 * a.uns_20_2 + 4 * a.yes_30_2 + 4 * a.part_30_2 + 4 * a.uns_30_2 + 4 * a.yes_40_2 + 4 * a.part_40_2 + 4 * a.uns_40_2)::numeric / (12 + 8 * a.yes_10_2)::numeric AS score
                   FROM p_and_c.tier_2_cyber_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.s1_ss1_q10_a1_id258160::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.s1_ss1_q10_a1_id258160::text AS company_name,
                    a.completion_date,
                    a.s1_ss1_q11_a1_id258161::text AS respondent,
                    'Exposures'::text AS section,
                    'Systems Exposure'::text AS category,
                    'Compliance'::text AS type,
                    (4 * a.yes_10_3 + 4 * a.part_10_3 + 4 * a.uns_10_3)::numeric / 4::numeric AS score
                   FROM p_and_c.tier_2_cyber_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.s1_ss1_q10_a1_id258160::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.s1_ss1_q10_a1_id258160::text AS company_name,
                    a.completion_date,
                    a.s1_ss1_q11_a1_id258161::text AS respondent,
                    'Exposures'::text AS section,
                    'Data Exposures'::text AS category,
                    'Sensitive Data'::text AS type,
                    ((4 * a."3_yes_10" + 4 * a."3_part_10" + 4 * a."3_uns_10")::numeric + 0.5 * a.bank_20::numeric + 0.5 * a.bio_20::numeric + 0.5 * a.ccn_20::numeric + 0.5 * a.dob_20::numeric + 0.5 * a.fam_20::numeric + 0.5 * a.hi_20::numeric + 0.5 * a.home_20::numeric + 0.5 * a.ssn_20::numeric + (2 * a.less100_30)::numeric + (2 * a.less500_30)::numeric + (3 * a.less1m_30)::numeric + (4 * a.more1m_30)::numeric + (2 * a.elec_40)::numeric + (1 * a.paper_40)::numeric + (4 * a.yes_60)::numeric + (4 * a.part_60)::numeric + (4 * a.uns_60)::numeric + (4 * a.yes_70)::numeric + (4 * a.part_70)::numeric + (4 * a.uns_70)::numeric) / (19 + 4 * a."3_yes_10")::numeric AS score
                   FROM p_and_c.tier_2_cyber_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.s1_ss1_q10_a1_id258160::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.s1_ss1_q10_a1_id258160::text AS company_name,
                    a.completion_date,
                    a.s1_ss1_q11_a1_id258161::text AS respondent,
                    'Exposures'::text AS section,
                    'Data Exposures'::text AS category,
                    'Financial Data'::text AS type,
                    (4 * a."3_yes_10_2" + 4 * a."3_part_10_2" + 4 * a."3_uns_10_2" + 2 * a.less3_11 + 4 * a.more4_11 + 4 * a.uns_11 + 4 * a."3_yes_20_2" + 4 * a."3_part_20_2" + 4 * a."3_uns_20_2")::numeric / (8 + 4 * a."3_yes_10_2")::numeric AS score
                   FROM p_and_c.tier_2_cyber_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.s1_ss1_q10_a1_id258160::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.s1_ss1_q10_a1_id258160::text AS company_name,
                    a.completion_date,
                    a.s1_ss1_q11_a1_id258161::text AS respondent,
                    'Resilience'::text AS section,
                    'Systems Security'::text AS category,
                    'System Security'::text AS type,
                    (4 * a.in_1 + 2 * a.out_1 + 4 * a.yes_2 + 1 * a.part_2 + 4 * a.days_10 + 3 * a.wks_10 + 2 * a.mon_10 + 1 * a.more_10 + 4 * a.yes_11 + 1 * a.part_11 + 4 * a.yes_13 + 1 * a.part_13 + 4 * a.yes_14 + 1 * a.part_14 + 4 * a.yes_15 + 1 * a.part_15 + 4 * a.yes_16 + 1 * a.part_16 + 4 * a.yes_17 + 1 * a.part_17 + 4 * a."4_yes_20" + 1 * a."4_part_20" + 4 * a.yes_21 + 1 * a.part_21 + 4 * a.yes_42 + 1 * a.part_42 + 4 * a.yes_43 + 1 * a.part_43 + 2 * a.prior_44 + 1 * a.post_44 + 4 * a.yes_45 + 1 * a.part_45 + 4 * a.yes_46 + 1 * a.part_46 + 4 * a.ann_47 + 2 * a.one_47 + 4 * a.yes_48 + 1 * a.part_48)::numeric / (58 + 12 * a.yes_2)::numeric AS score
                   FROM p_and_c.tier_2_cyber_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.s1_ss1_q10_a1_id258160::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.s1_ss1_q10_a1_id258160::text AS company_name,
                    a.completion_date,
                    a.s1_ss1_q11_a1_id258161::text AS respondent,
                    'Resilience'::text AS section,
                    'Systems Security'::text AS category,
                    'System Backups'::text AS type,
                    (4 * a.yes_10_2_4 + 1 * a.part_10_2_4 + 1 * a.week_201 + 3 * a.day_20 + 4 * a.hr_20 + 4 * a.con_20 + 4 * a.off_30 + 3 * a.cloud_30 + 2 * a.alt_30 + 4 * a.yes_40_2_4 + 1 * a.part_40_2_4 + 4 * a.yes_50_2_4 + 1 * a.part_50_2_4)::numeric / (4 + 16 * a.yes_10_2_4)::numeric AS score
                   FROM p_and_c.tier_2_cyber_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.s1_ss1_q10_a1_id258160::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.s1_ss1_q10_a1_id258160::text AS company_name,
                    a.completion_date,
                    a.s1_ss1_q11_a1_id258161::text AS respondent,
                    'Resilience'::text AS section,
                    'Systems Security'::text AS category,
                    'Multifactor Authentication'::text AS type,
                    (4 * a.yes_5 + 1 * a.part_5 + 4 * a.yes_10_3_4 + 1 * a.part_10_3_4 + 4 * a.yes_20_3_4 + 1 * a.part_20_3_4 + 4 * a.yes_30_3_4 + 1 * a.part_30_3_4 + 4 * a.yes_40_3_4 + 1 * a.part_40_3_4 + 4 * a.yes_50_3_4 + 1 * a.part_50_3_4 + 4 * a.yes_60_3_4 + 1 * a.part_60_3_4)::numeric / (4 + 24 * a.yes_5)::numeric AS score
                   FROM p_and_c.tier_2_cyber_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.s1_ss1_q10_a1_id258160::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.s1_ss1_q10_a1_id258160::text AS company_name,
                    a.completion_date,
                    a.s1_ss1_q11_a1_id258161::text AS respondent,
                    'Resilience'::text AS section,
                    'Cyber Controls'::text AS category,
                    'Data Security'::text AS type,
                    (4 * a.wire_10 + 3 * a.encr_10 + 4 * a."4_yes_20_2" + 1 * a."4_part_20_2" + 4 * a."4_yes_30" + 1 * a."4_part_30" + 4 * a.none_40 + 1 * a.seven_40 + 4 * a.thirty_40 + 4 * a.uns_40 + 4 * a.yes_50_1_5 + 1 * a.part_50_1_5 + 4 * a.yes_60_1_5 + 1 * a.part_60_1_5)::numeric / 24::numeric AS score
                   FROM p_and_c.tier_2_cyber_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.s1_ss1_q10_a1_id258160::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.s1_ss1_q10_a1_id258160::text AS company_name,
                    a.completion_date,
                    a.s1_ss1_q11_a1_id258161::text AS respondent,
                    'Resilience'::text AS section,
                    'Cyber Controls'::text AS category,
                    'Policy Controls & Training'::text AS type,
                    ((4 * a.yes_10_4 + 1 * a.part_10_4 + 4 * a.yes_20_4 + 1 * a.part_20_4 + 4 * a.yes_30_4 + 1 * a.part_30_4 + 4 * a.yes_40_6 + 1 * a.part_40_6)::numeric + 0.5 * a.phish_50::numeric + 0.5 * a.per_50::numeric + 0.5 * a.pass_50::numeric + 0.5 * a.int_50::numeric + 0.5 * a.unau_50::numeric + (3 * a.at_51)::numeric + (3 * a.qtly_51)::numeric + (2 * a.semi_51)::numeric + (2 * a.ann_51)::numeric + (1 * a.yes_51)::numeric + (4 * a.yes_60_2)::numeric + (1 * a.part_60_2)::numeric) / (20::numeric + 5.5 * a.yes_40_6::numeric) AS score
                   FROM p_and_c.tier_2_cyber_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.s1_ss1_q10_a1_id258160::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.s1_ss1_q10_a1_id258160::text AS company_name,
                    a.completion_date,
                    a.s1_ss1_q11_a1_id258161::text AS respondent,
                    'Resilience'::text AS section,
                    'Cyber Controls'::text AS category,
                    'Financial Data Management'::text AS type,
                    (4 * a."4_yes_10" + 1 * a."4_part_10" + 4 * a."4_yes_20_4" + 1 * a."4_part_20_4" + 2 * a.less25_30 + 2 * a.less50_30 + 2 * a.more50_30)::numeric / 12::numeric AS score
                   FROM p_and_c.tier_2_cyber_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.s1_ss1_q10_a1_id258160::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.s1_ss1_q10_a1_id258160::text AS company_name,
                    a.completion_date,
                    a.s1_ss1_q11_a1_id258161::text AS respondent,
                    'Resilience'::text AS section,
                    'Recovery'::text AS category,
                    'Business Continuity'::text AS type,
                    (4 * a.yes_10_5 + 1 * a.part_10_5 + 2 * a.yes_20_5 + 1 * a.part_20_5 + 4 * a.high_61 + 2 * a.mod_61)::numeric / (8 + 2 * a.yes_10_5)::numeric AS score
                   FROM p_and_c.tier_2_cyber_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.s1_ss1_q10_a1_id258160::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.s1_ss1_q10_a1_id258160::text AS company_name,
                    a.completion_date,
                    a.s1_ss1_q11_a1_id258161::text AS respondent,
                    'Resilience'::text AS section,
                    'Recovery'::text AS category,
                    'Incident Response Plan'::text AS type,
                    (4 * a."5_yes_10" + 1 * a."5_part_10" + 2 * a."5_yes_11" + 1 * a."5_part_11" + 2 * a."5_yes_20" + 1 * a."5_part_20" + 2 * a."5_yes_30" + 1 * a."5_part_30")::numeric / (4 + 6 * a."5_yes_10" + 4 * a."5_part_10" + 4 * a."5_uns_10")::numeric AS score
                   FROM p_and_c.tier_2_cyber_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.s1_ss1_q10_a1_id258160::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.s1_ss1_q10_a1_id258160::text AS company_name,
                    a.completion_date,
                    a.s1_ss1_q11_a1_id258161::text AS respondent,
                    'Resilience'::text AS section,
                    'Recovery'::text AS category,
                    'Cyber Resources'::text AS type,
                    (4 * a.ins_10 + 4 * a."5_yes_10_3" + 2 * a."5_part_10_3" + 1 * a.att_20 + 1 * a.team_20 + 1 * a.pr_20)::numeric / 7::numeric AS score
                   FROM p_and_c.tier_2_cyber_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.s1_ss1_q10_a1_id258160::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.s1_ss1_q10_a1_id258160::text AS company_name,
                    a.completion_date,
                    a.s1_ss1_q11_a1_id258161::text AS respondent,
                    'Resilience'::text AS section,
                    'Recovery'::text AS category,
                    'Cyber Insurance'::text AS type,
                    (4 * a."5_yes_10_4" + 1 * a."5_part_10_4" + 2 * a."5_yes_20_4" + 1 * a."5_part_20_4" + 2 * a."5_yes_30_4" + 1 * a."5_part_30_4" + 2 * a."5_yes_40" + 1 * a."5_part_40")::numeric / (4 + 6 * a."5_yes_10_4")::numeric AS score
                   FROM p_and_c.tier_2_cyber_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.s1_ss1_q10_a1_id258160::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.s1_ss1_q10_a1_id258160::text AS company_name,
                    a.completion_date,
                    a.s1_ss1_q11_a1_id258161::text AS respondent,
                    'Exposures'::text AS section,
                    'Systems Exposure'::text AS category,
                    NULL::text AS type,
                    (4 * a.no_10 + 4 * a.part_10 + 4 * a.uns_10 + 1 * a.hour_20 + 2 * a.one_20 + 3 * a.two_20 + 4 * a.week_20 + 4 * a.uns_20 + 4 * a.yes_10_2 + 4 * a.part_10_2 + 4 * a.uns_10_2 + 4 * a.yes_20_2 + 4 * a.part_20_2 + 4 * a.uns_20_2 + 4 * a.yes_30_2 + 4 * a.part_30_2 + 4 * a.uns_30_2 + 4 * a.yes_40_2 + 4 * a.part_40_2 + 4 * a.uns_40_2 + 4 * a.yes_10_3 + 4 * a.part_10_3 + 4 * a.uns_10_3)::numeric / (24 + 8 * a.yes_10_2)::numeric AS score
                   FROM p_and_c.tier_2_cyber_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.s1_ss1_q10_a1_id258160::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.s1_ss1_q10_a1_id258160::text AS company_name,
                    a.completion_date,
                    a.s1_ss1_q11_a1_id258161::text AS respondent,
                    'Exposures'::text AS section,
                    'Data Exposures'::text AS category,
                    NULL::text AS type,
                    ((4 * a."3_yes_10" + 4 * a."3_part_10" + 4 * a."3_uns_10")::numeric + 0.5 * a.bank_20::numeric + 0.5 * a.bio_20::numeric + 0.5 * a.ccn_20::numeric + 0.5 * a.dob_20::numeric + 0.5 * a.fam_20::numeric + 0.5 * a.hi_20::numeric + 0.5 * a.home_20::numeric + 0.5 * a.ssn_20::numeric + (2 * a.less100_30)::numeric + (2 * a.less500_30)::numeric + (3 * a.less1m_30)::numeric + (4 * a.more1m_30)::numeric + (2 * a.elec_40)::numeric + (1 * a.paper_40)::numeric + (4 * a.yes_60)::numeric + (4 * a.part_60)::numeric + (4 * a.uns_60)::numeric + (4 * a.yes_70)::numeric + (4 * a.part_70)::numeric + (4 * a.uns_70)::numeric + (4 * a."3_yes_10_2")::numeric + (4 * a."3_part_10_2")::numeric + (4 * a."3_uns_10_2")::numeric + (2 * a.less3_11)::numeric + (4 * a.more4_11)::numeric + (4 * a.uns_11)::numeric + (4 * a."3_yes_20_2")::numeric + (4 * a."3_part_20_2")::numeric + (4 * a."3_uns_20_2")::numeric) / (27 + 4 * a."3_yes_10" + 4 * a."3_yes_10_2")::numeric AS score
                   FROM p_and_c.tier_2_cyber_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.s1_ss1_q10_a1_id258160::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.s1_ss1_q10_a1_id258160::text AS company_name,
                    a.completion_date,
                    a.s1_ss1_q11_a1_id258161::text AS respondent,
                    'Resilience'::text AS section,
                    'Systems Security'::text AS category,
                    NULL::text AS type,
                    (4 * a.in_1 + 2 * a.out_1 + 4 * a.yes_2 + 1 * a.part_2 + 4 * a.days_10 + 3 * a.wks_10 + 2 * a.mon_10 + 1 * a.more_10 + 4 * a.yes_11 + 1 * a.part_11 + 4 * a.yes_13 + 1 * a.part_13 + 4 * a.yes_14 + 1 * a.part_14 + 4 * a.yes_15 + 1 * a.part_15 + 4 * a.yes_16 + 1 * a.part_16 + 4 * a.yes_17 + 1 * a.part_17 + 4 * a."4_yes_20" + 1 * a."4_part_20" + 4 * a.yes_21 + 1 * a.part_21 + 4 * a.yes_42 + 1 * a.part_42 + 4 * a.yes_43 + 1 * a.part_43 + 2 * a.prior_44 + 1 * a.post_44 + 4 * a.yes_45 + 1 * a.part_45 + 4 * a.yes_46 + 1 * a.part_46 + 4 * a.ann_47 + 2 * a.one_47 + 4 * a.yes_48 + 1 * a.part_48 + 4 * a.yes_10_2_4 + 1 * a.part_10_2_4 + 1 * a.week_201 + 3 * a.day_20 + 4 * a.hr_20 + 4 * a.con_20 + 4 * a.off_30 + 3 * a.cloud_30 + 2 * a.alt_30 + 4 * a.yes_40_2_4 + 1 * a.part_40_2_4 + 4 * a.yes_50_2_4 + 1 * a.part_50_2_4 + 4 * a.yes_5 + 1 * a.part_5 + 4 * a.yes_10_3_4 + 1 * a.part_10_3_4 + 4 * a.yes_20_3_4 + 1 * a.part_20_3_4 + 4 * a.yes_30_3_4 + 1 * a.part_30_3_4 + 4 * a.yes_40_3_4 + 1 * a.part_40_3_4 + 4 * a.yes_50_3_4 + 1 * a.part_50_3_4 + 4 * a.yes_60_3_4 + 1 * a.part_60_3_4)::numeric / (66 + 12 * a.yes_2 + 16 * a.yes_10_2_4 + 24 * a.yes_5)::numeric AS score
                   FROM p_and_c.tier_2_cyber_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.s1_ss1_q10_a1_id258160::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.s1_ss1_q10_a1_id258160::text AS company_name,
                    a.completion_date,
                    a.s1_ss1_q11_a1_id258161::text AS respondent,
                    'Resilience'::text AS section,
                    'Cyber Controls'::text AS category,
                    NULL::text AS type,
                    ((4 * a.wire_10 + 3 * a.encr_10 + 4 * a."4_yes_20_2" + 1 * a."4_part_20_2" + 4 * a."4_yes_30" + 1 * a."4_part_30" + 4 * a.none_40 + 1 * a.seven_40 + 4 * a.thirty_40 + 4 * a.uns_40 + 4 * a.yes_50_1_5 + 1 * a.part_50_1_5 + 4 * a.yes_60_1_5 + 1 * a.part_60_1_5 + 4 * a.yes_10_4 + 1 * a.part_10_4 + 4 * a.yes_20_4 + 1 * a.part_20_4 + 4 * a.yes_30_4 + 1 * a.part_30_4 + 4 * a.yes_40_6 + 1 * a.part_40_6)::numeric + 0.5 * a.phish_50::numeric + 0.5 * a.per_50::numeric + 0.5 * a.pass_50::numeric + 0.5 * a.int_50::numeric + 0.5 * a.unau_50::numeric + (3 * a.at_51)::numeric + (3 * a.qtly_51)::numeric + (2 * a.semi_51)::numeric + (2 * a.ann_51)::numeric + (1 * a.yes_51)::numeric + (4 * a.yes_60_2)::numeric + (1 * a.part_60_2)::numeric + (4 * a."4_yes_10")::numeric + (1 * a."4_part_10")::numeric + (4 * a."4_yes_20_4")::numeric + (1 * a."4_part_20_4")::numeric + (2 * a.less25_30)::numeric + (2 * a.less50_30)::numeric + (2 * a.more50_30)::numeric) / (56::numeric + 5.5 * a.yes_40_6::numeric) AS score
                   FROM p_and_c.tier_2_cyber_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.s1_ss1_q10_a1_id258160::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.s1_ss1_q10_a1_id258160::text AS company_name,
                    a.completion_date,
                    a.s1_ss1_q11_a1_id258161::text AS respondent,
                    'Resilience'::text AS section,
                    'Recovery'::text AS category,
                    NULL::text AS type,
                    (4 * a.yes_10_5 + 1 * a.part_10_5 + 2 * a.yes_20_5 + 1 * a.part_20_5 + 4 * a.high_61 + 2 * a.mod_61 + 4 * a."5_yes_10" + 1 * a."5_part_10" + 2 * a."5_yes_11" + 1 * a."5_part_11" + 2 * a."5_yes_20" + 1 * a."5_part_20" + 2 * a."5_yes_30" + 1 * a."5_part_30" + 4 * a.ins_10 + 4 * a."5_yes_10_3" + 2 * a."5_part_10_3" + 1 * a.att_20 + 1 * a.team_20 + 1 * a.pr_20 + 4 * a."5_yes_10_4" + 1 * a."5_part_10_4" + 2 * a."5_yes_20_4" + 1 * a."5_part_20_4" + 2 * a."5_yes_30_4" + 1 * a."5_part_30_4" + 2 * a."5_yes_40" + 1 * a."5_part_40")::numeric / (23 + 2 * a.yes_10_5 + 6 * a."5_yes_10" + 4 * a."5_part_10" + 4 * a."5_uns_10" + 6 * a."5_yes_10_4")::numeric AS score
                   FROM p_and_c.tier_2_cyber_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.s1_ss1_q10_a1_id258160::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.s1_ss1_q10_a1_id258160::text AS company_name,
                    a.completion_date,
                    a.s1_ss1_q11_a1_id258161::text AS respondent,
                    'Exposures'::text AS section,
                    NULL::text AS category,
                    NULL::text AS type,
                    ((4 * a.no_10 + 4 * a.part_10 + 4 * a.uns_10 + 1 * a.hour_20 + 2 * a.one_20 + 3 * a.two_20 + 4 * a.week_20 + 4 * a.uns_20 + 4 * a.yes_10_2 + 4 * a.part_10_2 + 4 * a.uns_10_2 + 4 * a.yes_20_2 + 4 * a.part_20_2 + 4 * a.uns_20_2 + 4 * a.yes_30_2 + 4 * a.part_30_2 + 4 * a.uns_30_2 + 4 * a.yes_40_2 + 4 * a.part_40_2 + 4 * a.uns_40_2 + 4 * a.yes_10_3 + 4 * a.part_10_3 + 4 * a.uns_10_3 + 4 * a."3_yes_10" + 4 * a."3_part_10" + 4 * a."3_uns_10")::numeric + 0.5 * a.bank_20::numeric + 0.5 * a.bio_20::numeric + 0.5 * a.ccn_20::numeric + 0.5 * a.dob_20::numeric + 0.5 * a.fam_20::numeric + 0.5 * a.hi_20::numeric + 0.5 * a.home_20::numeric + 0.5 * a.ssn_20::numeric + (2 * a.less100_30)::numeric + (2 * a.less500_30)::numeric + (3 * a.less1m_30)::numeric + (4 * a.more1m_30)::numeric + (2 * a.elec_40)::numeric + (1 * a.paper_40)::numeric + (4 * a.yes_60)::numeric + (4 * a.part_60)::numeric + (4 * a.uns_60)::numeric + (4 * a.yes_70)::numeric + (4 * a.part_70)::numeric + (4 * a.uns_70)::numeric + (4 * a."3_yes_10_2")::numeric + (4 * a."3_part_10_2")::numeric + (4 * a."3_uns_10_2")::numeric + (2 * a.less3_11)::numeric + (4 * a.more4_11)::numeric + (4 * a.uns_11)::numeric + (4 * a."3_yes_20_2")::numeric + (4 * a."3_part_20_2")::numeric + (4 * a."3_uns_20_2")::numeric) / (51 + 8 * a.yes_10_2 + 4 * a."3_yes_10" + 4 * a."3_yes_10_2")::numeric AS score
                   FROM p_and_c.tier_2_cyber_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.s1_ss1_q10_a1_id258160::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.s1_ss1_q10_a1_id258160::text AS company_name,
                    a.completion_date,
                    a.s1_ss1_q11_a1_id258161::text AS respondent,
                    'Resilience'::text AS section,
                    NULL::text AS category,
                    NULL::text AS type,
                    ((4 * a.in_1 + 2 * a.out_1 + 4 * a.yes_2 + 1 * a.part_2 + 4 * a.days_10 + 3 * a.wks_10 + 2 * a.mon_10 + 1 * a.more_10 + 4 * a.yes_11 + 1 * a.part_11 + 4 * a.yes_13 + 1 * a.part_13 + 4 * a.yes_14 + 1 * a.part_14 + 4 * a.yes_15 + 1 * a.part_15 + 4 * a.yes_16 + 1 * a.part_16 + 4 * a.yes_17 + 1 * a.part_17 + 4 * a."4_yes_20" + 1 * a."4_part_20" + 4 * a.yes_21 + 1 * a.part_21 + 4 * a.yes_42 + 1 * a.part_42 + 4 * a.yes_43 + 1 * a.part_43 + 2 * a.prior_44 + 1 * a.post_44 + 4 * a.yes_45 + 1 * a.part_45 + 4 * a.yes_46 + 1 * a.part_46 + 4 * a.ann_47 + 2 * a.one_47 + 4 * a.yes_48 + 1 * a.part_48 + 4 * a.yes_10_2_4 + 1 * a.part_10_2_4 + 1 * a.week_201 + 3 * a.day_20 + 4 * a.hr_20 + 4 * a.con_20 + 4 * a.off_30 + 3 * a.cloud_30 + 2 * a.alt_30 + 4 * a.yes_40_2_4 + 1 * a.part_40_2_4 + 4 * a.yes_50_2_4 + 1 * a.part_50_2_4 + 4 * a.yes_5 + 1 * a.part_5 + 4 * a.yes_10_3_4 + 1 * a.part_10_3_4 + 4 * a.yes_20_3_4 + 1 * a.part_20_3_4 + 4 * a.yes_30_3_4 + 1 * a.part_30_3_4 + 4 * a.yes_40_3_4 + 1 * a.part_40_3_4 + 4 * a.yes_50_3_4 + 1 * a.part_50_3_4 + 4 * a.yes_60_3_4 + 1 * a.part_60_3_4 + 4 * a.wire_10 + 3 * a.encr_10 + 4 * a."4_yes_20_2" + 1 * a."4_part_20_2" + 4 * a."4_yes_30" + 1 * a."4_part_30" + 4 * a.none_40 + 1 * a.seven_40 + 4 * a.thirty_40 + 4 * a.uns_40 + 4 * a.yes_50_1_5 + 1 * a.part_50_1_5 + 4 * a.yes_60_1_5 + 1 * a.part_60_1_5 + 4 * a.yes_10_4 + 1 * a.part_10_4 + 4 * a.yes_20_4 + 1 * a.part_20_4 + 4 * a.yes_30_4 + 1 * a.part_30_4 + 4 * a.yes_40_6 + 1 * a.part_40_6)::numeric + 0.5 * a.phish_50::numeric + 0.5 * a.per_50::numeric + 0.5 * a.pass_50::numeric + 0.5 * a.int_50::numeric + 0.5 * a.unau_50::numeric + (3 * a.at_51)::numeric + (3 * a.qtly_51)::numeric + (2 * a.semi_51)::numeric + (2 * a.ann_51)::numeric + (1 * a.yes_51)::numeric + (4 * a.yes_60_2)::numeric + (1 * a.part_60_2)::numeric + (4 * a."4_yes_10")::numeric + (1 * a."4_part_10")::numeric + (4 * a."4_yes_20_4")::numeric + (1 * a."4_part_20_4")::numeric + (2 * a.less25_30)::numeric + (2 * a.less50_30)::numeric + (2 * a.more50_30)::numeric + (4 * a.yes_10_5)::numeric + (1 * a.part_10_5)::numeric + (2 * a.yes_20_5)::numeric + (1 * a.part_20_5)::numeric + (4 * a.high_61)::numeric + (2 * a.mod_61)::numeric + (4 * a."5_yes_10")::numeric + (1 * a."5_part_10")::numeric + (2 * a."5_yes_11")::numeric + (1 * a."5_part_11")::numeric + (2 * a."5_yes_20")::numeric + (1 * a."5_part_20")::numeric + (2 * a."5_yes_30")::numeric + (1 * a."5_part_30")::numeric + (4 * a.ins_10)::numeric + (4 * a."5_yes_10_3")::numeric + (2 * a."5_part_10_3")::numeric + (1 * a.att_20)::numeric + (1 * a.team_20)::numeric + (1 * a.pr_20)::numeric + (4 * a."5_yes_10_4")::numeric + (1 * a."5_part_10_4")::numeric + (2 * a."5_yes_20_4")::numeric + (1 * a."5_part_20_4")::numeric + (2 * a."5_yes_30_4")::numeric + (1 * a."5_part_30_4")::numeric + (2 * a."5_yes_40")::numeric + (1 * a."5_part_40")::numeric) / ((145 + 12 * a.yes_2 + 16 * a.yes_10_2_4 + 24 * a.yes_5)::numeric + 5.5 * a.yes_40_6::numeric + (2 * a.yes_10_5)::numeric + (6 * a."5_yes_10")::numeric + (4 * a."5_part_10")::numeric + (4 * a."5_uns_10")::numeric + (6 * a."5_yes_10_4")::numeric) AS score
                   FROM p_and_c.tier_2_cyber_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.s1_ss1_q10_a1_id258160::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.s1_ss1_q10_a1_id258160::text AS company_name,
                    a.completion_date,
                    a.s1_ss1_q11_a1_id258161::text AS respondent,
                    'Overall'::text AS section,
                    NULL::text AS category,
                    NULL::text AS type,
                    0.6 * (1::numeric - ((4 * a.no_10 + 4 * a.part_10 + 4 * a.uns_10 + 1 * a.hour_20 + 2 * a.one_20 + 3 * a.two_20 + 4 * a.week_20 + 4 * a.uns_20 + 4 * a.yes_10_2 + 4 * a.part_10_2 + 4 * a.uns_10_2 + 4 * a.yes_20_2 + 4 * a.part_20_2 + 4 * a.uns_20_2 + 4 * a.yes_30_2 + 4 * a.part_30_2 + 4 * a.uns_30_2 + 4 * a.yes_40_2 + 4 * a.part_40_2 + 4 * a.uns_40_2 + 4 * a.yes_10_3 + 4 * a.part_10_3 + 4 * a.uns_10_3 + 4 * a."3_yes_10" + 4 * a."3_part_10" + 4 * a."3_uns_10")::numeric + 0.5 * a.bank_20::numeric + 0.5 * a.bio_20::numeric + 0.5 * a.ccn_20::numeric + 0.5 * a.dob_20::numeric + 0.5 * a.fam_20::numeric + 0.5 * a.hi_20::numeric + 0.5 * a.home_20::numeric + 0.5 * a.ssn_20::numeric + (2 * a.less100_30)::numeric + (2 * a.less500_30)::numeric + (3 * a.less1m_30)::numeric + (4 * a.more1m_30)::numeric + (2 * a.elec_40)::numeric + (1 * a.paper_40)::numeric + (4 * a.yes_60)::numeric + (4 * a.part_60)::numeric + (4 * a.uns_60)::numeric + (4 * a.yes_70)::numeric + (4 * a.part_70)::numeric + (4 * a.uns_70)::numeric + (4 * a."3_yes_10_2")::numeric + (4 * a."3_part_10_2")::numeric + (4 * a."3_uns_10_2")::numeric + (2 * a.less3_11)::numeric + (4 * a.more4_11)::numeric + (4 * a.uns_11)::numeric + (4 * a."3_yes_20_2")::numeric + (4 * a."3_part_20_2")::numeric + (4 * a."3_uns_20_2")::numeric) / (51 + 8 * a.yes_10_2 + 4 * a."3_yes_10" + 4 * a."3_yes_10_2")::numeric) + 0.4 * ((4 * a.in_1 + 2 * a.out_1 + 4 * a.yes_2 + 1 * a.part_2 + 4 * a.days_10 + 3 * a.wks_10 + 2 * a.mon_10 + 1 * a.more_10 + 4 * a.yes_11 + 1 * a.part_11 + 4 * a.yes_13 + 1 * a.part_13 + 4 * a.yes_14 + 1 * a.part_14 + 4 * a.yes_15 + 1 * a.part_15 + 4 * a.yes_16 + 1 * a.part_16 + 4 * a.yes_17 + 1 * a.part_17 + 4 * a."4_yes_20" + 1 * a."4_part_20" + 4 * a.yes_21 + 1 * a.part_21 + 4 * a.yes_42 + 1 * a.part_42 + 4 * a.yes_43 + 1 * a.part_43 + 2 * a.prior_44 + 1 * a.post_44 + 4 * a.yes_45 + 1 * a.part_45 + 4 * a.yes_46 + 1 * a.part_46 + 4 * a.ann_47 + 2 * a.one_47 + 4 * a.yes_48 + 1 * a.part_48 + 4 * a.yes_10_2_4 + 1 * a.part_10_2_4 + 1 * a.week_201 + 3 * a.day_20 + 4 * a.hr_20 + 4 * a.con_20 + 4 * a.off_30 + 3 * a.cloud_30 + 2 * a.alt_30 + 4 * a.yes_40_2_4 + 1 * a.part_40_2_4 + 4 * a.yes_50_2_4 + 1 * a.part_50_2_4 + 4 * a.yes_5 + 1 * a.part_5 + 4 * a.yes_10_3_4 + 1 * a.part_10_3_4 + 4 * a.yes_20_3_4 + 1 * a.part_20_3_4 + 4 * a.yes_30_3_4 + 1 * a.part_30_3_4 + 4 * a.yes_40_3_4 + 1 * a.part_40_3_4 + 4 * a.yes_50_3_4 + 1 * a.part_50_3_4 + 4 * a.yes_60_3_4 + 1 * a.part_60_3_4 + 4 * a.wire_10 + 3 * a.encr_10 + 4 * a."4_yes_20_2" + 1 * a."4_part_20_2" + 4 * a."4_yes_30" + 1 * a."4_part_30" + 4 * a.none_40 + 1 * a.seven_40 + 4 * a.thirty_40 + 4 * a.uns_40 + 4 * a.yes_50_1_5 + 1 * a.part_50_1_5 + 4 * a.yes_60_1_5 + 1 * a.part_60_1_5 + 4 * a.yes_10_4 + 1 * a.part_10_4 + 4 * a.yes_20_4 + 1 * a.part_20_4 + 4 * a.yes_30_4 + 1 * a.part_30_4 + 4 * a.yes_40_6 + 1 * a.part_40_6)::numeric + 0.5 * a.phish_50::numeric + 0.5 * a.per_50::numeric + 0.5 * a.pass_50::numeric + 0.5 * a.int_50::numeric + 0.5 * a.unau_50::numeric + (3 * a.at_51)::numeric + (3 * a.qtly_51)::numeric + (2 * a.semi_51)::numeric + (2 * a.ann_51)::numeric + (1 * a.yes_51)::numeric + (4 * a.yes_60_2)::numeric + (1 * a.part_60_2)::numeric + (4 * a."4_yes_10")::numeric + (1 * a."4_part_10")::numeric + (4 * a."4_yes_20_4")::numeric + (1 * a."4_part_20_4")::numeric + (2 * a.less25_30)::numeric + (2 * a.less50_30)::numeric + (2 * a.more50_30)::numeric + (4 * a.yes_10_5)::numeric + (1 * a.part_10_5)::numeric + (2 * a.yes_20_5)::numeric + (1 * a.part_20_5)::numeric + (4 * a.high_61)::numeric + (2 * a.mod_61)::numeric + (4 * a."5_yes_10")::numeric + (1 * a."5_part_10")::numeric + (2 * a."5_yes_11")::numeric + (1 * a."5_part_11")::numeric + (2 * a."5_yes_20")::numeric + (1 * a."5_part_20")::numeric + (2 * a."5_yes_30")::numeric + (1 * a."5_part_30")::numeric + (4 * a.ins_10)::numeric + (4 * a."5_yes_10_3")::numeric + (2 * a."5_part_10_3")::numeric + (1 * a.att_20)::numeric + (1 * a.team_20)::numeric + (1 * a.pr_20)::numeric + (4 * a."5_yes_10_4")::numeric + (1 * a."5_part_10_4")::numeric + (2 * a."5_yes_20_4")::numeric + (1 * a."5_part_20_4")::numeric + (2 * a."5_yes_30_4")::numeric + (1 * a."5_part_30_4")::numeric + (2 * a."5_yes_40")::numeric + (1 * a."5_part_40")::numeric) / ((145 + 12 * a.yes_2 + 16 * a.yes_10_2_4 + 24 * a.yes_5)::numeric + 5.5 * a.yes_40_6::numeric + (2 * a.yes_10_5)::numeric + (6 * a."5_yes_10")::numeric + (4 * a."5_part_10")::numeric + (4 * a."5_uns_10")::numeric + (6 * a."5_yes_10_4")::numeric) AS score
                   FROM p_and_c.tier_2_cyber_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.s1_ss1_q10_a1_id258160::text = b.client_name::text) z) y
     LEFT JOIN p_and_c.assessment_text x ON COALESCE(y.type, y.category, y.section) = x.category::text AND x.result::text = y.result
  WHERE x.assessment::text = 'tier_2_cyber'::text;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.tier_2_cyber_results OWNER TO mj_admin;
GO

Grant select on table p_and_c.tier_2_cyber_results to rl_pc_data_analyst;
GO

Grant select on table p_and_c.tier_2_cyber_results to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.tier_2_cyber_results to rpauser;
GO
GRANT SELECT ON p_and_c.tier_2_cyber_results to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.tier_2_cyber_results to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.tier_2_cyber_results to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.tier_2_cyber_results to rl_p_and_c_d;
GO