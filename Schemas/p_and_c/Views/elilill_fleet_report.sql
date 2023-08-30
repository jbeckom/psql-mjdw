CREATE OR REPLACE VIEW p_and_c.elilill_fleet_report
AS 
select
	a.incident_number,
	a.date_time_reported,
	a.date_time_incident,
	a.month,
	a.day_of_week,
	a.state_of_incident,
	a.employee_name,
	a.employee_id,
	a.registered_with_copilot,
	a.copilot_notes,
	a.violation,
	a.business_unit,
	a.supervisor,
	a.area_leader,
	a.years_as_a_driver,
	a.truce_connected,
	a.collision_code,
	a.collision_type,
	a.element_description,
	a.traveling_speed,
	a.unit_number,
	a.vehicle_type,
	a.journey_purpose,
	a.phone_handling,
	a.airbag_deployed,
	a.ee_injured,
	a.life_near_miss,
	a.life_near_miss_criteria,
    b.apd_incurred,
    c.al_incurred,
    d.wc_incurred,
    a.uploaded_at
   FROM p_and_c.elilill_mv_collision_tracker a
     LEFT JOIN (select a.claim_number,a.driver_last,a.loss_date::date,sum(replace(replace(replace(replace(a.paid_expense,'$',''),',',''),'(','-'),')','')::numeric+replace(replace(replace(replace(a.reserve_expense,'$',''),',',''),'(','-'),')','')::numeric+replace(replace(replace(replace(a.paid_indemnity,'$',''),',',''),'(','-'),')','')::numeric+replace(replace(replace(replace(a.reserve_indemnity,'$',''),',',''),'(','-'),')','')::numeric+replace(replace(replace(replace(a.paid_medical,'$',''),',',''),'(','-'),')','')::numeric+replace(replace(replace(replace(a.reserve_medical,'$',''),',',''),'(','-'),')','')::numeric+replace(replace(replace(replace(a.subrogation,'$',''),',',''),'(','-'),')','')::numeric+replace(replace(replace(replace(a.reimbursed,'$',''),',',''),'(','-'),')','')::numeric) as apd_incurred from p_and_c.normal_lmi_cau_pd a
             LEFT JOIN p_and_c.normal_lmi_cau_pd b ON a.claim_number::text = b.claim_number::text AND a.uploaded_at::date < b.uploaded_at::date
          WHERE b.uploaded_at IS NULL AND a.uploaded_at IS NOT null
          and a.carrier_policy_number ilike '%ELILILL%'
          group by a.claim_number,a.driver_last,a.loss_date::date) b ON concat(lower(regexp_replace(a.employee_name, '^.* ', '')::text), a.date_time_incident::date) = concat(lower(b.driver_last::text), b.loss_date::date)
 LEFT JOIN (select a.claim_number,a.driver_last,a.loss_date::date,sum(replace(replace(replace(replace(a.paid_expense,'$',''),',',''),'(','-'),')','')::numeric+replace(replace(replace(replace(a.reserve_expense,'$',''),',',''),'(','-'),')','')::numeric+replace(replace(replace(replace(a.paid_indemnity,'$',''),',',''),'(','-'),')','')::numeric+replace(replace(replace(replace(a.reserve_indemnity,'$',''),',',''),'(','-'),')','')::numeric+replace(replace(replace(replace(a.paid_medical,'$',''),',',''),'(','-'),')','')::numeric+replace(replace(replace(replace(a.reserve_medical,'$',''),',',''),'(','-'),')','')::numeric+replace(replace(replace(replace(a.subrogation,'$',''),',',''),'(','-'),')','')::numeric+replace(replace(replace(replace(a.reimbursed,'$',''),',',''),'(','-'),')','')::numeric) as al_incurred from p_and_c.normal_lmi_cau_liab a
             LEFT JOIN p_and_c.normal_lmi_cau_liab b ON a.claim_number::text = b.claim_number::text AND a.uploaded_at::date < b.uploaded_at::date
          WHERE b.uploaded_at IS NULL AND a.uploaded_at IS NOT null
          and a.carrier_policy_number ilike '%ELILILL%'
          group by a.claim_number,a.driver_last,a.loss_date::date) c ON concat(lower(regexp_replace(a.employee_name, '^.* ', '')::text), a.date_time_incident::date) = concat(lower(c.driver_last::text), c.loss_date::date)
LEFT JOIN (select a.claim_number,a.claimant_last,a.loss_date::date,sum(replace(replace(replace(replace(a.paid_expense,'$',''),',',''),'(','-'),')','')::numeric+replace(replace(replace(replace(a.reserve_expense,'$',''),',',''),'(','-'),')','')::numeric+replace(replace(replace(replace(a.paid_indemnity,'$',''),',',''),'(','-'),')','')::numeric+replace(replace(replace(replace(a.reserve_indemnity,'$',''),',',''),'(','-'),')','')::numeric+replace(replace(replace(replace(a.paid_medical,'$',''),',',''),'(','-'),')','')::numeric+replace(replace(replace(replace(a.reserve_medical,'$',''),',',''),'(','-'),')','')::numeric+replace(replace(replace(replace(a.subrogation,'$',''),',',''),'(','-'),')','')::numeric+replace(replace(replace(replace(a.reimbursed,'$',''),',',''),'(','-'),')','')::numeric) as wc_incurred from p_and_c.normal_lmi_wco a
             LEFT JOIN p_and_c.normal_lmi_wco b ON a.claim_number::text = b.claim_number::text AND a.uploaded_at::date < b.uploaded_at::date
          WHERE b.uploaded_at IS NULL AND a.uploaded_at IS NOT null
          and a.carrier_policy_number ilike '%ELILILL%'
          group by a.claim_number,a.claimant_last,a.loss_date::date) d ON concat(lower(regexp_replace(a.employee_name, '^.* ', '')::text), a.date_time_incident::date) = concat(lower(d.claimant_last::text), d.loss_date::date)
          WHERE a.uploaded_at = ( SELECT max(elilill_mv_collision_tracker.uploaded_at) AS max
           FROM p_and_c.elilill_mv_collision_tracker)
  ORDER BY a.date_time_incident;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.elilill_fleet_report OWNER TO mj_admin;
GO

Grant select on table p_and_c.elilill_fleet_report to rl_pc_data_analyst;
GO

Grant select on table p_and_c.elilill_fleet_report to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.elilill_fleet_report to rpauser;
GO
GRANT SELECT ON p_and_c.elilill_fleet_report to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.elilill_fleet_report to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.elilill_fleet_report to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.elilill_fleet_report to rl_p_and_c_d;
GO