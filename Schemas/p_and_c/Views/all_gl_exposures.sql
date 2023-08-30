CREATE OR REPLACE VIEW p_and_c.all_gl_exposures
AS SELECT c.policy_id,
    c.location_number,
    c.description,
    c.address,
    c.city,
    c.state,
    c.zip,
    c.gl_exposure_class,
    c.gl_basis_id,
    c.exposure,
    c.notes
   FROM ( SELECT a.policy_id,
            a.location_number,
            a.description,
            a.address,
            a.city,
            a.state,
            a.zip,
            a.gl_exposure_class,
            a.gl_basis_id,
            a.exposure,
            a.notes,
            a.audited,
            a.uploaded_at
           FROM ( SELECT a_1.policy_id,
                    a_1.location_number,
                    a_1.description,
                    a_1.address,
                    a_1.city,
                    a_1.state,
                    a_1.zip,
                    a_1.gl_exposure_class,
                    a_1.gl_basis_id,
                    a_1.exposure,
                    a_1.notes,
                    a_1.audited,
                    a_1.uploaded_at
                   FROM p_and_c.gl_exposures a_1
                     LEFT JOIN p_and_c.gl_exposure_classes b_1 ON a_1.gl_exposure_class = b_1.id
                  WHERE a_1.do_not_include IS NOT TRUE) a
             LEFT JOIN ( SELECT a_1.policy_id,
                    a_1.location_number,
                    a_1.description,
                    a_1.address,
                    a_1.city,
                    a_1.state,
                    a_1.zip,
                    a_1.gl_exposure_class,
                    a_1.gl_basis_id,
                    a_1.exposure,
                    a_1.notes,
                    a_1.audited,
                    a_1.uploaded_at
                   FROM p_and_c.gl_exposures a_1
                     LEFT JOIN p_and_c.gl_exposure_classes b_1 ON a_1.gl_exposure_class = b_1.id
                  WHERE a_1.do_not_include IS NOT TRUE) b ON a.policy_id = b.policy_id AND a.audited::integer < b.audited::integer
          WHERE b.audited IS NULL AND a.audited IS NOT NULL) c
     LEFT JOIN ( SELECT a.policy_id,
            a.location_number,
            a.description,
            a.address,
            a.city,
            a.state,
            a.zip,
            a.gl_exposure_class,
            a.gl_basis_id,
            a.exposure,
            a.notes,
            a.audited,
            a.uploaded_at
           FROM ( SELECT a_1.policy_id,
                    a_1.location_number,
                    a_1.description,
                    a_1.address,
                    a_1.city,
                    a_1.state,
                    a_1.zip,
                    a_1.gl_exposure_class,
                    a_1.gl_basis_id,
                    a_1.exposure,
                    a_1.notes,
                    a_1.audited,
                    a_1.uploaded_at
                   FROM p_and_c.gl_exposures a_1
                     LEFT JOIN p_and_c.gl_exposure_classes b_1 ON a_1.gl_exposure_class = b_1.id
                  WHERE a_1.do_not_include IS NOT TRUE) a
             LEFT JOIN ( SELECT a_1.policy_id,
                    a_1.location_number,
                    a_1.description,
                    a_1.address,
                    a_1.city,
                    a_1.state,
                    a_1.zip,
                    a_1.gl_exposure_class,
                    a_1.gl_basis_id,
                    a_1.exposure,
                    a_1.notes,
                    a_1.audited,
                    a_1.uploaded_at
                   FROM p_and_c.gl_exposures a_1
                     LEFT JOIN p_and_c.gl_exposure_classes b_1 ON a_1.gl_exposure_class = b_1.id
                  WHERE a_1.do_not_include IS NOT TRUE) b ON a.policy_id = b.policy_id AND a.audited::integer < b.audited::integer
          WHERE b.audited IS NULL AND a.audited IS NOT NULL) d ON c.policy_id = d.policy_id AND c.uploaded_at < d.uploaded_at
  WHERE d.uploaded_at IS NULL AND c.uploaded_at IS NOT NULL;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.all_gl_exposures OWNER TO mj_admin;
GO

Grant select on table p_and_c.all_gl_exposures to rl_pc_data_analyst;
GO

Grant select on table p_and_c.all_gl_exposures to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.all_gl_exposures to rpauser;
GO
GRANT SELECT ON p_and_c.all_gl_exposures to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.all_gl_exposures to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.all_gl_exposures to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.all_gl_exposures to rl_p_and_c_d;
GO