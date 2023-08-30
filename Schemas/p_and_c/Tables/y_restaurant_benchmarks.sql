CREATE TABLE p_and_c.y_restaurant_benchmarks (
	restaurant_benchmark_category varchar(26) NOT NULL,
	frequency numeric(4,2) NOT NULL,
	severity int4 NOT NULL,
	CONSTRAINT y_restaurant_benchmarks_pkey PRIMARY KEY (restaurant_benchmark_category)
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.y_restaurant_benchmarks OWNER TO mj_admin;
GO

Grant select on table p_and_c.y_restaurant_benchmarks to rl_pc_data_analyst;
GO

Grant select on table p_and_c.y_restaurant_benchmarks to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.y_restaurant_benchmarks to rpauser;
GO
GRANT SELECT ON p_and_c.y_restaurant_benchmarks to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.y_restaurant_benchmarks to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.y_restaurant_benchmarks to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.y_restaurant_benchmarks to rl_p_and_c_d;
GO