CREATE OR REPLACE VIEW p_and_c.all_claims
AS SELECT g.claim_number,
    g.occurrence_number,
    g.claimant_number,
    g.paid_expense,
    g.reserve_expense,
    g.paid_indemnity,
    g.paid_medical,
    g.reserve_indemnity,
    g.reserve_medical,
    g.subrogation,
    g.reimbursed,
    COALESCE(v.claim_status, g.claim_status)::character varying(256) AS claim_status,
    g.description_text,
    COALESCE(h.address, g.claim_address_1) AS claim_address_1,
    g.claim_address_2,
    COALESCE(h.city, g.claim_city) AS claim_city,
    COALESCE(h.state, g.claim_state) AS claim_state,
    COALESCE(h.zip, g.claim_zip) AS claim_zip,
    g.claim_site,
    g.claim_site_level_2,
    g.benefit_state,
    g.garage_state,
    COALESCE(z.occupation, g.occupation) AS occupation,
    g.class_code,
    g.claimant_name,
    g.claimant_first,
    g.claimant_middle,
    g.claimant_last,
    g.driver_first,
    g.driver_middle,
    g.driver_last,
    g.loss_date,
    g.loss_time,
    g.report_date,
    g.closed_date,
    g.reopen_date,
    COALESCE(u.litigation, g.litigation) AS litigation,
    g.days_employed,
    g.claimant_gender,
    g.claimant_age,
    g.claimant_shift,
    COALESCE(i.supervisor, g.claimant_supervisor) AS claimant_supervisor,
    k.name::character varying(256) AS body_part,
    l.description::character varying(256) AS body_part_category,
    n.name::character varying(256) AS cause,
    o.description::character varying(256) AS cause_category,
    t.coverage_type_major::character varying(256) AS coverage_type_major,
    t.coverage_type_minor::character varying(256) AS coverage_type_minor,
    t.coverage_type_detailed::character varying(256) AS coverage_type_detailed,
    q.name::character varying(256) AS nature,
    r.description::character varying(256) AS nature_category,
    w.id AS ij_code,
    w.type AS ij_description,
    g.carrier_policy_number,
    g.source_table,
    g.uploaded_at,
    g.client_id,
    ab.name AS subsidiary
   FROM ( SELECT e.claim_number,
            e.occurrence_number,
            e.claimant_number,
            e.paid_expense,
            e.reserve_expense,
            e.paid_indemnity,
            e.paid_medical,
            e.reserve_indemnity,
            e.reserve_medical,
            e.subrogation,
            e.reimbursed,
            e.claim_status,
            e.description_text,
            e.claim_address_1,
            e.claim_address_2,
            e.claim_city,
            e.claim_state,
            e.claim_zip,
            COALESCE(f.alias, e.claim_site) AS claim_site,
            f.level_2 AS claim_site_level_2,
            e.benefit_state,
            e.garage_state,
            e.occupation,
            e.class_code,
            e.claimant_name,
            e.claimant_first,
            e.claimant_middle,
            e.claimant_last,
            e.driver_first,
            e.driver_middle,
            e.driver_last,
            e.loss_date,
            e.loss_time,
            e.report_date,
            e.closed_date,
            e.reopen_date,
            e.litigation,
            e.days_employed,
            e.claimant_gender,
            e.claimant_age,
            e.claimant_shift,
            e.claimant_supervisor,
            e.carrier_body_part,
            e.carrier_cause,
            e.carrier_coverage_type,
            e.carrier_nature,
            e.carrier_injury_code,
            e.carrier_policy_number,
            e.source_table,
            e.uploaded_at,
            e.client_id
           FROM ( SELECT a.claim_number,
                    a.occurrence_number,
                    a.claimant_number,
                    a.paid_expense,
                    a.reserve_expense,
                    a.paid_indemnity,
                    a.paid_medical,
                    a.reserve_indemnity,
                    a.reserve_medical,
                    a.subrogation,
                    a.reimbursed,
                    a.claim_status,
                    a.description_text,
                    a.claim_address_1,
                    a.claim_address_2,
                    a.claim_city,
                    a.claim_state,
                    a.claim_zip,
                    COALESCE(d.claim_site, a.claim_site) AS claim_site,
                    a.benefit_state,
                    a.garage_state,
                    COALESCE(d.occupation, a.occupation) AS occupation,
                    a.class_code,
                    COALESCE(d.claimant_name, a.claimant_name) AS claimant_name,
                    a.claimant_first,
                    a.claimant_middle,
                    a.claimant_last,
                    a.driver_first,
                    a.driver_middle,
                    a.driver_last,
                    a.loss_date,
                    a.loss_time,
                    a.report_date,
                    a.closed_date,
                    a.reopen_date,
                    a.litigation,
                    COALESCE(d.days_employed::integer, a.days_employed) AS days_employed,
                    COALESCE(d.claimant_gender, a.claimant_gender) AS claimant_gender,
                    COALESCE(d.claimant_age::integer, a.claimant_age) AS claimant_age,
                    a.claimant_shift,
                    a.claimant_supervisor,
                    COALESCE(d.carrier_body_part, a.carrier_body_part) AS carrier_body_part,
                    COALESCE(d.carrier_cause, a.carrier_cause) AS carrier_cause,
                    COALESCE(d.carrier_coverage_type, a.carrier_coverage_type) AS carrier_coverage_type,
                    COALESCE(d.carrier_nature, a.carrier_nature) AS carrier_nature,
                    a.carrier_injury_code,
                    a.carrier_policy_number,
                    a.source_table,
                    a.uploaded_at,
                    c.client_id
                   FROM p_and_c.all_claims_clean a
                     LEFT JOIN p_and_c.all_claims_clean acr ON a.claim_number::text = acr.claim_number::text AND a.uploaded_at::text < acr.uploaded_at::text
                     LEFT JOIN p_and_c.mapping_policies b ON a.carrier_policy_number::text = b.carrier_policy_number::text
                     LEFT JOIN p_and_c.all_policies c ON b.policy_id = c.policy_id
                     LEFT JOIN p_and_c.mapping_by_claim_number d ON c.client_id::text = d.client_id::text AND a.claim_number::text = d.claim_number::text
                  WHERE acr.uploaded_at IS NULL AND a.uploaded_at IS NOT NULL) e
             LEFT JOIN p_and_c.mapping_claim_locations f ON e.claim_site::text = f.claim_site::text AND e.client_id::text = f.client_id::text) g
     LEFT JOIN p_and_c.location_code_addresses h ON g.client_id::text = h.client_id::text AND g.claim_site::text = h.location::text
     LEFT JOIN p_and_c.mapping_supervisors i ON g.client_id::text = i.client_id::text AND g.claim_site::text = i.location::text
     LEFT JOIN p_and_c.mapping_body_parts j ON g.carrier_body_part::text = j.carrier_body_part
     LEFT JOIN p_and_c.body_parts k ON j.body_part_id = k.id
     LEFT JOIN p_and_c.body_part_categories l ON k.body_part_category_id = l.id
     LEFT JOIN p_and_c.mapping_causes m ON g.carrier_cause::text = m.carrier_cause
     LEFT JOIN p_and_c.causes n ON m.cause_id = n.id
     LEFT JOIN p_and_c.cause_categories o ON n.cause_category_id = o.id
     LEFT JOIN p_and_c.mapping_nature p ON g.carrier_nature::text = p.carrier_nature
     LEFT JOIN p_and_c.nature q ON p.nature_id = q.id
     LEFT JOIN p_and_c.nature_categories r ON q.nature_category_id = r.id
     LEFT JOIN p_and_c.mapping_coverage_types s ON g.carrier_coverage_type::text = s.carrier_coverage_type
     LEFT JOIN p_and_c.loss_types t ON s.loss_type_id = t.id
     LEFT JOIN p_and_c.mapping_litigation u ON g.litigation::text = u.carrier_litigation::text
     LEFT JOIN p_and_c.mapping_claim_status v ON g.claim_status::text = v.carrier_claim_status::text
     LEFT JOIN p_and_c.mapping_injury_codes x ON g.carrier_injury_code::text = x.carrier_injury_code::text
     LEFT JOIN p_and_c.injury_codes w ON x.injury_code = w.id
     LEFT JOIN p_and_c.mapping_occupations z ON g.client_id::text = z.client_id::text AND g.occupation::text = z.carrier_occupation::text
     LEFT JOIN p_and_c.mapping_subsidiary_locations aa ON aa.client_id::text = g.client_id::text AND aa.location = g.claim_site::text
     LEFT JOIN p_and_c.subsidiaries ab ON aa.subsidiary_id = ab.id;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.all_claims OWNER TO mj_admin;
GO

Grant select on table p_and_c.all_claims to rl_pc_data_analyst;
GO

Grant select on table p_and_c.all_claims to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.all_claims to rpauser;
GO
GRANT SELECT ON p_and_c.all_claims to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.all_claims to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.all_claims to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.all_claims to rl_p_and_c_d;
GO