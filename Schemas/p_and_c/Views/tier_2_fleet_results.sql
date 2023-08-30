CREATE OR REPLACE VIEW p_and_c.tier_2_fleet_results
AS SELECT y.client_id,
    y.company_name,
    y.completion_date,
    y.respondent,
    y.section,
    y.category,
    y.score,
    y.result,
    x.text
   FROM ( SELECT z.client_id,
            z.company_name,
            z.completion_date,
            z.respondent,
            z.section,
            z.category,
            round(z.score, 2) AS score,
                CASE
                    WHEN z.section = 'Fleet Exposures'::text THEN
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
                    a.company_name,
                    a.completion_date,
                    a.respondent,
                    'Fleet Exposures'::text AS section,
                    'Fleet Profile'::text AS category,
                    (5 * (a."6_25_veh" + a."1_5_trucks" + a."1_5_drivers" + a.local + a.rural + a.interstate + a.less_15000 + a.less_500000 + a.yes1 + a.part1 + a.uns1 + a."1_10_emp" + a.yes2 + a.part2 + a.uns2 + a.wraps + a.special + a.other + a.yes3) + 10 * (a."26_49_veh" + a."6_14_trucks" + a."6_24_drivers" + a.intermediate + a.urban + a."15000_40000" + a."500000_1000000" + a."11_24_emp") + 15 * (a."50_veh" + a."15_trucks" + a."25_drivers" + a.long_haul + a.more_40000 + a.more_1000000 + a."25_emp"))::numeric / (140 + 15 * (a."1_10_emp" + a."11_24_emp" + a."25_emp"))::numeric AS score
                   FROM p_and_c.tier_2_fleet_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name,
                    a.completion_date,
                    a.respondent,
                    'Fleet Exposures'::text AS section,
                    'Special Hazards'::text AS category,
                    (2 * (a.yes4 + a.part4 + a.uns4 + a.yes5 + a.part5 + a.uns5 + a.yes6 + a.part6 + a.uns6 + a.yes7 + a.part7 + a.uns7) + 3 * (a.special1 + a.special2 + a.special3 + a.special4 + a.special5 + a.special6))::numeric / (18 + 2 * (a.yes4 + a.no4 + a.part4 + a.uns4 + a.yes5 + a.no5 + a.part5 + a.uns5 + a.yes6 + a.no6 + a.part6 + a.uns6 + a.yes7 + a.no7 + a.part7 + a.uns7))::numeric AS score
                   FROM p_and_c.tier_2_fleet_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name,
                    a.completion_date,
                    a.respondent,
                    'Fleet Controls'::text AS section,
                    'Administrative Controls'::text AS category,
                    (2 * (a.part8 + a.part9 + a.part10 + a.program1 + a.program2 + a.program3 + a.program4 + a.program5 + a.part11 + a.outsourced + a.part12 + a.part13 + a.part14 + a.part15 + a.part16) + 4 * (a.yes8 + a.yes9 + a.yes10 + a.yes11 + a.internally + a.yes12 + a.yes13 + a.yes14 + a.yes15 + a.yes16))::numeric / (42 + 4 * (a.internally + a.outsourced + a.yes12 + a.no12 + a.part12 + a.uns12))::numeric AS score
                   FROM p_and_c.tier_2_fleet_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name,
                    a.completion_date,
                    a.respondent,
                    'Fleet Controls'::text AS section,
                    'Driver Training'::text AS category,
                    (a.hire + a.monthly + a.quarterly + a.annually + a.post + 2 * (a.part17 + a.defensive + a.distracted) + 5 * a.yes17)::numeric / 15::numeric AS score
                   FROM p_and_c.tier_2_fleet_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name,
                    a.completion_date,
                    a.respondent,
                    'Fleet Controls'::text AS section,
                    'Fleet Technology'::text AS category,
                    (2 * (a.tech1 + a.tech2 + a.tech3 + a.tech4 + a.tech5 + a.less_25 + a.part18) + 3 * a."25_75" + 4 * (a.more_75 + a.yes18))::numeric / (10 + 4 * (a.less_25 + a."25_75" + a.more_75 + a.yes18 + a.no18 + a.part18 + a.uns18))::numeric AS score
                   FROM p_and_c.tier_2_fleet_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name,
                    a.completion_date,
                    a.respondent,
                    'Fleet Exposures'::text AS section,
                    NULL::text AS category,
                    (2 * (a.yes4 + a.part4 + a.uns4 + a.yes5 + a.part5 + a.uns5 + a.yes6 + a.part6 + a.uns6 + a.yes7 + a.part7 + a.uns7) + 3 * (a.special1 + a.special2 + a.special3 + a.special4 + a.special5 + a.special6) + 5 * (a."6_25_veh" + a."1_5_drivers" + a."1_5_trucks" + a.local + a.rural + a.interstate + a.less_15000 + a.less_500000 + a.yes1 + a.part1 + a.uns1 + a."1_10_emp" + a.yes2 + a.part2 + a.uns2 + a.wraps + a.special + a.other + a.yes3) + 10 * (a."26_49_veh" + a."6_14_trucks" + a."6_24_drivers" + a.intermediate + a.urban + a."15000_40000" + a."500000_1000000" + a."11_24_emp") + 15 * (a."50_veh" + a."15_trucks" + a."25_drivers" + a.long_haul + a.more_40000 + a.more_1000000 + a."25_emp"))::numeric / (158 + 15 * (a."1_10_emp" + a."11_24_emp" + a."25_emp") + 2 * (a.yes4 + a.no4 + a.part4 + a.uns4 + a.yes5 + a.no5 + a.part5 + a.uns5 + a.yes6 + a.no6 + a.part6 + a.uns6 + a.yes7 + a.no7 + a.part7 + a.uns7))::numeric AS score
                   FROM p_and_c.tier_2_fleet_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name,
                    a.completion_date,
                    a.respondent,
                    'Fleet Controls'::text AS section,
                    NULL::text AS category,
                    (a.hire + a.monthly + a.quarterly + a.annually + a.post + 2 * (a.part8 + a.part9 + a.part10 + a.program1 + a.program2 + a.program3 + a.program4 + a.program5 + a.part11 + a.outsourced + a.part12 + a.part13 + a.part14 + a.part15 + a.part16 + a.part17 + a.defensive + a.distracted + a.tech1 + a.tech2 + a.tech3 + a.tech4 + a.tech5 + a.less_25 + a.part18) + 3 * a."25_75" + 4 * (a.yes8 + a.yes9 + a.yes10 + a.yes11 + a.internally + a.yes12 + a.yes13 + a.yes14 + a.yes15 + a.yes16 + a.more_75 + a.yes18) + 5 * a.yes17)::numeric / (67 + 4 * (a.internally + a.outsourced + a.yes12 + a.no12 + a.part12 + a.uns12 + a.less_25 + a."25_75" + a.more_75 + a.yes18 + a.no18 + a.part18 + a.uns18))::numeric AS score
                   FROM p_and_c.tier_2_fleet_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text
                UNION ALL
                 SELECT b.client_id,
                    a.company_name,
                    a.completion_date,
                    a.respondent,
                    'Overall'::text AS section,
                    NULL::text AS category,
                    0.6 * (1::numeric - (2 * (a.yes4 + a.part4 + a.uns4 + a.yes5 + a.part5 + a.uns5 + a.yes6 + a.part6 + a.uns6 + a.yes7 + a.part7 + a.uns7) + 3 * (a.special1 + a.special2 + a.special3 + a.special4 + a.special5 + a.special6) + 5 * (a."6_25_veh" + a."1_5_drivers" + a."1_5_trucks" + a.local + a.rural + a.interstate + a.less_15000 + a.less_500000 + a.yes1 + a.part1 + a.uns1 + a."1_10_emp" + a.yes2 + a.part2 + a.uns2 + a.wraps + a.special + a.other + a.yes3) + 10 * (a."26_49_veh" + a."6_14_trucks" + a."6_24_drivers" + a.intermediate + a.urban + a."15000_40000" + a."500000_1000000" + a."11_24_emp") + 15 * (a."50_veh" + a."15_trucks" + a."25_drivers" + a.long_haul + a.more_40000 + a.more_1000000 + a."25_emp"))::numeric / (158 + 15 * (a."1_10_emp" + a."11_24_emp" + a."25_emp") + 2 * (a.yes4 + a.no4 + a.part4 + a.uns4 + a.yes5 + a.no5 + a.part5 + a.uns5 + a.yes6 + a.no6 + a.part6 + a.uns6 + a.yes7 + a.no7 + a.part7 + a.uns7))::numeric) + 0.4 * (a.hire + a.monthly + a.quarterly + a.annually + a.post + 2 * (a.part8 + a.part9 + a.part10 + a.program1 + a.program2 + a.program3 + a.program4 + a.program5 + a.part11 + a.outsourced + a.part12 + a.part13 + a.part14 + a.part15 + a.part16 + a.part17 + a.defensive + a.distracted + a.tech1 + a.tech2 + a.tech3 + a.tech4 + a.tech5 + a.less_25 + a.part18) + 3 * a."25_75" + 4 * (a.yes8 + a.yes9 + a.yes10 + a.yes11 + a.internally + a.yes12 + a.yes13 + a.yes14 + a.yes15 + a.yes16 + a.more_75 + a.yes18) + 5 * a.yes17)::numeric / (67 + 4 * (a.internally + a.outsourced + a.yes12 + a.no12 + a.part12 + a.uns12 + a.less_25 + a."25_75" + a.more_75 + a.yes18 + a.no18 + a.part18 + a.uns18))::numeric AS score
                   FROM p_and_c.tier_2_fleet_answers a
                     LEFT JOIN p_and_c.etl_processed_clients b ON a.company_name::text = b.client_name::text) z) y
     LEFT JOIN p_and_c.assessment_text x ON COALESCE(y.category, y.section) = x.category::text AND x.result::text = y.result
  WHERE x.assessment::text = 'tier_2_fleet'::text;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.tier_2_fleet_results OWNER TO mj_admin;
GO

Grant select on table p_and_c.tier_2_fleet_results to rl_pc_data_analyst;
GO

Grant select on table p_and_c.tier_2_fleet_results to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.tier_2_fleet_results to rpauser;
GO
GRANT SELECT ON p_and_c.tier_2_fleet_results to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.tier_2_fleet_results to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.tier_2_fleet_results to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.tier_2_fleet_results to rl_p_and_c_d;
GO