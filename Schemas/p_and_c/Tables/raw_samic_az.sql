CREATE TABLE p_and_c.raw_samic_az (
	"Carrier" varchar(256) NOT NULL,
	"Coverage_Line" varchar(256) NOT NULL,
	"Policy_Number" varchar(256) NOT NULL,
	"Claim_Number" varchar(256) NOT NULL,
	"Claim_Status" varchar(256) NOT NULL,
	"Date_Of_Loss" varchar(256) NOT NULL,
	"Loss_Description" varchar(256) NOT NULL,
	"Date_Closed" varchar(256) NULL,
	"Incurred_Losses" varchar(256) NOT NULL,
	"Net_Losses" varchar(256) NOT NULL,
	"Paid_Losses" varchar(256) NOT NULL,
	"Reserved_Losses" varchar(256) NOT NULL,
	"Paid_Expenses" varchar(256) NOT NULL,
	filename varchar(256) NOT NULL,
	uploaded_at varchar(256) NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_samic_az OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_samic_az to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_samic_az to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_samic_az to rpauser;
GO
GRANT SELECT ON p_and_c.raw_samic_az to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_samic_az to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_samic_az to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_samic_az to rl_p_and_c_d;
GO