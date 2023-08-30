CREATE OR REPLACE VIEW p_and_c.carriers
AS SELECT DISTINCT i.insurer_cd::character varying AS id,
        CASE
            WHEN i.insurer_cd = 'APCCO'::text THEN 'Allied Property & Casualty Ins'::character varying
            ELSE
            CASE
                WHEN i.insurer_cd = 'SILC'::text THEN 'Starr Indemnity & Liability Co'::character varying
                ELSE
                CASE
                    WHEN i.insurer_cd = 'ATRAD'::text THEN 'Atradius Trade Credit Insuranc'::character varying
                    ELSE replace(btrim(i.insurer_name), '&amp;amp;amp;'::text, '&'::text)::character varying
                END
            END
        END AS name,
    cam.alias
   FROM sagitta.policies dw
     LEFT JOIN sagitta.insurors i ON dw.insurer_name::integer = i.sagitem
     LEFT JOIN p_and_c.carrier_alias_map cam ON i.insurer_cd = cam.id::text
  WHERE ("left"(dw.department_cd, 2) = ANY (ARRAY['01'::text, '21'::text, '07'::text])) AND i.insurer_cd IS NOT NULL
UNION
 SELECT carriers_supp.id,
    carriers_supp.name,
    carriers_supp.alias
   FROM p_and_c.carriers_supp;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.carriers OWNER TO mj_admin;
GO

Grant select on table p_and_c.carriers to rl_pc_data_analyst;
GO

Grant select on table p_and_c.carriers to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.carriers to rpauser;
GO
GRANT SELECT ON p_and_c.carriers to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.carriers to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.carriers to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.carriers to rl_p_and_c_d;
GO