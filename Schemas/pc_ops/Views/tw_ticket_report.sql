CREATE OR REPLACE VIEW pc_ops.tw_ticket_report
AS SELECT a."ID",
    a."URL",
    a."Subject",
    a."Inbox",
    a."Status",
    a."Type",
    a."Source",
    a."Priority",
    a."Tagged",
    a."Agent",
    a."Customer",
    a."Email",
    a."Company",
    a."HappinessRating",
    a."HappinessComment",
    a."TimeTracked",
    a."TimeBilled",
    a."ResponseTime",
    a."ResolutionTime",
    a."CreatedAt",
    a."UpdatedAt",
    a.uploaded_at
   FROM pc_ops.tw_tickets a
     LEFT JOIN pc_ops.tw_tickets b ON a."ID" = b."ID" AND a.uploaded_at::date < b.uploaded_at::date
  WHERE b.uploaded_at IS NULL AND a.uploaded_at IS NOT NULL;
GO/*** PERMISSIONS ***/
ALTER VIEW pc_ops.tw_ticket_report OWNER TO mj_admin;
GO

Grant select on table pc_ops.tw_ticket_report to rl_pc_data_analyst;
GO

Grant select on table pc_ops.tw_ticket_report to rl_pc_rpa_developer;
GO

Grant select on table pc_ops.tw_ticket_report to rpauser;
GO
GRANT SELECT ON pc_ops.tw_ticket_report to rl_pc_ops_r;
GO

GRANT INSERT ON pc_ops.tw_ticket_report to rl_pc_ops_a;
GO

GRANT UPDATE ON pc_ops.tw_ticket_report to rl_pc_ops_w;
GO

GRANT DELETE ON pc_ops.tw_ticket_report to rl_pc_ops_d;
GO