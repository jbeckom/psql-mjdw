CREATE OR REPLACE VIEW pc_ops.policies
AS SELECT '1967-12-31'::date + a.policy_expiration_dt AS "Expiration Date",
    a.department_cd AS "Dept",
    COALESCE(g.alias, g.name, j.insurer_name::character varying) AS "Carrier",
    b.client_cd AS "Client ID",
    b.client_name AS "Client",
    f.coverage_code AS "Coverage",
    c.staff_name AS "RTS",
    d.staff_name AS "RMC",
    e.staff_name AS "CE",
    COALESCE(replace(a.annual_premium_amt,',','')::numeric, replace(a.est_prem_amt,',','')::numeric/100)::numeric AS "Premium"
   FROM sagitta.policies a
     LEFT JOIN sagitta.clients b ON a.client_cd = b.sagitem
     LEFT JOIN sagitta.clients_addlinfo h ON a.client_cd = h.sagitem
     LEFT JOIN sagitta.staff c ON a.servicer_cd = c.sagitem::text
     LEFT JOIN sagitta.staff d ON a.producer_1_cd = d.sagitem::text
     LEFT JOIN sagitta.staff e ON h.client_exec = e.sagitem::text
     LEFT JOIN sagitta.coverages i ON a.coverage_cd = i.sagitem
     LEFT JOIN p_and_c.coverage_codes f ON i.coverage_cd = f.coverage_code
     LEFT JOIN sagitta.insurors j ON a.insurer_name::integer = j.sagitem
     LEFT JOIN p_and_c.carriers g ON j.insurer_cd = g.id::text
  WHERE ("left"(a.department_cd, 2) = ANY (ARRAY['21'::text, '01'::text, '07'::text])) AND ('1967-12-31'::date + a.policy_expiration_dt) > (CURRENT_DATE - '2 years'::interval);
GO

/*** PERMISSIONS ***/
ALTER VIEW pc_ops.policies OWNER TO mj_admin;
GO

Grant select on table pc_ops.policies to rl_pc_data_analyst;
GO

Grant select on table pc_ops.policies to rl_pc_rpa_developer;
GO

Grant select on table pc_ops.policies to rpauser;
GO
GRANT SELECT ON pc_ops.policies to rl_pc_ops_r;
GO

GRANT INSERT ON pc_ops.policies to rl_pc_ops_a;
GO

GRANT UPDATE ON pc_ops.policies to rl_pc_ops_w;
GO

GRANT DELETE ON pc_ops.policies to rl_pc_ops_d;
GO