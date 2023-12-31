CREATE FUNCTION powerapps.tr_audit_prospect_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO powerapps.audit_prospect(
		 old_propsect_name 
		,old_account_name 
		,old_line_of_business 
		,old_department 
		,old_primary_contact 
		,old_est_revenue 
		,old_last_activity_date 
		,old_nbr_of_activities 
		,old_nbr_of_activities_last_90 
		,old_prospect_401k 
		,old_active_producer 
		,old_aor_effective_date 
		,old_carrier 
		,old_client_category 
		,old_client_onboarding_initiated 
		,old_close_prospect_as_lost 
		,old_close_prospect_as_won 
		,old_committed_revenue 
		,old_company_estimated_annual_revenue 
		,old_cpa_firm 
		,old_current_broker 
		,old_current_lost_notes 
		,old_current_mj_client 
		,old_current_reason_for_lost 
		,old_date_of_first_meeting 
		,old_date_of_proposal_meeting 
		,old_estimated_annual_payroll 
		,old_expected_decision_date 
		,old_first_meeting_completed 
		,old_former_mj_client 
		,old_funding_type 
		,old_japanese_owned_business 
		,old_marketing_account_type 
		,old_marketing_industry_segment 
		,old_marketing_lifecycle_stage 
		,old_mentor 
		,old_mentor_assigned 
		,old_number_of_employees 
		,old_number_of_locations 
		,old_ongoing_discussion 
		,old_payroll_or_hris_provider 
		,old_primary_competitor_for_lost_prospect 
		,old_producer_1 
		,old_producer_2 
		,old_producer_3 
		,old_producer_split 				
		,old_proposal_meeting_completed 
		,old_prospect_bpf_finished 
		,old_propsect_decision 
		,old_qualified_revenue 
		,old_recurring_revenue 
		,old_renewal_date 
		,old_request_for_proposal 
		,old_revenue_effective_date 
		,old_scheduled_first_meeting 
		,old_scheduled_proposal_meeting 
		,old_county 
		,old_premium_volume 
		,old_ex_mod 
		,old_estimated_annual_premium 
		,old_drivers 
		,old_vehicles 
		,old_mileage 
		,old_fiedlity_bond 
		,old_pc_self_funded 
		,old_cargo_carrier 
		,old_cargo_renewal 
		,old_business_travel_carrier 
		,old_business_travel_renewal 
		,old_miedge_industry 
		,old_actuary_firm_name 
		,old_actuary_contact_name 
		,old_prospect_owner 
		,old_created_on 
		,old_created_by 
		,old_modified_on 
		,old_modified_by 
		,old_status 
		,old_status_reason 
		,old_prospect_source 
		,old_source_key 
		,guid 
		,audit_action 
	)
	SELECT 	 OLD.propsect_name 
			,OLD.account_name 
			,OLD.line_of_business 
			,OLD.department 
			,OLD.primary_contact 
			,OLD.est_revenue 
			,OLD.last_activity_date 
			,OLD.nbr_of_activities 
			,OLD.nbr_of_activities_last_90 
			,OLD.prospect_401k 
			,OLD.active_producer 
			,OLD.aor_effective_date 
			,OLD.carrier 
			,OLD.client_category 
			,OLD.client_onboarding_initiated 
			,OLD.close_prospect_as_lost 
			,OLD.close_prospect_as_won 
			,OLD.committed_revenue 
			,OLD.company_estimated_annual_revenue 
			,OLD.cpa_firm 
			,OLD.current_broker 
			,OLD.current_lost_notes 
			,OLD.current_mj_client 
			,OLD.current_reason_for_lost 
			,OLD.date_of_first_meeting 
			,OLD.date_of_proposal_meeting 
			,OLD.estimated_annual_payroll 
			,OLD.expected_decision_date 
			,OLD.first_meeting_completed 
			,OLD.former_mj_client 
			,OLD.funding_type 
			,OLD.japanese_owned_business 
			,OLD.marketing_account_type 
			,OLD.marketing_industry_segment 
			,OLD.marketing_lifecycle_stage 
			,OLD.mentor 
			,OLD.mentor_assigned 
			,OLD.number_of_employees 
			,OLD.number_of_locations 
			,OLD.ongoing_discussion 
			,OLD.payroll_or_hris_provider 
			,OLD.primary_competitor_for_lost_prospect 
			,OLD.producer_1 
			,OLD.producer_2 
			,OLD.producer_3 
			,OLD.producer_split 				
			,OLD.proposal_meeting_completed 
			,OLD.prospect_bpf_finished 
			,OLD.propsect_decision 
			,OLD.qualified_revenue 
			,OLD.recurring_revenue 
			,OLD.renewal_date 
			,OLD.request_for_proposal 
			,OLD.revenue_effective_date 
			,OLD.scheduled_first_meeting 
			,OLD.scheduled_proposal_meeting 
			,OLD.county 
			,OLD.premium_volume 
			,OLD.ex_mod 
			,OLD.estimated_annual_premium 
			,OLD.drivers 
			,OLD.vehicles 
			,OLD.mileage 
			,OLD.fiedlity_bond 
			,OLD.pc_self_funded 
			,OLD.cargo_carrier 
			,OLD.cargo_renewal 
			,OLD.business_travel_carrier 
			,OLD.business_travel_renewal 
			,OLD.miedge_industry 
			,OLD.actuary_firm_name 
			,OLD.actuary_contact_name 
			,OLD.prospect_owner 
			,OLD.created_on 
			,OLD.created_by 
			,OLD.modified_on 
			,OLD.modified_by 
			,OLD.status 
			,OLD.status_reason 
			,OLD.prospect_source 
			,OLD.source_key 
			,OLD.guid 
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.tr_audit_prospect_d() OWNER TO mj_admin;
GO 
GRANT EXECUTE ON FUNCTION powerapps.tr_audit_prospect_d() TO rl_powerapps_x;
GO 
