CREATE TABLE p_and_c.raw_fcci_detail_201906 (
	polno varchar(20) NOT NULL,
	polname varchar(42) NOT NULL,
	classcd varchar(5) NOT NULL,
	claimno varchar(23) NOT NULL,
	clmstat varchar(1) NOT NULL,
	closdate varchar(9) NULL,
	reptdate varchar(9) NOT NULL,
	accdate varchar(9) NOT NULL,
	dateofhire varchar(9) NULL,
	occup varchar(15) NULL,
	acctime varchar(5) NULL,
	dipdind numeric(13,7) NULL,
	dipdmed numeric(14,8) NULL,
	dipdls_n numeric(16,9) NOT NULL,
	dipddcc numeric(15,9) NOT NULL,
	dipdsub numeric(13,6) NOT NULL,
	dicsdcc numeric(15,9) NOT NULL,
	dirptl_dcc_n numeric(16,9) NOT NULL,
	deducamt int4 NULL,
	firstname varchar(11) NULL,
	polyefdt varchar(9) NOT NULL,
	polytmdt varchar(9) NOT NULL,
	lossdesc varchar(256) NULL,
	lobsum varchar(2) NOT NULL,
	clm_type varchar(2) NULL,
	injcause varchar(43) NULL,
	lastname varchar(50) NOT NULL,
	dicsls numeric(16,9) NOT NULL,
	drpdls numeric(14,8) NOT NULL,
	dipdtot numeric(16,9) NOT NULL,
	dicstot numeric(16,9) NOT NULL,
	diidtot numeric(13,7) NULL,
	dimdtot numeric(15,9) NULL,
	ca_city varchar(17) NULL,
	ca_state varchar(2) NULL,
	address1 varchar(30) NULL,
	address2 varchar(10) NULL,
	city varchar(16) NULL,
	state varchar(2) NULL,
	zip5 int4 NULL,
	carrier varchar(33) NOT NULL,
	injbdprt varchar(35) NULL,
	injnatr varchar(35) NULL,
	injtype varchar(28) NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_fcci_detail_201906 OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_fcci_detail_201906 to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_fcci_detail_201906 to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_fcci_detail_201906 to rpauser;
GO
GRANT SELECT ON p_and_c.raw_fcci_detail_201906 to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_fcci_detail_201906 to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_fcci_detail_201906 to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_fcci_detail_201906 to rl_p_and_c_d;
GO