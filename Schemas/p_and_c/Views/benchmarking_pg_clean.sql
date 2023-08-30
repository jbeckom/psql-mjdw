CREATE OR REPLACE VIEW p_and_c.benchmarking_pg_clean
AS SELECT p.id,
    p.client_id,
    p.lob,
    replace(replace(replace(replace(p.exposure_type::text, ')'::text, ''::text), '('::text, ''::text), ':'::text, ''::text), ' '::text, ''::text) AS exposure_type,
    replace(replace(split_part(replace(p.exposure_range::text, ','::text, ''::text), '-'::text, 1), ' '::text, ''::text),'['::text,''::text) AS exposure_min,
    replace(replace(split_part(replace(p.exposure_range::text, ','::text, ''::text), '-'::text, 2), ' '::text, ''::text),']'::text,''::text) AS exposure_max,
    p.industry,
    p.pg_size,
    p.processed_date
   FROM p_and_c.benchmarking_pg p
  WHERE p.exposure_range::text !~~ '%Revenue%'::text AND p.pg_size IS NOT NULL;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.benchmarking_pg_clean OWNER TO mj_admin;
GO

Grant select on table p_and_c.benchmarking_pg_clean to rl_pc_data_analyst;
GO

Grant select on table p_and_c.benchmarking_pg_clean to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.benchmarking_pg_clean to rpauser;
GO

GRANT SELECT ON p_and_c.benchmarking_pg_clean to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.benchmarking_pg_clean to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.benchmarking_pg_clean to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.benchmarking_pg_clean to rl_p_and_c_d;
GO