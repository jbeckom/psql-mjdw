CREATE TABLE p_and_c.tiqs_product_liability (
	client varchar(512) NULL,
	product_distributed varchar(512) NULL,
	intended_use varchar(512) NULL,
	principal_components varchar(512) NULL,
	date_added varchar(512) NULL,
	date_discontinued varchar(512) NULL,
	notes varchar(512) NULL,
	id varchar(512) NULL,
	uploaded_at date NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.tiqs_product_liability OWNER TO mj_admin;
GO

Grant select on table p_and_c.tiqs_product_liability to rl_pc_data_analyst;
GO

Grant update, insert, select on table p_and_c.tiqs_product_liability to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.tiqs_product_liability to rpauser;
GO
GRANT SELECT ON p_and_c.tiqs_product_liability to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.tiqs_product_liability to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.tiqs_product_liability to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.tiqs_product_liability to rl_p_and_c_d;
GO