CREATE TABLE p_and_c.y_restaurant_benchmark_categories (
	id varchar(256) NOT NULL,
	"name" varchar(256) NOT NULL,
	restaurant_benchmark_category varchar(256) NOT NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.y_restaurant_benchmark_categories OWNER TO mj_admin;
GO

Grant update, insert, select on table p_and_c.y_restaurant_benchmark_categories to rl_pc_data_analyst;
GO

Grant select on table p_and_c.y_restaurant_benchmark_categories to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.y_restaurant_benchmark_categories to rpauser;
GO
GRANT SELECT ON p_and_c.y_restaurant_benchmark_categories to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.y_restaurant_benchmark_categories to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.y_restaurant_benchmark_categories to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.y_restaurant_benchmark_categories to rl_p_and_c_d;
GO