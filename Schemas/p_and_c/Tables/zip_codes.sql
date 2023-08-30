CREATE TABLE p_and_c.zip_codes (
	zip int4 NOT NULL,
	lat numeric(8,5) NOT NULL,
	lng numeric(10,5) NOT NULL,
	city varchar(27) NOT NULL,
	state_id varchar(2) NOT NULL,
	state_name varchar(20) NOT NULL,
	zcta varchar(4) NOT NULL,
	parent_zcta varchar(30) NULL,
	population int4 NOT NULL,
	density numeric(7,1) NOT NULL,
	county_fips int4 NOT NULL,
	county_name varchar(21) NOT NULL,
	county_weights varchar(81) NOT NULL,
	county_names_all varchar(55) NOT NULL,
	county_fips_all varchar(35) NOT NULL,
	imprecise varchar(5) NOT NULL,
	military varchar(5) NOT NULL,
	timezone varchar(30) NOT NULL,
	CONSTRAINT zip_codes_pkey PRIMARY KEY (zip)
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.zip_codes OWNER TO mj_admin;
GO

Grant select on table p_and_c.zip_codes to rl_pc_data_analyst;
GO

Grant select on table p_and_c.zip_codes to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.zip_codes to rpauser;
GO
GRANT SELECT ON p_and_c.zip_codes to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.zip_codes to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.zip_codes to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.zip_codes to rl_p_and_c_d;
GO