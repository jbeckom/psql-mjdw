CREATE OR REPLACE VIEW p_and_c.benchmarking_table_clean
AS SELECT t.id,
        CASE
            WHEN split_part(t.range_usd::text, '-'::text, 1) ~~ '%.%'::text THEN replace(replace(replace(replace(replace(replace(split_part(t.range_usd::text, '-'::text, 1), 'k'::text, '00'::text), 'm'::text, '00000'::text), '₥'::text, '00000'::text), ' '::text, ''::text), '.'::text, ''::text), 'b'::text, '000000000')
            ELSE replace(replace(replace(replace(replace(split_part(t.range_usd::text, '-'::text, 1), 'k'::text, '000'::text), 'm'::text, '000000'::text), '₥'::text, '000000'::text), ' '::text, ''::text), 'b'::text, '000000000')
        END AS min_range,
        CASE
            WHEN split_part(t.range_usd::text, '-'::text, 2) ~~ '%.%'::text THEN replace(replace(replace(replace(replace(replace(split_part(t.range_usd::text, '-'::text, 2), 'k'::text, '00'::text), 'm'::text, '00000'::text), '₥'::text, '00000'::text), ' '::text, ''::text), '.'::text, ''::text), 'b'::text, '000000000')
            ELSE replace(replace(replace(replace(replace(split_part(t.range_usd::text, '-'::text, 2), 'k'::text, '000'::text), 'm'::text, '000000'::text), '₥'::text, '000000'::text), ' '::text, ''::text), 'b'::text, '000000000')
        END AS max_range,
        CASE
            WHEN t.percent_counts::text ~~ '%.'::text THEN replace(concat(t.percent_counts, '0'), ','::text, ''::text)::character varying
            ELSE t.percent_counts
        END AS percent_counts,
        CASE
            WHEN t.cumulative_percent::text ~~ '%.'::text THEN replace(concat(t.cumulative_percent, '0'), ','::text, ''::text)::character varying
            ELSE t.cumulative_percent
        END AS cumulative_percent,
    t.table_id,
    t.processed_date
   FROM p_and_c.benchmarking_table t;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.benchmarking_table_clean OWNER TO mj_admin;
GO

Grant select on table p_and_c.benchmarking_table_clean to rl_pc_data_analyst;
GO

Grant select on table p_and_c.benchmarking_table_clean to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.benchmarking_table_clean to rpauser;
GO

GRANT SELECT ON p_and_c.benchmarking_table_clean to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.benchmarking_table_clean to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.benchmarking_table_clean to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.benchmarking_table_clean to rl_p_and_c_d;
GO