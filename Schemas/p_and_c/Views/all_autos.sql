CREATE OR REPLACE VIEW p_and_c.all_autos
AS SELECT a.policy_id,
    a.year,
    a.make,
    a.model,
    a.vin,
    a.city,
    a.state,
    a.zip,
    a.weight_class,
    a.business_use,
    a.radius,
    a.fleet,
    a.description,
    a.liab,
    a.med_pay,
    a.um,
    a.comp_deduct,
    a.collision_deduct,
    a.cost_new,
    a.uploaded_at
   FROM ( SELECT a_1.policy_id,
            a_1.year,
            a_1.make,
            a_1.model,
            a_1.vin,
            a_1.city,
            a_1.state,
            a_1.zip,
            b_1.weight_class,
            b_1.business_use,
            b_1.radius,
            b_1.fleet,
            c.description,
            a_1.liab,
            a_1.med_pay,
            a_1.um,
            a_1.comp_deduct,
            a_1.collision_deduct,
            a_1.cost_new,
            a_1.uploaded_at
           FROM p_and_c.autos a_1
             LEFT JOIN p_and_c.auto_classes_primary b_1 ON "left"(a_1.class_code::text, 3)::character(3) = b_1.primary_class_code
             LEFT JOIN p_and_c.auto_industry_classes c ON "right"(a_1.class_code::text, 2)::character(2) = c.id
          WHERE a_1.do_not_include IS NOT TRUE) a
     LEFT JOIN ( SELECT a_1.policy_id,
            a_1.year,
            a_1.make,
            a_1.model,
            a_1.vin,
            a_1.city,
            a_1.state,
            a_1.zip,
            b_1.weight_class,
            b_1.business_use,
            b_1.radius,
            b_1.fleet,
            c.description,
            a_1.liab,
            a_1.med_pay,
            a_1.um,
            a_1.comp_deduct,
            a_1.collision_deduct,
            a_1.cost_new,
            a_1.uploaded_at
           FROM p_and_c.autos a_1
             LEFT JOIN p_and_c.auto_classes_primary b_1 ON "left"(a_1.class_code::text, 3)::character(3) = b_1.primary_class_code
             LEFT JOIN p_and_c.auto_industry_classes c ON "right"(a_1.class_code::text, 2)::character(2) = c.id
          WHERE a_1.do_not_include IS NOT TRUE) b ON a.policy_id = b.policy_id AND a.uploaded_at::date < b.uploaded_at::date
  WHERE b.uploaded_at IS NULL AND a.uploaded_at IS NOT NULL AND COALESCE(b.weight_class, ''::character varying)::text !~~* '%trailer%'::text;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.all_autos OWNER TO mj_admin;
GO

Grant select on table p_and_c.all_autos to rl_pc_data_analyst;
GO

Grant select on table p_and_c.all_autos to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.all_autos to rpauser;
GO
GRANT SELECT ON p_and_c.all_autos to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.all_autos to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.all_autos to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.all_autos to rl_p_and_c_d;
GO