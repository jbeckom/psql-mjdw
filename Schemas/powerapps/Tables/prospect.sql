CREATE TABLE powerapps.prospect(
	 propsect_name 							TEXT 			NULL 
	,account_name 							TEXT 			NOT NULL 
	,line_of_business 						TEXT 			NOT NULL 
	,department 							TEXT 			NOT NULL 
	,primary_contact 						TEXT 			NULL 
	,est_revenue 							money			NOT NULL 
	,last_activity_date 					date 			NULL 
	,nbr_of_activities 						int 			NULL 
	,nbr_of_activities_last_90 				int 			NULL 
	,prospect_401k 							bool 			NULL 
	,active_producer 						TEXT 			NULL 
	,aor_effective_date 					date 			NULL 
	,carrier 								TEXT 			NULL 
	,client_category 						char(1)			NULL 
	,client_onboarding_initiated 			bool 			NULL 
	,close_prospect_as_lost 				bool 			NULL 
	,close_prospect_as_won 					bool 			NULL 
	,committed_revenue 						money 			NULL 
	,company_estimated_annual_revenue 		money 			NULL 
	,cpa_firm 								TEXT 			NULL 
	,current_broker 						TEXT 			NULL 
	,current_lost_notes 					TEXT 			NULL 
	,current_mj_client 						bool 			NOT NULL 
	,current_reason_for_lost 				TEXT 			NULL 
	,date_of_first_meeting 					date 			NULL 
	,date_of_proposal_meeting 				date 			NULL 
	,estimated_annual_payroll 				money 			NULL 
	,expected_decision_date 				date 			NULL 
	,first_meeting_completed 				bool 			NULL 
	,former_mj_client 						bool 			NULL 
	,funding_type 							TEXT 			NULL 
	,japanese_owned_business 				bool 			NULL 
	,marketing_account_type 				TEXT 			NULL 
	,marketing_industry_segment 			TEXT 			NULL 
	,marketing_lifecycle_stage 				TEXT 			NULL 
	,mentor 								TEXT 			NULL 
	,mentor_assigned 						bool 			NULL 
	,number_of_employees 					int 			NULL 
	,number_of_locations 					int 			NULL 
	,ongoing_discussion 					TEXT 			NULL 
	,payroll_or_hris_provider 				TEXT 			NULL 
	,primary_competitor_for_lost_prospect 	TEXT 			NULL 
	,producer_1 							TEXT 			NOT NULL 
	,producer_2 							TEXT 			NULL 
	,producer_3 							TEXT 			NULL 
	,producer_split 						bool 			NULL 
	,proposal_meeting_completed 			bool 			NULL 
	,prospect_bpf_finished 					bool 			NULL 
	,propsect_decision 						TEXT 			NULL 
	,qualified_revenue 						money 			NULL 
	,recurring_revenue 						bool 			NULL 
	,renewal_date 							date 			NULL 
	,request_for_proposal 					bool 			NULL 
	,revenue_effective_date 				date 			NULL 
	,scheduled_first_meeting 				bool 			NULL 
	,scheduled_proposal_meeting 			bool 			NULL 
	,county 								varchar(200) 	NULL 
	,premium_volume 						money 			NULL 
	,ex_mod 								varchar(100) 	NULL 
	,estimated_annual_premium 				money 			NULL 
	,drivers 								int 			NULL 
	,vehicles 								int 			NULL 
	,mileage 								int 			NULL 
	,fiedlity_bond 							varchar(50) 	NULL 
	,pc_self_funded 						bool 			NULL 
	,cargo_carrier 							TEXT 			NULL 
	,cargo_renewal 							date 			NULL 
	,business_travel_carrier 				TEXT 			NULL 
	,business_travel_renewal 				date 			NULL 
	,miedge_industry 						varchar(250) 	NULL 
	,actuary_firm_name 						TEXT 			NULL 
	,actuary_contact_name 					TEXT 			NULL 
	,prospect_owner 						TEXT 			NOT NULL 
	,created_on 							timestamp 		NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,created_by 							TEXT 			NOT NULL 	DEFAULT current_user 
	,modified_on 							timestamp 		NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,modified_by 							TEXT 			NOT NULL 	DEFAULT current_user 
	,status 								TEXT 			NOT NULL 
	,status_reason 							TEXT 			NOT NULL 
	,prospect_source 						varchar(150) 	NULL 
	,source_key 							varchar(150) 	NULL 
	,guid 									uuid 			NOT NULL 	DEFAULT public.uuid_generate_v4()
	,CONSTRAINT prospect_pkey PRIMARY KEY (guid)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE powerapps.prospect OWNER TO mj_admin;
GO 
GRANT SELECT ON TABLE powerapps.prospect TO rl_powerapps_r;
GO 
GRANT INSERT ON TABLE powerapps.prospect TO rl_powerapps_a;
GO 
GRANT UPDATE ON TABLE powerapps.prospect TO rl_powerapps_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON powerapps.prospect FOR EACH ROW EXECUTE FUNCTION powerapps.tr_audit_prospect_d();
GO 
CREATE TRIGGER audit_i AFTER INSERT ON powerapps.prospect FOR EACH ROW EXECUTE FUNCTION powerapps.tr_audit_prospect_i();
GO 
CREATE TRIGGER audit_u AFTER UPDATE ON powerapps.prospect FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION powerapps.tr_audit_prospect_u();
GO 
