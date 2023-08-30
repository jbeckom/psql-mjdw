CREATE TABLE pc_ops.tw_tickets (
	"ID" int4 NOT NULL,
	"URL" varchar(256) NOT NULL,
	"Subject" varchar(256) NOT NULL,
	"Inbox" varchar(256) NOT NULL,
	"Status" varchar(256) NOT NULL,
	"Type" varchar(256) NOT NULL,
	"Source" varchar(256) NOT NULL,
	"Priority" varchar(256) NULL,
	"Tagged" varchar(256) NULL,
	"Agent" varchar(256) NULL,
	"Customer" varchar(256) NULL,
	"Email" varchar(256) NOT NULL,
	"Company" varchar(256) NULL,
	"HappinessRating" varchar(256) NULL,
	"HappinessComment" varchar(256) NULL,
	"TimeTracked" int4 NOT NULL,
	"TimeBilled" int4 NOT NULL,
	"ResponseTime" int4 NOT NULL,
	"ResolutionTime" int4 NOT NULL,
	"CreatedAt" varchar(256) NOT NULL,
	"UpdatedAt" varchar(256) NOT NULL,
	uploaded_at timestamp(0) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE pc_ops.tw_tickets OWNER TO mj_admin;
GO

Grant select on table pc_ops.tw_tickets to rl_pc_data_analyst;
GO

Grant update, insert, select on table pc_ops.tw_tickets to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table pc_ops.tw_tickets to rpauser;
GO
GRANT SELECT ON pc_ops.tw_tickets to rl_pc_ops_r;
GO

GRANT INSERT ON pc_ops.tw_tickets to rl_pc_ops_a;
GO

GRANT UPDATE ON pc_ops.tw_tickets to rl_pc_ops_w;
GO

GRANT DELETE ON pc_ops.tw_tickets to rl_pc_ops_d;
GO