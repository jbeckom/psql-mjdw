/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE powerapps.prospect 
	 DROP CONSTRAINT IF EXISTS prospect_pkey 
	,ADD CONSTRAINT prospect_guid_uq 	UNIQUE (guid)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON powerapps.prospect; 
GO
DROP TRIGGER IF EXISTS audit_i ON powerapps.prospect; 
GO
DROP TRIGGER IF EXISTS audit_u ON powerapps.prospect; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON powerapps.prospect; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON powerapps.prospect FOR EACH ROW EXECUTE FUNCTION audit.tr_powerapps_log_change(); 
GO
 
/*** MOVE AUDIT DATA FROM LEGACY TABLE(S) TO NEW AUDIT SCHEMA ***/
INSERT INTO audit.powerapps_log (audit_time, audit_user, audit_client, operation, table_name, table_key, new_record) 
SELECT 	 x.audit_timestamp 			AS audit_time 
		,x.audit_user 			AS audit_user 
		,'0.0.0.0'::inet 			AS audit_client 
		,CASE 
			WHEN x.audit_action = 'D' THEN 'DELETE' 
			WHEN x.audit_action = 'I' THEN 'INSERT' 
			WHEN x.audit_action = 'U' THEN 'UPDATE' 
		END 			AS operation 
		,'prospect' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.guid
						,x.old_propsect_name 			AS propsect_name 
						,x.old_account_name 			AS account_name 
						,x.old_line_of_business 			AS line_of_business 
						,x.old_department 			AS department 
						,x.old_primary_contact 			AS primary_contact 
						,x.old_est_revenue 			AS est_revenue 
						,x.old_last_activity_date 			AS last_activity_date 
						,x.old_nbr_of_activities 			AS nbr_of_activities 
						,x.old_nbr_of_activities_last_90 			AS nbr_of_activities_last_90 
						,x.old_prospect_401k 			AS prospect_401k 
						,x.old_active_producer 			AS active_producer 
						,x.old_aor_effective_date 			AS aor_effective_date 
						,x.old_carrier 			AS carrier 
						,x.old_client_category 			AS client_category 
						,x.old_client_onboarding_initiated 			AS client_onboarding_initiated 
						,x.old_close_prospect_as_lost 			AS close_prospect_as_lost 
						,x.old_close_prospect_as_won 			AS close_prospect_as_won 
						,x.old_committed_revenue 			AS committed_revenue 
						,x.old_company_estimated_annual_revenue 			AS company_estimated_annual_revenue 
						,x.old_cpa_firm 			AS cpa_firm 
						,x.old_current_broker 			AS current_broker 
						,x.old_current_lost_notes 			AS current_lost_notes 
						,x.old_current_mj_client 			AS current_mj_client 
						,x.old_current_reason_for_lost 			AS current_reason_for_lost 
						,x.old_date_of_first_meeting 			AS date_of_first_meeting 
						,x.old_date_of_proposal_meeting 			AS date_of_proposal_meeting 
						,x.old_estimated_annual_payroll 			AS estimated_annual_payroll 
						,x.old_expected_decision_date 			AS expected_decision_date 
						,x.old_first_meeting_completed 			AS first_meeting_completed 
						,x.old_former_mj_client 			AS former_mj_client 
						,x.old_funding_type 			AS funding_type 
						,x.old_japanese_owned_business 			AS japanese_owned_business 
						,x.old_marketing_account_type 			AS marketing_account_type 
						,x.old_marketing_industry_segment 			AS marketing_industry_segment 
						,x.old_marketing_lifecycle_stage 			AS marketing_lifecycle_stage 
						,x.old_mentor 			AS mentor 
						,x.old_mentor_assigned 			AS mentor_assigned 
						,x.old_number_of_employees 			AS number_of_employees 
						,x.old_number_of_locations 			AS number_of_locations 
						,x.old_ongoing_discussion 			AS ongoing_discussion 
						,x.old_payroll_or_hris_provider 			AS payroll_or_hris_provider 
						,x.old_primary_competitor_for_lost_prospect 			AS primary_competitor_for_lost_prospect 
						,x.old_producer_1 			AS producer_1 
						,x.old_producer_2 			AS producer_2 
						,x.old_producer_3 			AS producer_3 
						,x.old_producer_split 			AS producer_split 
						,x.old_proposal_meeting_completed 			AS proposal_meeting_completed 
						,x.old_prospect_bpf_finished 			AS prospect_bpf_finished 
						,x.old_propsect_decision 			AS propsect_decision 
						,x.old_qualified_revenue 			AS qualified_revenue 
						,x.old_recurring_revenue 			AS recurring_revenue 
						,x.old_renewal_date 			AS renewal_date 
						,x.old_request_for_proposal 			AS request_for_proposal 
						,x.old_revenue_effective_date 			AS revenue_effective_date 
						,x.old_scheduled_first_meeting 			AS scheduled_first_meeting 
						,x.old_scheduled_proposal_meeting 			AS scheduled_proposal_meeting 
						,x.old_county 			AS county 
						,x.old_premium_volume 			AS premium_volume 
						,x.old_ex_mod 			AS ex_mod 
						,x.old_estimated_annual_premium 			AS estimated_annual_premium 
						,x.old_drivers 			AS drivers 
						,x.old_vehicles 			AS vehicles 
						,x.old_mileage 			AS mileage 
						,x.old_fiedlity_bond 			AS fiedlity_bond 
						,x.old_pc_self_funded 			AS pc_self_funded 
						,x.old_cargo_carrier 			AS cargo_carrier 
						,x.old_cargo_renewal 			AS cargo_renewal 
						,x.old_business_travel_carrier 			AS business_travel_carrier 
						,x.old_business_travel_renewal 			AS business_travel_renewal 
						,x.old_miedge_industry 			AS miedge_industry 
						,x.old_actuary_firm_name 			AS actuary_firm_name 
						,x.old_actuary_contact_name 			AS actuary_contact_name 
						,x.old_prospect_owner 			AS prospect_owner 
						,x.old_created_on 			AS created_on 
						,x.old_created_by 			AS created_by 
						,x.old_modified_on 			AS modified_on 
						,x.old_modified_by 			AS modified_by 
						,x.old_status 			AS status 
						,x.old_status_reason 			AS status_reason 
						,x.old_prospect_source 			AS prospect_source 
						,x.old_source_key 			AS source_key 
			) 	AS _ 
		) 			AS new_record 
FROM powerapps.audit_prospect 	AS x 
	INNER JOIN 	powerapps.prospect 	AS y 
		ON x.guid = y.guid; 
GO 
