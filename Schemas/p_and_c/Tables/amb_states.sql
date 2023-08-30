DROP TABLE p_and_c.amb_states;
GO

CREATE TABLE p_and_c.amb_states (
	"Company" varchar(53) NOT NULL,
	"Year" int4 NULL,
	"Status_in_All_States,_DC_and_Territories" varchar(32) NULL,
	"Status_in_All_States_and_DC" varchar(32) NULL,
	"Status_in_Any_State/DC/Territory" varchar(32) NULL,
	"Status_in_Alabama" varchar(32) NULL,
	"Status_in_Alaska" varchar(32) NULL,
	"Status_in_Arizona" varchar(32) NULL,
	"Status_in_Arkansas" varchar(32) NULL,
	"Status_in_California" varchar(32) NULL,
	"Status_in_Colorado" varchar(32) NULL,
	"Status_in_Connecticut" varchar(32) NULL,
	"Status_in_Delaware" varchar(32) NULL,
	"Status_in_District_of_Columbia" varchar(32) NULL,
	"Status_in_Florida" varchar(32) NULL,
	"Status_in_Georgia" varchar(32) NULL,
	"Status_in_Hawaii" varchar(32) NULL,
	"Status_in_Idaho" varchar(32) NULL,
	"Status_in_Illinois" varchar(32) NULL,
	"Status_in_Indiana" varchar(32) NULL,
	"Status_in_Iowa" varchar(32) NULL,
	"Status_in_Kansas" varchar(32) NULL,
	"Status_in_Kentucky" varchar(32) NULL,
	"Status_in_Louisiana" varchar(32) NULL,
	"Status_in_Maine" varchar(32) NULL,
	"Status_in_Maryland" varchar(32) NULL,
	"Status_in_Massachusetts" varchar(32) NULL,
	"Status_in_Michigan" varchar(32) NULL,
	"Status_in_Minnesota" varchar(32) NULL,
	"Status_in_Mississippi" varchar(32) NULL,
	"Status_in_Missouri" varchar(32) NULL,
	"Status_in_Montana" varchar(32) NULL,
	"Status_in_Nebraska" varchar(32) NULL,
	"Status_in_Nevada" varchar(32) NULL,
	"Status_in_New_Hampshire" varchar(32) NULL,
	"Status_in_New_Jersey" varchar(32) NULL,
	"Status_in_New_Mexico" varchar(32) NULL,
	"Status_in_New_York" varchar(32) NULL,
	"Status_in_North_Carolina" varchar(32) NULL,
	"Status_in_North_Dakota" varchar(32) NULL,
	"Status_in_Ohio" varchar(32) NULL,
	"Status_in_Oklahoma" varchar(32) NULL,
	"Status_in_Oregon" varchar(32) NULL,
	"Status_in_Pennsylvania" varchar(32) NULL,
	"Status_in_Rhode_Island" varchar(32) NULL,
	"Status_in_South_Carolina" varchar(32) NULL,
	"Status_in_South_Dakota" varchar(32) NULL,
	"Status_in_Tennessee" varchar(32) NULL,
	"Status_in_Texas" varchar(32) NULL,
	"Status_in_Utah" varchar(32) NULL,
	"Status_in_Vermont" varchar(32) NULL,
	"Status_in_Virginia" varchar(32) NULL,
	"Status_in_Washington" varchar(32) NULL,
	"Status_in_West_Virginia" varchar(32) NULL,
	"Status_in_Wisconsin" varchar(32) NULL,
	"Status_in_Wyoming" varchar(32) NULL,
	"Status_in_American_Samoa" varchar(32) NULL,
	"Status_in_Guam" varchar(32) NULL,
	"Status_in_Northern_Mariana_Islands" varchar(32) NULL,
	"Status_in_Puerto_Rico" varchar(32) NULL,
	"Status_in_US_Virgin_Islands" varchar(32) NULL,
	uploaded_at timestamp(0) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.amb_states OWNER TO mj_admin;
GO

Grant select on table p_and_c.amb_states to rl_pc_data_analyst;
GO

Grant update, insert, select on table p_and_c.amb_states to rl_pc_rpa_developer;
GO

Grant select,update,insert on table p_and_c.amb_states to rpauser;
GO

GRANT SELECT ON p_and_c.amb_states to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.amb_states to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.amb_states to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.amb_states to rl_p_and_c_d;
GO