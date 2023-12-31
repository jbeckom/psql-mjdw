DROP TABLE IF EXISTS p_and_c.tier_2_fleet_answers CASCADE;
GO

CREATE TABLE p_and_c.tier_2_fleet_answers (
	id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	response_id int4 NOT NULL,
	group_name varchar(256) NULL,
	start_date varchar(256) NULL,
	completion_date varchar(256) NOT NULL,
	bcc_report_address varchar(256) NULL,
	company_name varchar(256) NULL,
	corporate int4 NULL,
	headquarters int4 NULL,
	branch int4 NULL,
	location_name varchar(256) NULL,
	respondent varchar(256) NULL,
	email varchar(256) NULL,
	title varchar(256) NULL,
	"0_5_veh" int4 NOT NULL,
	"6_25_veh" int4 NOT NULL,
	"26_49_veh" int4 NOT NULL,
	"50_veh" int4 NOT NULL,
	no_trucks int4 NOT NULL,
	"1_5_trucks" int4 NOT NULL,
	"6_14_trucks" int4 NOT NULL,
	"15_trucks" int4 NOT NULL,
	"1_5_drivers" int4 NOT NULL,
	"6_24_drivers" int4 NOT NULL,
	"25_drivers" int4 NOT NULL,
	"local" int4 NOT NULL,
	intermediate int4 NOT NULL,
	long_haul int4 NOT NULL,
	rural int4 NOT NULL,
	interstate int4 NOT NULL,
	urban int4 NOT NULL,
	less_15000 int4 NOT NULL,
	"15000_40000" int4 NOT NULL,
	more_40000 int4 NOT NULL,
	less_500000 int4 NOT NULL,
	"500000_1000000" int4 NOT NULL,
	more_1000000 int4 NOT NULL,
	yes1 int4 NOT NULL,
	no1 int4 NOT NULL,
	part1 int4 NOT NULL,
	uns1 int4 NOT NULL,
	"1_10_emp" int4 NOT NULL,
	"11_24_emp" int4 NOT NULL,
	"25_emp" int4 NOT NULL,
	yes2 int4 NOT NULL,
	no2 int4 NOT NULL,
	part2 int4 NOT NULL,
	uns2 int4 NOT NULL,
	wraps int4 NOT NULL,
	special int4 NOT NULL,
	other int4 NOT NULL,
	"none" int4 NOT NULL,
	yes3 int4 NOT NULL,
	no3 int4 NOT NULL,
	special1 int4 NOT NULL,
	special2 int4 NOT NULL,
	special3 int4 NOT NULL,
	special4 int4 NOT NULL,
	special5 int4 NOT NULL,
	special6 int4 NOT NULL,
	special_none int4 NOT NULL,
	yes4 int4 NOT NULL,
	no4 int4 NOT NULL,
	part4 int4 NOT NULL,
	uns4 int4 NOT NULL,
	yes5 int4 NOT NULL,
	no5 int4 NOT NULL,
	part5 int4 NOT NULL,
	uns5 int4 NOT NULL,
	yes6 int4 NOT NULL,
	no6 int4 NOT NULL,
	part6 int4 NOT NULL,
	uns6 int4 NOT NULL,
	yes7 int4 NOT NULL,
	no7 int4 NOT NULL,
	part7 int4 NOT NULL,
	uns7 int4 NOT NULL,
	yes8 int4 NOT NULL,
	no8 int4 NOT NULL,
	part8 int4 NOT NULL,
	uns8 int4 NOT NULL,
	yes9 int4 NOT NULL,
	no9 int4 NOT NULL,
	part9 int4 NOT NULL,
	uns9 int4 NOT NULL,
	yes10 int4 NOT NULL,
	no10 int4 NOT NULL,
	part10 int4 NOT NULL,
	uns10 int4 NOT NULL,
	program1 int4 NOT NULL,
	program2 int4 NOT NULL,
	program3 int4 NOT NULL,
	program4 int4 NOT NULL,
	program5 int4 NOT NULL,
	program_none int4 NOT NULL,
	yes11 int4 NOT NULL,
	no11 int4 NOT NULL,
	part11 int4 NOT NULL,
	uns11 int4 NOT NULL,
	internally int4 NOT NULL,
	outsourced int4 NOT NULL,
	yes12 int4 NOT NULL,
	no12 int4 NOT NULL,
	part12 int4 NOT NULL,
	uns12 int4 NOT NULL,
	yes13 int4 NOT NULL,
	no13 int4 NOT NULL,
	part13 int4 NOT NULL,
	uns13 int4 NOT NULL,
	yes14 int4 NOT NULL,
	no14 int4 NOT NULL,
	part14 int4 NOT NULL,
	uns14 int4 NOT NULL,
	yes15 int4 NOT NULL,
	no15 int4 NOT NULL,
	part15 int4 NOT NULL,
	uns15 int4 NOT NULL,
	yes16 int4 NOT NULL,
	no16 int4 NOT NULL,
	part16 int4 NOT NULL,
	uns16 int4 NOT NULL,
	yes17 int4 NOT NULL,
	no17 int4 NOT NULL,
	part17 int4 NOT NULL,
	uns17 int4 NOT NULL,
	hire int4 NOT NULL,
	monthly int4 NOT NULL,
	quarterly int4 NOT NULL,
	annually int4 NOT NULL,
	post int4 NOT NULL,
	defensive int4 NOT NULL,
	distracted int4 NOT NULL,
	cdl int4 NOT NULL,
	tech1 int4 NOT NULL,
	tech2 int4 NOT NULL,
	tech3 int4 NOT NULL,
	tech4 int4 NOT NULL,
	tech5 int4 NOT NULL,
	tech_none int4 NOT NULL,
	less_25 int4 NOT NULL,
	"25_75" int4 NOT NULL,
	more_75 int4 NOT NULL,
	yes18 int4 NOT NULL,
	no18 int4 NOT NULL,
	part18 int4 NOT NULL,
	uns18 int4 NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.tier_2_fleet_answers OWNER TO mj_admin;
GO

Grant select on table p_and_c.tier_2_fleet_answers to rl_pc_data_analyst;
GO

Grant update, insert, select on table p_and_c.tier_2_fleet_answers to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.tier_2_fleet_answers to rpauser;
GO

GRANT SELECT ON p_and_c.tier_2_fleet_answers to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.tier_2_fleet_answers to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.tier_2_fleet_answers to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.tier_2_fleet_answers to rl_p_and_c_d;
GO