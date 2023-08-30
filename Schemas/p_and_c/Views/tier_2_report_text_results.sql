CREATE OR REPLACE VIEW p_and_c.tier_2_report_text_results
AS SELECT DISTINCT a.client_id,
    a.surveyname,
    a.category,
    a.recommendation
   FROM ( SELECT b.client_id,
            'MJ Safety Management'::character varying AS surveyname,
            'Safety Accomplishments'::character varying AS category,
            a_1."S1_SS1_Q4_A0_ID252612" AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE a_1."S1_SS1_Q4_A0_ID252612" IS NOT NULL
        UNION ALL
         SELECT b.client_id,
            'MJ Safety Management'::character varying AS surveyname,
            'Safety Initiatives'::character varying AS category,
            a_1."S1_SS1_Q5_A0_ID250473" AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE a_1."S1_SS1_Q5_A0_ID250473" IS NOT NULL
        UNION ALL
         SELECT b.client_id,
            'MJ Safety Management'::character varying AS surveyname,
            'OSHA Total Recordable Incident Rate (TRIR)'::character varying AS category,
            a_1."S2_SS2_Q280_A1_ID254383" AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE a_1."S2_SS2_Q280_A1_ID254383" IS NOT NULL
        UNION ALL
         SELECT b.client_id,
            'MJ Safety Management'::character varying AS surveyname,
            'Workers Compensation Loss Ratio (prior year)'::character varying AS category,
            a_1."33" AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE a_1."33" IS NOT NULL
        UNION ALL
         SELECT b.client_id,
            'MJ Safety Management'::character varying AS surveyname,
            'Experience Modification Rate (most recent)'::character varying AS category,
            a_1.above_1_34 AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE a_1.above_1_34 IS NOT NULL
        UNION ALL
         SELECT b.client_id,
            'MJ Safety Management'::character varying AS surveyname,
            'Key Hazard1'::character varying AS category,
            a_1.haz_1 AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE a_1.haz_1 IS NOT NULL
        UNION ALL
         SELECT b.client_id,
            'MJ Safety Management'::character varying AS surveyname,
            'Key Hazard2'::character varying AS category,
            a_1.haz_2 AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE a_1.haz_2 IS NOT NULL
        UNION ALL
         SELECT b.client_id,
            'MJ Safety Management'::character varying AS surveyname,
            'Key Hazard3'::character varying AS category,
            a_1.haz_3 AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE a_1.haz_3 IS NOT NULL
        UNION ALL
         SELECT b.client_id,
            'MJ Safety Management'::character varying AS surveyname,
            'Loss Trends'::character varying AS category,
            a_1."S2_SS2_Q270_A0_ID254382" AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE a_1."S2_SS2_Q270_A0_ID254382" IS NOT NULL
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'cat_2'::text AND a_1.cat_2 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'cat_3'::text AND a_1.cat_3 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'cat_4'::text AND a_1.cat_4 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'cat_5'::text AND a_1.cat_5 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'cat_6'::text AND a_1.cat_6 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'cat_7'::text AND a_1.cat_7 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'cat_8'::text AND a_1.cat_8 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'cat_9'::text AND a_1.cat_9 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'cat_10'::text AND a_1.cat_10 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'cat_11'::text AND a_1.cat_11 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'cat_12'::text AND a_1.cat_12 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'cat_13'::text AND a_1.cat_13 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'hr_10'::text AND a_1.hr_10 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'opman_10'::text AND a_1.opman_10 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'rm_10'::text AND a_1.rm_10 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'sr_10'::text AND a_1.sr_10 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'vendor_10'::text AND a_1.vendor_10 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'less10_50'::text AND a_1.less10_50 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'less25_50'::text AND a_1.less25_50 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'less50_50'::text AND a_1.less50_50 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'no_100'::text AND a_1.no_100 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'part_100'::text AND a_1.part_100 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'uns_100'::text AND a_1.uns_100 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'no_130'::text AND a_1.no_130 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'part_130'::text AND a_1.part_130 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'uns_130'::text AND a_1.uns_130 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'no_140'::text AND a_1.no_140 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'part_140'::text AND a_1.part_140 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'uns_140'::text AND a_1.uns_140 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'no_170'::text AND a_1.no_170 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'part_170'::text AND a_1.part_170 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'uns_170'::text AND a_1.uns_170 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'no_182'::text AND a_1.no_182 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'part_182'::text AND a_1.part_182 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'uns_182'::text AND a_1.uns_182 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'no_190'::text AND a_1.no_190 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'part_190'::text AND a_1.part_190 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'uns_190'::text AND a_1.uns_190 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'no_210'::text AND a_1.no_210 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'part_210'::text AND a_1.part_210 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'uns_210'::text AND a_1.uns_210 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'no_20'::text AND a_1.no_20 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'part_20'::text AND a_1.part_20 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'uns_20'::text AND a_1.uns_20 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'no_0'::text AND a_1.no_0 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'part_0'::text AND a_1.part_0 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'uns_0'::text AND a_1.uns_0 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'no_2'::text AND a_1.no_2 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'part_2'::text AND a_1.part_2 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'uns_2'::text AND a_1.uns_2 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'no_1_4'::text AND a_1.no_1_4 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'part_1_4'::text AND a_1.part_1_4 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'uns_1_4'::text AND a_1.uns_1_4 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'no_2_4'::text AND a_1.no_2_4 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'part_2_4'::text AND a_1.part_2_4 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'uns_2_4'::text AND a_1.uns_2_4 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'no_3_4'::text AND a_1.no_3_4 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'part_3_4'::text AND a_1.part_3_4 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management'::text AND tier_2_report_text.answername::text = 'uns_3_4'::text AND a_1.uns_3_4 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'compliant1'::text AND a_1.compliant1 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'compliant2'::text AND a_1.compliant2 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'compliant3'::text AND a_1.compliant3 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'reactive1'::text AND a_1.reactive1 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'reactive2'::text AND a_1.reactive2 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'reactive3'::text AND a_1.reactive3 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'managed1'::text AND a_1.managed1 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'managed2'::text AND a_1.managed2 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'managed3'::text AND a_1.managed3 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'embedded1'::text AND a_1.embedded1 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'embedded2'::text AND a_1.embedded2 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'embedded3'::text AND a_1.embedded3 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'leading1'::text AND a_1.leading1 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'leading2'::text AND a_1.leading2 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'leading3'::text AND a_1.leading3 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'con_110'::text AND a_1.con_110 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'driv_110'::text AND a_1.driv_110 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'elec_110'::text AND a_1.elec_110 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'fall_110'::text AND a_1.fall_110 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'ghs_110'::text AND a_1.ghs_110 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'equip_110'::text AND a_1.equip_110 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'ladd_110'::text AND a_1.ladd_110 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'hot_110'::text AND a_1.hot_110 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'loto_110'::text AND a_1.loto_110 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'mach_110'::text AND a_1.mach_110 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'ppe_110'::text AND a_1.ppe_110 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'other_110'::text AND a_1.other_110 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'app_160'::text AND a_1.app_160 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'back_160'::text AND a_1.back_160 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'drug_160'::text AND a_1.drug_160 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'int_160'::text AND a_1.int_160 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'phys_160'::text AND a_1.phys_160 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'mvr_160'::text AND a_1.mvr_160 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'none_160'::text AND a_1.none_160 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'rev_1'::text AND a_1.rev_1 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'pmp_1'::text AND a_1.pmp_1 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'root_1'::text AND a_1.root_1 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'spec_1'::text AND a_1.spec_1 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'tpa_1'::text AND a_1.tpa_1 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_safety_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Safety Management Supplemental'::text AND tier_2_report_text.answername::text = 'none_1'::text AND a_1.none_1 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers c
             LEFT JOIN p_and_c.etl_processed_clients b ON c.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = '4_no_20_2'::text AND c."4_no_20_2" = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'none_40'::text AND a_1.none_40 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'seven_40'::text AND a_1.seven_40 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'thirty_40'::text AND a_1.thirty_40 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'uns_40'::text AND a_1.uns_40 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'out_1'::text AND a_1.out_1 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'no_2'::text AND a_1.no_2 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'part_2'::text AND a_1.part_2 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'uns_2'::text AND a_1.uns_2 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'no_11'::text AND a_1.no_11 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'part_11'::text AND a_1.part_11 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'uns_111'::text AND a_1.uns_111 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = '4_no_20'::text AND a_1."4_no_20" = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = '4_part_20'::text AND a_1."4_part_20" = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = '4_uns_20'::text AND a_1."4_uns_20" = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'no_42'::text AND a_1.no_42 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'part_42'::text AND a_1.part_42 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'uns_42'::text AND a_1.uns_42 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'no_43'::text AND a_1.no_43 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'part_43'::text AND a_1.part_43 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'uns_43'::text AND a_1.uns_43 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'no_45'::text AND a_1.no_45 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'part_45'::text AND a_1.part_45 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'uns_45'::text AND a_1.uns_45 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'no_46'::text AND a_1.no_46 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'part_46'::text AND a_1.part_46 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'uns_46'::text AND a_1.uns_46 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'none_47'::text AND a_1.none_47 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'one_47'::text AND a_1.one_47 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'no_50_2_4'::text AND a_1.no_50_2_4 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'part_50_2_4'::text AND a_1.part_50_2_4 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'uns_50_2_4'::text AND a_1.uns_50_2_4 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'stan_10'::text AND a_1.stan_10 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'other_10'::text AND a_1.other_10 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = '4_part_20_2'::text AND a_1."4_part_20_2" = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = '4_uns_20_2'::text AND a_1."4_uns_20_2" = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'no_30_4'::text AND a_1.no_30_4 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'part_30_4'::text AND a_1.part_30_4 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'uns_30_4'::text AND a_1.uns_30_4 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'no_30_3_4'::text AND a_1.no_30_3_4 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'part_30_3_4'::text AND a_1.part_30_3_4 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'uns_30_3_4'::text AND a_1.uns_30_3_4 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'no_10_4'::text AND a_1.no_10_4 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'part_10_4'::text AND a_1.part_10_4 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'uns_10_4'::text AND a_1.uns_10_4 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'no_20_4'::text AND a_1.no_20_4 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'part_20_4'::text AND a_1.part_20_4 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'uns_20_4'::text AND a_1.uns_20_4 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'no_40_6'::text AND a_1.no_40_6 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'part_40_6'::text AND a_1.part_40_6 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'uns_40_6'::text AND a_1.uns_40_6 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = '5_no_10'::text AND a_1."5_no_10" = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = '5_part_10'::text AND a_1."5_part_10" = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = '5_uns_10'::text AND a_1."5_uns_10" = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'no_40_2_4'::text AND a_1.no_40_2_4 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'part_40_2_4'::text AND a_1.part_40_2_4 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'uns_40_2_4'::text AND a_1.uns_40_2_4 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'no_60_2'::text AND a_1.no_60_2 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'part_60_2'::text AND a_1.part_60_2 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'uns_60_2'::text AND a_1.uns_60_2 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = '4_no_10'::text AND a_1."4_no_10" = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = '4_part_10'::text AND a_1."4_part_10" = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = '4_uns_10'::text AND a_1."4_uns_10" = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = '4_no_20_4'::text AND a_1."4_no_20_4" = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = '4_part_20_4'::text AND a_1."4_part_20_4" = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = '4_uns_20_4'::text AND a_1."4_uns_20_4" = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity'::text AND tier_2_report_text.answername::text = 'none_30'::text AND a_1.none_30 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity Supplemental'::text AND tier_2_report_text.answername::text = 'hour_20'::text AND a_1.hour_20 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity Supplemental'::text AND tier_2_report_text.answername::text = 'one_20'::text AND a_1.one_20 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity Supplemental'::text AND tier_2_report_text.answername::text = 'two_20'::text AND a_1.two_20 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity Supplemental'::text AND tier_2_report_text.answername::text = 'week_20'::text AND a_1.week_20 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity Supplemental'::text AND tier_2_report_text.answername::text = 'uns_20'::text AND a_1.uns_20 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity Supplemental'::text AND tier_2_report_text.answername::text = 'high_61'::text AND a_1.high_61 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity Supplemental'::text AND tier_2_report_text.answername::text = 'mod_61'::text AND a_1.mod_61 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_cyber_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.s1_ss1_q10_a1_id258160::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ CyberSecurity Supplemental'::text AND tier_2_report_text.answername::text = 'low_61'::text AND a_1.low_61 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'no_10_1'::text AND a_1.no_10_1 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'part_10_1'::text AND a_1.part_10_1 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'uns_10_1'::text AND a_1.uns_10_1 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'no_20'::text AND a_1.no_20 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'part_20'::text AND a_1.part_20 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'uns_20'::text AND a_1.uns_20 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'none_40'::text AND a_1.none_40 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'no_50'::text AND a_1.no_50 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'part_50'::text AND a_1.part_50 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'uns_50'::text AND a_1.uns_50 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'no_text'::text AND a_1.no_text = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'part_text'::text AND a_1.part_text = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'uns_text'::text AND a_1.uns_text = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'no_60'::text AND a_1.no_60 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'part_60'::text AND a_1.part_60 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'uns_60'::text AND a_1.uns_60 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'no_70'::text AND a_1.no_70 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'part_70'::text AND a_1.part_70 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'uns_70'::text AND a_1.uns_70 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'no_80'::text AND a_1.no_80 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'part_80'::text AND a_1.part_80 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'uns_80'::text AND a_1.uns_80 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'no_1_4'::text AND a_1.no_1_4 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'part_1_4'::text AND a_1.part_1_4 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'uns_1_4'::text AND a_1.uns_1_4 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'no_4_4'::text AND a_1.no_4_4 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'part_4_4'::text AND a_1.part_4_4 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'uns_4_4'::text AND a_1.uns_4_4 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'no_5'::text AND a_1.no_5 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'part_5'::text AND a_1.part_5 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'uns_5'::text AND a_1.uns_5 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'no_6'::text AND a_1.no_6 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'part_6'::text AND a_1.part_6 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'uns_6'::text AND a_1.uns_6 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'na_6'::text AND a_1.na_6 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'no_7'::text AND a_1.no_7 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'part_7'::text AND a_1.part_7 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'uns_7'::text AND a_1.uns_7 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'no_9'::text AND a_1.no_9 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'part_9'::text AND a_1.part_9 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'uns_9'::text AND a_1.uns_9 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'no_10_2'::text AND a_1.no_10_2 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'part_10_2'::text AND a_1.part_10_2 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'uns_10_2'::text AND a_1.uns_10_2 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'no_20_2'::text AND a_1.no_20_2 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'part_20_2'::text AND a_1.part_20_2 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'uns_20_2'::text AND a_1.uns_20_2 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'no_30'::text AND a_1.no_30 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'part_30'::text AND a_1.part_30 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'uns_30'::text AND a_1.uns_30 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'no_1_3'::text AND a_1.no_1_3 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'part_1_3'::text AND a_1.part_1_3 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'uns_1_3'::text AND a_1.uns_1_3 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'no_2_3'::text AND a_1.no_2_3 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'part_2_3'::text AND a_1.part_2_3 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'uns_2_3'::text AND a_1.uns_2_3 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'no_3_3'::text AND a_1.no_3_3 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'part_3_3'::text AND a_1.part_3_3 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'uns_3_3'::text AND a_1.uns_3_3 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'no_4_3'::text AND a_1.no_4_3 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'part_4_3'::text AND a_1.part_4_3 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'uns_4_3'::text AND a_1.uns_4_3 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'no_0_5'::text AND a_1.no_0_5 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'part_0_5'::text AND a_1.part_0_5 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'uns_0_5'::text AND a_1.uns_0_5 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'no_3_5'::text AND a_1.no_3_5 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'part_3_5'::text AND a_1.part_3_5 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'uns_3_5'::text AND a_1.uns_3_5 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'no_4_5'::text AND a_1.no_4_5 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'part_4_5'::text AND a_1.part_4_5 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'uns_4_5'::text AND a_1.uns_4_5 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'no_5_5'::text AND a_1.no_5_5 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'part_5_5'::text AND a_1.part_5_5 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'uns_5_5'::text AND a_1.uns_5_5 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'no_1_6'::text AND a_1.no_1_6 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'part_1_6'::text AND a_1.part_1_6 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'uns_1_6'::text AND a_1.uns_1_6 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'no_2_6'::text AND a_1.no_2_6 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'part_2_6'::text AND a_1.part_2_6 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'uns_2_6'::text AND a_1.uns_2_6 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'no_3_6'::text AND a_1.no_3_6 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'part_3_6'::text AND a_1.part_3_6 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Business Continuity'::text AND tier_2_report_text.answername::text = 'uns_3_6'::text AND a_1.uns_3_6 = 1
        UNION ALL
         SELECT b.client_id,
            'MJ Business Continuity'::character varying AS surveyname,
            'Business Interruption Risk Supplemental'::character varying AS category,
            a_1."S2_SS1_Q92_A0_ID269710" AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_continuity_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE a_1."S2_SS1_Q92_A0_ID269710" IS NOT NULL
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_fleet_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Fleet Management'::text AND tier_2_report_text.answername::text = 'no17'::text AND a_1.no17 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_fleet_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Fleet Management'::text AND tier_2_report_text.answername::text = 'no8'::text AND a_1.no8 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_fleet_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Fleet Management'::text AND tier_2_report_text.answername::text = 'part8'::text AND a_1.part8 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_fleet_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Fleet Management'::text AND tier_2_report_text.answername::text = 'uns8'::text AND a_1.uns8 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_fleet_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Fleet Management'::text AND tier_2_report_text.answername::text = 'no9'::text AND a_1.no9 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_fleet_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Fleet Management'::text AND tier_2_report_text.answername::text = 'part9'::text AND a_1.part9 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_fleet_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Fleet Management'::text AND tier_2_report_text.answername::text = 'uns9'::text AND a_1.uns9 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_fleet_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Fleet Management'::text AND tier_2_report_text.answername::text = 'no10'::text AND a_1.no10 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_fleet_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Fleet Management'::text AND tier_2_report_text.answername::text = 'part10'::text AND a_1.part10 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_fleet_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Fleet Management'::text AND tier_2_report_text.answername::text = 'uns10'::text AND a_1.uns10 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_fleet_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Fleet Management'::text AND tier_2_report_text.answername::text = 'program_none'::text AND a_1.program_none = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_fleet_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Fleet Management'::text AND tier_2_report_text.answername::text = 'no11'::text AND a_1.no11 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_fleet_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Fleet Management'::text AND tier_2_report_text.answername::text = 'part11'::text AND a_1.part11 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_fleet_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Fleet Management'::text AND tier_2_report_text.answername::text = 'uns11'::text AND a_1.uns11 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_fleet_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Fleet Management'::text AND tier_2_report_text.answername::text = 'no12'::text AND a_1.no12 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_fleet_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Fleet Management'::text AND tier_2_report_text.answername::text = 'part12'::text AND a_1.part12 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_fleet_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Fleet Management'::text AND tier_2_report_text.answername::text = 'uns12'::text AND a_1.uns12 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_fleet_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Fleet Management'::text AND tier_2_report_text.answername::text = 'no13'::text AND a_1.no13 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_fleet_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Fleet Management'::text AND tier_2_report_text.answername::text = 'part13'::text AND a_1.part13 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_fleet_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Fleet Management'::text AND tier_2_report_text.answername::text = 'uns13'::text AND a_1.uns13 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_fleet_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Fleet Management'::text AND tier_2_report_text.answername::text = 'no14'::text AND a_1.no14 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_fleet_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Fleet Management'::text AND tier_2_report_text.answername::text = 'part14'::text AND a_1.part14 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_fleet_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Fleet Management'::text AND tier_2_report_text.answername::text = 'uns14'::text AND a_1.uns14 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_fleet_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Fleet Management'::text AND tier_2_report_text.answername::text = 'no15'::text AND a_1.no15 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_fleet_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Fleet Management'::text AND tier_2_report_text.answername::text = 'part15'::text AND a_1.part15 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_fleet_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Fleet Management'::text AND tier_2_report_text.answername::text = 'uns15'::text AND a_1.uns15 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_fleet_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Fleet Management'::text AND tier_2_report_text.answername::text = 'no16'::text AND a_1.no16 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_fleet_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Fleet Management'::text AND tier_2_report_text.answername::text = 'part16'::text AND a_1.part16 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_fleet_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Fleet Management'::text AND tier_2_report_text.answername::text = 'part17'::text AND a_1.part17 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_fleet_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Fleet Management'::text AND tier_2_report_text.answername::text = 'uns17'::text AND a_1.uns17 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_fleet_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Fleet Management'::text AND tier_2_report_text.answername::text = 'tech_none'::text AND a_1.tech_none = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_fleet_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Fleet Management'::text AND tier_2_report_text.answername::text = 'no18'::text AND a_1.no18 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_fleet_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Fleet Management'::text AND tier_2_report_text.answername::text = 'part18'::text AND a_1.part18 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_fleet_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Fleet Management'::text AND tier_2_report_text.answername::text = 'uns18'::text AND a_1.uns18 = 1
        UNION ALL
         SELECT b.client_id,
            tier_2_report_text.surveyname,
            tier_2_report_text.category,
            tier_2_report_text.reporttext AS recommendation
           FROM p_and_c.tier_2_report_text,
            p_and_c.tier_2_fleet_answers a_1
             LEFT JOIN p_and_c.etl_processed_clients b ON a_1.company_name::text = b.client_name::text
          WHERE tier_2_report_text.surveyname::text = 'MJ Fleet Management'::text AND tier_2_report_text.answername::text = 'uns16'::text AND a_1.uns16 = 1) a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.tier_2_report_text_results OWNER TO mj_admin;
GO

Grant select on table p_and_c.tier_2_report_text_results to rl_pc_data_analyst;
GO

Grant select on table p_and_c.tier_2_report_text_results to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.tier_2_report_text_results to rpauser;
GO
GRANT SELECT ON p_and_c.tier_2_report_text_results to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.tier_2_report_text_results to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.tier_2_report_text_results to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.tier_2_report_text_results to rl_p_and_c_d;
GO