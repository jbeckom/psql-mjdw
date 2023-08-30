CREATE TABLE p_and_c.raw_wsib (
	"Claim number" varchar(256) NOT NULL,
	"Claimant" varchar(256) NOT NULL,
	"Claim type" varchar(256) NOT NULL,
	"Claim status" varchar(256) NOT NULL,
	"Fatality status" varchar(256) NOT NULL,
	"Accident date" varchar(256) NOT NULL,
	"Registration date" varchar(256) NULL,
	"Claimant age at accident" varchar(256) NULL,
	"Gender" varchar(256) NOT NULL,
	"Nature of injury" varchar(256) NOT NULL,
	"Source of injury" varchar(256) NOT NULL,
	"Source of injury - detailed" varchar(256) NULL,
	"Part of body" varchar(256) NOT NULL,
	"Part of body - detailed" varchar(256) NULL,
	"Injury event" varchar(256) NOT NULL,
	"Injury event - detailed" varchar(256) NULL,
	"Occupation" varchar(256) NOT NULL,
	"Occupation - detailed" varchar(256) NULL,
	"Mental stress claim" varchar(256) NOT NULL,
	"Mental stress type" varchar(256) NOT NULL,
	"Occupational disease claim" varchar(256) NOT NULL,
	"Category description 1" varchar(256) NOT NULL,
	"Category description 2" varchar(256) NOT NULL,
	"Category description 3" varchar(256) NOT NULL,
	"Category description 4" varchar(256) NOT NULL,
	"Traumatic fatality claim" varchar(256) NOT NULL,
	"Primary cause of death" varchar(256) NOT NULL,
	"Secondary cause of death" varchar(256) NOT NULL,
	"Date of death" varchar(256) NOT NULL,
	"NAICS code" varchar(256) NOT NULL,
	"NAICS description" varchar(256) NOT NULL,
	"Class/subclass code" varchar(256) NOT NULL,
	"Class/subclass description" varchar(256) NOT NULL,
	"Rate group code" varchar(256) NOT NULL,
	"Rate group description" varchar(256) NOT NULL,
	"Industry sector" varchar(256) NOT NULL,
	"Industry sector description" varchar(256) NOT NULL,
	"Return to work outcome" varchar(256) NOT NULL,
	"Total days Lost" varchar(256) NOT NULL,
	"Has Received LOE" varchar(256) NOT NULL,
	"Currently on LOE" varchar(256) NOT NULL,
	"Benefit month" varchar(256) NOT NULL,
	"Benefit group" varchar(256) NOT NULL,
	"Benefit type" varchar(256) NOT NULL,
	"Benefit amount" varchar(256) NOT NULL,
	filename varchar(256) NOT NULL,
	uploaded_at varchar(256) NOT NULL,
	"Occupation description" varchar(512) NULL,
	"COVID-19 claim" varchar(256) NULL,
	"Nature of injury Category" varchar(256) NULL,
	"Source of injury Category" varchar(256) NULL,
	"Source of injury Subcategory" varchar(256) NULL,
	"Part of body Category" varchar(256) NULL,
	"Part of body Subcategory" varchar(256) NULL,
	"Occupation Category" varchar(256) NULL,
	"Occupation Subcategory" varchar(256) NULL,
	"Injury event Category" varchar(256) NULL,
	"Injury event Subcategory" varchar(256) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_wsib OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_wsib to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_wsib to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_wsib to rpauser;
GO
GRANT SELECT ON p_and_c.raw_wsib to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_wsib to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_wsib to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_wsib to rl_p_and_c_d;
GO