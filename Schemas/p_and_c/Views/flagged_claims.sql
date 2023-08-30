CREATE OR REPLACE VIEW p_and_c.flagged_claims
AS SELECT a.claim_number,
    a.paid_expense,
    a.paid_indemnity,
    a.paid_medical,
    a.reserve_expense,
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
    a.claim_site,
    a.occupation,
    a.class_code,
    a.claimant_name,
    a.loss_date,
    a.loss_time,
    a.report_date,
    a.closed_date,
    a.reopen_date,
    a.litigation,
    a.days_employed,
    a.claimant_gender,
    a.claimant_age,
    a.claimant_shift,
    a.claimant_supervisor,
    a.body_part,
    a.cause,
    concat(a.coverage_type_major, ' ', a.coverage_type_minor, ' ', a.coverage_type_detailed) AS concat,
    a.nature,
    a.ij_description,
    a.carrier_policy_number,
    a.uploaded_at,
    e.email_addr AS email
   FROM p_and_c.all_claims a
     LEFT JOIN p_and_c.mapping_policies b ON a.carrier_policy_number::text = b.carrier_policy_number::text
     LEFT JOIN p_and_c.all_policies c ON b.policy_id = c.policy_id
     LEFT JOIN p_and_c.clients d ON c.client_id::text = d.id::text
     LEFT JOIN sagitta.staff e ON d.rmc_id::text = e.sagitem::text
  WHERE (a.reserve_indemnity + a.reserve_medical + a.reserve_expense) > 10000::numeric OR (a.paid_expense + a.reserve_expense + a.paid_indemnity + a.paid_medical + a.reserve_indemnity + a.reserve_medical + a.subrogation) > 25000::numeric AND (a.claim_status::text <> 'Closed'::text OR a.report_date >= (CURRENT_DATE - 30))
UNION ALL
 SELECT a.claim_number,
    a.paid_expense,
    a.paid_indemnity,
    a.paid_medical,
    a.reserve_expense,
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
    a.claim_site,
    a.occupation,
    a.class_code,
    a.claimant_name,
    a.loss_date,
    a.loss_time,
    a.report_date,
    a.closed_date,
    a.reopen_date,
    a.litigation,
    a.days_employed,
    a.claimant_gender,
    a.claimant_age,
    a.claimant_shift,
    a.claimant_supervisor,
    a.body_part,
    a.cause,
    concat(a.coverage_type_major, ' ', a.coverage_type_minor, ' ', a.coverage_type_detailed) AS concat,
    a.nature,
    a.ij_description,
    a.carrier_policy_number,
    a.uploaded_at,
    e.email_addr AS email
   FROM p_and_c.all_claims a
     LEFT JOIN p_and_c.mapping_policies b ON a.carrier_policy_number::text = b.carrier_policy_number::text
     LEFT JOIN p_and_c.all_policies c ON b.policy_id = c.policy_id
     LEFT JOIN p_and_c.clients d ON c.client_id::text = d.id::text
     LEFT JOIN sagitta.staff e ON d.ce_id::text = e.sagitem::text
  WHERE (a.reserve_indemnity + a.reserve_medical + a.reserve_expense) > 10000::numeric OR (a.paid_expense + a.reserve_expense + a.paid_indemnity + a.paid_medical + a.reserve_indemnity + a.reserve_medical + a.subrogation) > 25000::numeric AND (a.claim_status::text <> 'Closed'::text OR a.report_date >= (CURRENT_DATE - 30))
UNION ALL
 SELECT a.claim_number,
    a.paid_expense,
    a.paid_indemnity,
    a.paid_medical,
    a.reserve_expense,
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
    a.claim_site,
    a.occupation,
    a.class_code,
    a.claimant_name,
    a.loss_date,
    a.loss_time,
    a.report_date,
    a.closed_date,
    a.reopen_date,
    a.litigation,
    a.days_employed,
    a.claimant_gender,
    a.claimant_age,
    a.claimant_shift,
    a.claimant_supervisor,
    a.body_part,
    a.cause,
    concat(a.coverage_type_major, ' ', a.coverage_type_minor, ' ', a.coverage_type_detailed) AS concat,
    a.nature,
    a.ij_description,
    a.carrier_policy_number,
    a.uploaded_at,
    e.email_addr AS email
   FROM p_and_c.all_claims a
     LEFT JOIN p_and_c.mapping_policies b ON a.carrier_policy_number::text = b.carrier_policy_number::text
     LEFT JOIN p_and_c.all_policies c ON b.policy_id = c.policy_id
     LEFT JOIN p_and_c.clients d ON c.client_id::text = d.id::text
     LEFT JOIN sagitta.staff e ON d.rts_id::text = e.sagitem::text
  WHERE (a.reserve_indemnity + a.reserve_medical + a.reserve_expense) > 10000::numeric OR (a.paid_expense + a.reserve_expense + a.paid_indemnity + a.paid_medical + a.reserve_indemnity + a.reserve_medical + a.subrogation) > 25000::numeric AND (a.claim_status::text <> 'Closed'::text OR a.report_date >= (CURRENT_DATE - 30));
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.flagged_claims OWNER TO mj_admin;
GO

Grant select on table p_and_c.flagged_claims to rl_pc_data_analyst;
GO

Grant select on table p_and_c.flagged_claims to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.flagged_claims to rpauser;
GO
GRANT SELECT ON p_and_c.flagged_claims to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.flagged_claims to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.flagged_claims to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.flagged_claims to rl_p_and_c_d;
GO