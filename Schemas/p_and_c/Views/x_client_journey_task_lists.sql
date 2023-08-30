CREATE OR REPLACE VIEW p_and_c.x_client_journey_task_lists
AS SELECT y.classification,
    y.client_id,
    y.name,
    y.policy_end_date,
    y.template
   FROM ( SELECT DISTINCT x.classification,
            x.client_id,
            x.name,
            x.policy_end_date,
            x.array_to_string AS template
           FROM ( SELECT COALESCE(a.classification::text, a.classification::text) AS classification,
                    a.client_id,
                    b.name,
                    a.policy_end_date,
                        CASE
                            WHEN array_to_string(array_agg(a.coverage_type_id), ','::text) ~~* '%WCO%'::text OR array_to_string(array_agg(a.coverage_type_id), ','::text) ~~* '%WAR%'::text THEN concat('Client Journey', ' - ', array_to_string(array_agg(DISTINCT a.coverage_type_id), ','::text))
                            ELSE array_to_string(array_agg(DISTINCT a.coverage_type_id), ','::text)
                        END AS array_to_string,
                    dense_rank() OVER (ORDER BY a.uploaded_at DESC) AS rank_number
                   FROM p_and_c.active_policies a
                     LEFT JOIN p_and_c.clients b ON a.client_id::text = b.id::text
                  WHERE (a.coverage_type_id::text <> ALL (ARRAY['MKT'::text, 'FLC'::text, 'BDR'::text, 'RRP'::text, 'OCP'::text, 'AFE'::character varying::text, 'RSF'::text, 'NOT'::text, 'PER'::text, 'MNB'::text, 'MAI'::text, 'BID'::text, 'MRE'::text, 'MCO'::text, 'MCC'::text, 'SUB'::text, 'TER'::text, 'REC'::text, 'FID'::text, 'SUR'::text, 'CRC'::text, 'PAC'::text, 'BLR'::text])) AND (COALESCE("left"(a.classification::text, 1), a.classification::text) = ANY (ARRAY['A'::bpchar::text, 'B'::bpchar::text])) AND NOT (a.client_id::text IN ( SELECT DISTINCT client_journey_override.client_id
                           FROM p_and_c.client_journey_override))
                  GROUP BY a.classification, b.name, a.client_id, a.policy_end_date, a.uploaded_at
                UNION
                 SELECT COALESCE(a.classification, a.classification::text::character varying) AS classification,
                    a.client_id,
                    b.name,
                    a.policy_end_date,
                    array_to_string(array_agg(DISTINCT a.coverage_type_id), ','::text) AS array_to_string,
                    dense_rank() OVER (ORDER BY a.uploaded_at DESC) AS rank_number
                   FROM p_and_c.active_policies a
                     LEFT JOIN p_and_c.clients b ON a.client_id::text = b.id::text
                  WHERE (a.coverage_type_id::text <> ALL (ARRAY['MKT'::text, 'FLC'::text, 'BDR'::text, 'RRP'::text, 'OCP'::text, 'AFE'::character varying::text, 'RSF'::text, 'NOT'::text, 'PER'::text, 'MNB'::text, 'MAI'::text, 'BID'::text, 'MRE'::text, 'MCO'::text, 'MCC'::text, 'SUB'::text, 'TER'::text, 'REC'::text, 'FID'::text, 'SUR'::text, 'CRC'::text, 'PAC'::text, 'BLR'::text])) AND (COALESCE("left"(a.classification::text, 1), a.classification::text) <> ALL (ARRAY['A'::bpchar::text, 'B'::bpchar::text])) AND NOT (a.client_id::text IN ( SELECT DISTINCT client_journey_override.client_id
                           FROM p_and_c.client_journey_override))
                  GROUP BY a.classification, b.name, a.client_id, a.policy_end_date, a.uploaded_at
                UNION
                 SELECT COALESCE(a.classification::text, a.classification::text) AS classification,
                    a.client_id,
                    b.name,
                    a.policy_end_date,
                    array_to_string(array_agg(DISTINCT a.coverage_type_id), ','::text) AS array_to_string,
                    dense_rank() OVER (ORDER BY a.uploaded_at DESC) AS rank_number
                   FROM p_and_c.active_policies a
                     LEFT JOIN p_and_c.clients b ON a.client_id::text = b.id::text
                  WHERE a.coverage_type_id::text = ANY (ARRAY['BDR'::text, 'RRP'::text, 'OCP'::text, 'CRC'::text, 'PAC'::text, 'FLC'::text, 'BLR'::text])
                  GROUP BY a.classification, b.name, a.client_id, a.policy_end_date, a.uploaded_at
                UNION
                 SELECT COALESCE(a.classification::text, a.classification::text) AS classification,
                    a.client_id,
                    b.name,
                    a.policy_end_date,
                        CASE
                            WHEN date_part('month'::text, a.policy_end_date) = c.month::double precision AND date_part('day'::text, a.policy_end_date) = c.day::double precision THEN concat('Client Journey', ' - ', array_to_string(array_agg(DISTINCT a.coverage_type_id), ','::text))
                            ELSE array_to_string(array_agg(DISTINCT a.coverage_type_id), ','::text)
                        END AS array_to_string,
                    dense_rank() OVER (ORDER BY a.uploaded_at DESC) AS rank_number
                   FROM p_and_c.active_policies a
                     LEFT JOIN p_and_c.clients b ON a.client_id::text = b.id::text
                     LEFT JOIN p_and_c.client_journey_override c ON b.id::text = c.client_id::text
                  WHERE (a.coverage_type_id::text <> ALL (ARRAY['MKT'::text, 'FLC'::text, 'BDR'::text, 'RRP'::text, 'OCP'::text, 'AFE'::character varying::text, 'RSF'::text, 'NOT'::text, 'PER'::text, 'MNB'::text, 'MAI'::text, 'BID'::text, 'MRE'::text, 'MCO'::text, 'MCC'::text, 'SUB'::text, 'TER'::text, 'REC'::text, 'FID'::text, 'SUR'::text, 'CRC'::text, 'PAC'::text, 'BLR'::text])) AND (COALESCE("left"(a.classification::text, 1), a.classification::text) = ANY (ARRAY['A'::bpchar::text, 'B'::bpchar::text])) AND (a.client_id::text IN ( SELECT DISTINCT client_journey_override.client_id
                           FROM p_and_c.client_journey_override))
                  GROUP BY a.classification, b.name, a.client_id, a.policy_end_date, c.month, c.day, a.uploaded_at) x
          WHERE x.rank_number = 1
        EXCEPT
         SELECT DISTINCT x.classification,
            x.client_id,
            x.name,
            x.policy_end_date,
            x.array_to_string AS template
           FROM ( SELECT COALESCE(a.classification::text, a.classification::text) AS classification,
                    a.client_id,
                    b.name,
                    a.policy_end_date,
                        CASE
                            WHEN array_to_string(array_agg(a.coverage_type_id), ','::text) ~~* '%WCO%'::text OR array_to_string(array_agg(a.coverage_type_id), ','::text) ~~* '%WAR%'::text THEN concat('Client Journey', ' - ', array_to_string(array_agg(DISTINCT a.coverage_type_id), ','::text))
                            ELSE array_to_string(array_agg(DISTINCT a.coverage_type_id), ','::text)
                        END AS array_to_string,
                    dense_rank() OVER (ORDER BY a.uploaded_at DESC) AS rank_number
                   FROM p_and_c.active_policies a
                     LEFT JOIN p_and_c.clients b ON a.client_id::text = b.id::text
                  WHERE (a.coverage_type_id::text <> ALL (ARRAY['MKT'::text, 'FLC'::text, 'BDR'::text, 'RRP'::text, 'OCP'::text, 'AFE'::character varying::text, 'RSF'::text, 'NOT'::text, 'PER'::text, 'MNB'::text, 'MAI'::text, 'BID'::text, 'MRE'::text, 'MCO'::text, 'MCC'::text, 'SUB'::text, 'TER'::text, 'REC'::text, 'FID'::text, 'SUR'::text, 'CRC'::text, 'PAC'::text, 'BLR'::text])) AND (COALESCE("left"(a.classification::text, 1), a.classification::text) = ANY (ARRAY['A'::bpchar::text, 'B'::bpchar::text])) AND NOT (a.client_id::text IN ( SELECT DISTINCT client_journey_override.client_id
                           FROM p_and_c.client_journey_override))
                  GROUP BY a.classification, b.name, a.client_id, a.policy_end_date, a.uploaded_at
                UNION
                 SELECT COALESCE(a.classification, a.classification::text::character varying) AS classification,
                    a.client_id,
                    b.name,
                    a.policy_end_date,
                    array_to_string(array_agg(DISTINCT a.coverage_type_id), ','::text) AS array_to_string,
                    dense_rank() OVER (ORDER BY a.uploaded_at DESC) AS rank_number
                   FROM p_and_c.active_policies a
                     LEFT JOIN p_and_c.clients b ON a.client_id::text = b.id::text
                  WHERE (a.coverage_type_id::text <> ALL (ARRAY['MKT'::text, 'FLC'::text, 'BDR'::text, 'RRP'::text, 'OCP'::text, 'AFE'::character varying::text, 'RSF'::text, 'NOT'::text, 'PER'::text, 'MNB'::text, 'MAI'::text, 'BID'::text, 'MRE'::text, 'MCO'::text, 'MCC'::text, 'SUB'::text, 'TER'::text, 'REC'::text, 'FID'::text, 'SUR'::text, 'CRC'::text, 'PAC'::text, 'BLR'::text])) AND (COALESCE("left"(a.classification::text, 1), a.classification::text) <> ALL (ARRAY['A'::bpchar::text, 'B'::bpchar::text])) AND NOT (a.client_id::text IN ( SELECT DISTINCT client_journey_override.client_id
                           FROM p_and_c.client_journey_override))
                  GROUP BY a.classification, b.name, a.client_id, a.policy_end_date, a.uploaded_at
                UNION
                 SELECT COALESCE(a.classification::text, a.classification::text) AS classification,
                    a.client_id,
                    b.name,
                    a.policy_end_date,
                    array_to_string(array_agg(DISTINCT a.coverage_type_id), ','::text) AS array_to_string,
                    dense_rank() OVER (ORDER BY a.uploaded_at DESC) AS rank_number
                   FROM p_and_c.active_policies a
                     LEFT JOIN p_and_c.clients b ON a.client_id::text = b.id::text
                  WHERE a.coverage_type_id::text = ANY (ARRAY['BDR'::text, 'RRP'::text, 'OCP'::text, 'CRC'::text, 'PAC'::text, 'FLC'::text, 'BLR'::text])
                  GROUP BY a.classification, b.name, a.client_id, a.policy_end_date, a.uploaded_at
                UNION
                 SELECT COALESCE(a.classification::text, a.classification::text) AS classification,
                    a.client_id,
                    b.name,
                    a.policy_end_date,
                        CASE
                            WHEN date_part('month'::text, a.policy_end_date) = c.month::double precision AND date_part('day'::text, a.policy_end_date) = c.day::double precision THEN concat('Client Journey', ' - ', array_to_string(array_agg(DISTINCT a.coverage_type_id), ','::text))
                            ELSE array_to_string(array_agg(DISTINCT a.coverage_type_id), ','::text)
                        END AS array_to_string,
                    dense_rank() OVER (ORDER BY a.uploaded_at DESC) AS rank_number
                   FROM p_and_c.active_policies a
                     LEFT JOIN p_and_c.clients b ON a.client_id::text = b.id::text
                     LEFT JOIN p_and_c.client_journey_override c ON b.id::text = c.client_id::text
                  WHERE (a.coverage_type_id::text <> ALL (ARRAY['MKT'::text, 'FLC'::text, 'BDR'::text, 'RRP'::text, 'OCP'::text, 'AFE'::character varying::text, 'RSF'::text, 'NOT'::text, 'PER'::text, 'MNB'::text, 'MAI'::text, 'BID'::text, 'MRE'::text, 'MCO'::text, 'MCC'::text, 'SUB'::text, 'TER'::text, 'REC'::text, 'FID'::text, 'SUR'::text, 'CRC'::text, 'PAC'::text, 'BLR'::text])) AND (COALESCE("left"(a.classification::text, 1), a.classification::text) = ANY (ARRAY['A'::bpchar::text, 'B'::bpchar::text])) AND (a.client_id::text IN ( SELECT DISTINCT client_journey_override.client_id
                           FROM p_and_c.client_journey_override))
                  GROUP BY a.classification, b.name, a.client_id, a.policy_end_date, c.month, c.day, a.uploaded_at) x
          WHERE x.rank_number = 2) y
  ORDER BY y.classification, y.client_id, y.policy_end_date;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.x_client_journey_task_lists OWNER TO mj_admin;
GO

Grant select on table p_and_c.x_client_journey_task_lists to rl_pc_data_analyst;
GO

Grant select on table p_and_c.x_client_journey_task_lists to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.x_client_journey_task_lists to rpauser;
GO
GRANT SELECT ON p_and_c.x_client_journey_task_lists to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.x_client_journey_task_lists to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.x_client_journey_task_lists to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.x_client_journey_task_lists to rl_p_and_c_d;
GO