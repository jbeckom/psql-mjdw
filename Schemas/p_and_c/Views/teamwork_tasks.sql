CREATE OR REPLACE VIEW p_and_c.teamwork_tasks
AS SELECT b."TASKLIST",
    b."TASK",
    b."DESCRIPTION",
    b."ASSIGN TO",
    b."START DATE",
    b."DUE DATE",
    b."PRIORITY",
    b."ESTIMATED TIME",
    b."TAGS",
    b."STATUS"
   FROM ( SELECT a."TASKLIST",
            a."TASK",
            a."DESCRIPTION",
            a."ASSIGN TO",
            a."START DATE",
            a."DUE DATE",
            a."PRIORITY",
            a."ESTIMATED TIME",
            a."TAGS",
            a."STATUS"
           FROM ( SELECT concat(x_client_journey_task_lists.client_id, ' - ', x_client_journey_task_lists.policy_end_date, ' - ', x_client_journey_task_lists.template) AS "TASKLIST",
                    'Upload New Policy and Exposure Data'::text AS "TASK",
                    NULL::text AS "DESCRIPTION",
                    NULL::text AS "ASSIGN TO",
                    NULL::text AS "START DATE",
                    x_client_journey_task_lists.policy_end_date + 10 - 365 AS "DUE DATE",
                    NULL::text AS "PRIORITY",
                    NULL::text AS "ESTIMATED TIME",
                    NULL::text AS "TAGS",
                    'Active'::text AS "STATUS",
                    1 AS "order"
                   FROM p_and_c.x_client_journey_task_lists
                  WHERE "left"(x_client_journey_task_lists.classification, 1) = 'A'::text AND x_client_journey_task_lists.template ~~* '%client journey%'::text
                UNION ALL
                 SELECT concat(x_client_journey_task_lists.client_id, ' - ', x_client_journey_task_lists.policy_end_date, ' - ', x_client_journey_task_lists.template) AS "TASKLIST",
                    'Policy Map'::text AS "TASK",
                    NULL::text AS "DESCRIPTION",
                    NULL::text AS "ASSIGN TO",
                    NULL::text AS "START DATE",
                    x_client_journey_task_lists.policy_end_date + 15 - 365 AS "DUE DATE",
                    NULL::text AS "PRIORITY",
                    NULL::text AS "ESTIMATED TIME",
                    NULL::text AS "TAGS",
                    'Active'::text AS "STATUS",
                    2 AS "order"
                   FROM p_and_c.x_client_journey_task_lists
                  WHERE "left"(x_client_journey_task_lists.classification, 1) = 'A'::text AND x_client_journey_task_lists.template ~~* '%client journey%'::text
                UNION ALL
                 SELECT concat(x_client_journey_task_lists.client_id, ' - ', x_client_journey_task_lists.policy_end_date, ' - ', x_client_journey_task_lists.template) AS "TASKLIST",
                    'Mod Projection'::text AS "TASK",
                    NULL::text AS "DESCRIPTION",
                    NULL::text AS "ASSIGN TO",
                    NULL::text AS "START DATE",
                    x_client_journey_task_lists.policy_end_date + 185 - 365 AS "DUE DATE",
                    NULL::text AS "PRIORITY",
                    NULL::text AS "ESTIMATED TIME",
                    NULL::text AS "TAGS",
                    'Active'::text AS "STATUS",
                    3 AS "order"
                   FROM p_and_c.x_client_journey_task_lists
                  WHERE "left"(x_client_journey_task_lists.classification, 1) = 'A'::text AND x_client_journey_task_lists.template ~~* '%client journey%'::text
                UNION ALL
                 SELECT concat(x_client_journey_task_lists.client_id, ' - ', x_client_journey_task_lists.policy_end_date, ' - ', x_client_journey_task_lists.template) AS "TASKLIST",
                    'Upload Audit Data'::text AS "TASK",
                    NULL::text AS "DESCRIPTION",
                    NULL::text AS "ASSIGN TO",
                    NULL::text AS "START DATE",
                    x_client_journey_task_lists.policy_end_date + 100 - 365 AS "DUE DATE",
                    NULL::text AS "PRIORITY",
                    NULL::text AS "ESTIMATED TIME",
                    NULL::text AS "TAGS",
                    'Active'::text AS "STATUS",
                    4 AS "order"
                   FROM p_and_c.x_client_journey_task_lists
                  WHERE "left"(x_client_journey_task_lists.classification, 1) = 'A'::text AND x_client_journey_task_lists.template ~~* '%client journey%'::text
                UNION ALL
                 SELECT concat(x_client_journey_task_lists.client_id, ' - ', x_client_journey_task_lists.policy_end_date, ' - ', x_client_journey_task_lists.template) AS "TASKLIST",
                    'Loss Summary'::text AS "TASK",
                    NULL::text AS "DESCRIPTION",
                    NULL::text AS "ASSIGN TO",
                    NULL::text AS "START DATE",
                    x_client_journey_task_lists.policy_end_date + 235 - 365 AS "DUE DATE",
                    NULL::text AS "PRIORITY",
                    NULL::text AS "ESTIMATED TIME",
                    NULL::text AS "TAGS",
                    'Active'::text AS "STATUS",
                    6 AS "order"
                   FROM p_and_c.x_client_journey_task_lists
                  WHERE "left"(x_client_journey_task_lists.classification, 1) = 'A'::text AND x_client_journey_task_lists.template ~~* '%client journey%'::text
                UNION ALL
                 SELECT concat(x_client_journey_task_lists.client_id, ' - ', x_client_journey_task_lists.policy_end_date, ' - ', x_client_journey_task_lists.template) AS "TASKLIST",
                    '-Loss Runs'::text AS "TASK",
                    NULL::text AS "DESCRIPTION",
                    NULL::text AS "ASSIGN TO",
                    NULL::text AS "START DATE",
                    x_client_journey_task_lists.policy_end_date + 230 - 365 AS "DUE DATE",
                    NULL::text AS "PRIORITY",
                    NULL::text AS "ESTIMATED TIME",
                    NULL::text AS "TAGS",
                    'Active'::text AS "STATUS",
                    7 AS "order"
                   FROM p_and_c.x_client_journey_task_lists
                  WHERE "left"(x_client_journey_task_lists.classification, 1) = 'A'::text AND x_client_journey_task_lists.template ~~* '%client journey%'::text) a
          ORDER BY a."TASKLIST", a."order") b
