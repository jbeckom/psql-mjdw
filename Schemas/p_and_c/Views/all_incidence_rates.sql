CREATE OR REPLACE VIEW p_and_c.all_incidence_rates
AS SELECT DISTINCT a.client_id,
    a.date_part AS policy_start_year,
    d.headcount_min,
    d.headcount_max,
    c.naics_name,
        CASE
            WHEN d.median = 0::numeric THEN d.mean
            ELSE COALESCE(d.median, d.mean)
        END AS peer_average
   FROM ( SELECT x.client_id,
            date_part('year'::text, x.policy_start_date) AS date_part,
            sum(c_1.employee_headcount) AS employee_headcount
           FROM p_and_c.all_employee_headcount c_1
             LEFT JOIN p_and_c.all_policies x ON c_1.policy_id = x.policy_id
          WHERE c_1.employee_headcount IS NOT NULL
          GROUP BY x.client_id, (date_part('year'::text, x.policy_start_date))) a
     LEFT JOIN p_and_c.clients b ON a.client_id::text = b.id::text
     LEFT JOIN p_and_c.industry_codes c ON "left"(b.industry_id::text, 4) = c.sic_id_4
     LEFT JOIN p_and_c.incidence_rates d ON c.naics = d.naics
  WHERE a.employee_headcount >= d.headcount_min::numeric AND a.employee_headcount < d.headcount_max::numeric AND d.year = (( SELECT max(incidence_rates.year) AS max
           FROM p_and_c.incidence_rates));
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.all_incidence_rates OWNER TO mj_admin;
GO

Grant select on table p_and_c.all_incidence_rates to rl_pc_data_analyst;
GO

Grant select on table p_and_c.all_incidence_rates to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.all_incidence_rates to rpauser;
GO
GRANT SELECT ON p_and_c.all_incidence_rates to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.all_incidence_rates to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.all_incidence_rates to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.all_incidence_rates to rl_p_and_c_d;
GO