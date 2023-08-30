CREATE OR REPLACE VIEW p_and_c.avis_safety_kpi
AS SELECT x.policy_start_date,
    d.name,
    sum(a.payroll * c.elr / 100::numeric)::numeric(18,2) AS expected_losses
   FROM p_and_c.payroll a
     LEFT JOIN p_and_c.all_policies x ON a.policy_id = x.policy_id
     LEFT JOIN p_and_c.states b ON a.state = b.code
     LEFT JOIN p_and_c.elr c ON concat(date_part('year'::text, x.policy_start_date), a.state, a.class_code) = concat(c.year, c.state, c.class_code)
     LEFT JOIN p_and_c.subsidiaries d ON a.subsidiary_id = d.id
  WHERE x.client_id::text = 'AVISIND'::text AND a.subsidiary_id IS NOT NULL AND x.policy_start_date > '2014-12-31'::date
  GROUP BY x.policy_start_date, d.name;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.avis_safety_kpi OWNER TO mj_admin;
GO

Grant select on table p_and_c.avis_safety_kpi to rl_pc_data_analyst;
GO

Grant select on table p_and_c.avis_safety_kpi to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.avis_safety_kpi to rpauser;
GO
GRANT SELECT ON p_and_c.avis_safety_kpi to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.avis_safety_kpi to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.avis_safety_kpi to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.avis_safety_kpi to rl_p_and_c_d;
GO