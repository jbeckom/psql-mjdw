CREATE TABLE p_and_c.advisen_extra_lobs (
	sic_category_id varchar(1) NOT NULL,
	extra_lob_1 varchar(64) NULL,
	extra_lob_2 varchar(64) NULL,
	extra_lob_3 varchar(64) NULL,
	extra_lob_4 varchar(64) NULL,
	extra_lob_cnt int4 NULL,
	CONSTRAINT advisen_extra_lobs_pkey PRIMARY KEY (sic_category_id)
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.advisen_extra_lobs OWNER TO mj_admin;
GO

Grant select on table p_and_c.advisen_extra_lobs to rl_pc_data_analyst;
GO

Grant update, insert, select on table p_and_c.advisen_extra_lobs to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.advisen_extra_lobs to rpauser;
GO
GRANT SELECT ON p_and_c.advisen_extra_lobs to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.advisen_extra_lobs to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.advisen_extra_lobs to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.advisen_extra_lobs to rl_p_and_c_d;
GO