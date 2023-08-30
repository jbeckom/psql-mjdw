CREATE OR REPLACE VIEW p_and_c.clients
AS SELECT DISTINCT replace(ac.client_cd, '&amp;amp;amp;'::text, '&'::text)::character varying(256) AS id,
    replace(ac.client_name, '&amp;amp;amp;'::text, '&'::text)::character varying(256) AS name,
    COALESCE(sup.sic_code, ac.sic_cd::character varying(256)) AS industry_id,
    ac.servicer_1_cd::character varying(256) AS rts_id,
    ac.servicer_2_cd::character varying(256) AS ca_id,
    ca.client_exec::character varying(256) AS ce_id,
    ac.producer_1_cd::character varying(256) AS rmc_id,
    sup.logo_url,
    sup.large_loss,
    sup.very_large_loss,
    sup.aperture_email,
    sup.active
   FROM sagitta.clients ac
     LEFT JOIN p_and_c.client_supp sup ON ac.client_cd = sup.client_id::text
     LEFT JOIN sagitta.clients_addlinfo ca ON ac.sagitem = ca.sagitem
  WHERE ac.client_cd IS NOT NULL
UNION
 SELECT pd.id::character varying(256) AS id,
    pd.name::character varying(256) AS name,
    pd.industry_id::character varying(256) AS industry_id,
    NULL::character varying(256) AS rts_id,
    NULL::character varying(256) AS ca_id,
    NULL::character varying(256) AS ce_id,
    NULL::character varying(256) AS rmc_id,
    pd.logo_url,
    COALESCE(sup.large_loss, 100000) AS large_loss,
    COALESCE(sup.very_large_loss, 250000) AS very_large_loss,
    ''::character varying(256) AS aperture_email,
    false AS active
   FROM p_and_c.prospects_and_demo pd
     LEFT JOIN p_and_c.client_supp sup ON pd.id = sup.client_id::text;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.clients OWNER TO mj_admin;
GO

Grant select on table p_and_c.clients to rl_pc_data_analyst;
GO

Grant select on table p_and_c.clients to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.clients to rpauser;
GO
GRANT SELECT ON p_and_c.clients to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.clients to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.clients to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.clients to rl_p_and_c_d;
GO