UNION ALL
 SELECT d."TASKLIST",
    d."TASK",
    d."DESCRIPTION",
    d."ASSIGN TO",
    d."START DATE",
    d."DUE DATE",
    d."PRIORITY",
    d."ESTIMATED TIME",
    d."TAGS",
    d."STATUS"
   FROM ( SELECT c."TASKLIST",
            c."TASK",
            c."DESCRIPTION",
            c."ASSIGN TO",
            c."START DATE",
            c."DUE DATE",
            c."PRIORITY",
            c."ESTIMATED TIME",
            c."TAGS",
            c."STATUS"
           FROM ( SELECT concat(x_client_journey_task_lists.client_id, ' - ', x_client_journey_task_lists.policy_end_date, ' - ', x_client_journey_task_lists.template) AS "TASKLIST",
                    'Loss Summary'::text AS "TASK",
                    NULL::text AS "DESCRIPTION",
                    NULL::text AS "ASSIGN TO",
                    NULL::text AS "START DATE",
                    x_client_journey_task_lists.policy_end_date + 280 - 365 AS "DUE DATE",
                    NULL::text AS "PRIORITY",
                    NULL::text AS "ESTIMATED TIME",
                    NULL::text AS "TAGS",
                    'Active'::text AS "STATUS",
                    1 AS "order"
                   FROM p_and_c.x_client_journey_task_lists
                  WHERE "left"(x_client_journey_task_lists.classification, 1) = 'B'::text AND x_client_journey_task_lists.template ~~* '%client journey%'::text
                UNION ALL
                 SELECT concat(x_client_journey_task_lists.client_id, ' - ', x_client_journey_task_lists.policy_end_date, ' - ', x_client_journey_task_lists.template) AS "TASKLIST",
                    '-Loss Runs'::text AS "TASK",
                    NULL::text AS "DESCRIPTION",
                    NULL::text AS "ASSIGN TO",
                    NULL::text AS "START DATE",
                    x_client_journey_task_lists.policy_end_date + 275 - 365 AS "DUE DATE",
                    NULL::text AS "PRIORITY",
                    NULL::text AS "ESTIMATED TIME",
                    NULL::text AS "TAGS",
                    'Active'::text AS "STATUS",
                    2 AS "order"
                   FROM p_and_c.x_client_journey_task_lists
                  WHERE "left"(x_client_journey_task_lists.classification, 1) = 'B'::text AND x_client_journey_task_lists.template ~~* '%client journey%'::text) c
          ORDER BY c."TASKLIST", c."order") d
UNION ALL
 SELECT f."TASKLIST",
    f."TASK",
    f."DESCRIPTION",
    f."ASSIGN TO",
    f."START DATE",
    f."DUE DATE",
    f."PRIORITY",
    f."ESTIMATED TIME",
    f."TAGS",
    f."STATUS"
   FROM ( SELECT e."TASKLIST",
            e."TASK",
            e."DESCRIPTION",
            e."ASSIGN TO",
            e."START DATE",
            e."DUE DATE",
            e."PRIORITY",
            e."ESTIMATED TIME",
            e."TAGS",
            e."STATUS"
           FROM ( SELECT concat(x_client_journey_task_lists.client_id, ' - ', x_client_journey_task_lists.policy_end_date, ' - ', x_client_journey_task_lists.template) AS "TASKLIST",
                    'Loss Runs'::text AS "TASK",
                    NULL::text AS "DESCRIPTION",
                    NULL::text AS "ASSIGN TO",
                    NULL::text AS "START DATE",
                    x_client_journey_task_lists.policy_end_date + 275 - 365 AS "DUE DATE",
                    NULL::text AS "PRIORITY",
                    NULL::text AS "ESTIMATED TIME",
                    NULL::text AS "TAGS",
                    'Active'::text AS "STATUS",
                    1 AS "order"
                   FROM p_and_c.x_client_journey_task_lists
                  WHERE ("left"(x_client_journey_task_lists.classification, 1) = ANY (ARRAY['A'::text, 'B'::text])) AND x_client_journey_task_lists.template !~~* '%client journey%'::text) e
          ORDER BY e."TASKLIST", e."order") f;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.teamwork_tasks OWNER TO mj_admin;
GO

Grant select on table p_and_c.teamwork_tasks to rl_pc_data_analyst;
GO

Grant select on table p_and_c.teamwork_tasks to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.teamwork_tasks to rpauser;
GO
GRANT SELECT ON p_and_c.teamwork_tasks to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.teamwork_tasks to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.teamwork_tasks to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.teamwork_tasks to rl_p_and_c_d;
GO