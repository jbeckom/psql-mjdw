DROP TABLE IF EXISTS benefitpoint.marketing_group_account_associated_accounts;
GO 

DROP TABLE IF EXISTS benefitpoint.marketing_group_account_info;
GO 

CREATE TABLE benefitpoint.marketing_group_account_info (
	 account_id 									int 								NOT NULL 
	,marketing_group_name 							varchar(100) 						NOT NULL 
	,marketing_group_type 							benefitpoint.marketing_group_type 	NOT NULL 
	,number_of_ftes 								int 								NULL 
	,number_of_ftes_as_of 							timestamp 							NULL 
	,number_of_full_time_equivalents 				int 								NULL 
	,number_of_full_time_equivalents_as_of_date 	timestamp 							NULL 
	,coverage_subject_to_employer_mandate 			bool 								NULL 
	,associated_account_ids 						TEXT 								NULL 
	,CONSTRAINT account_fkey FOREIGN KEY (account_id) REFERENCES benefitpoint.account (account_id) ON DELETE CASCADE 
	,CONSTRAINT marketing_group_account_pkey PRIMARY KEY (account_id)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.marketing_group_account_info OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.marketing_group_account_info TO rl_benefitpoint_r;
GO 

GRANT INSERT ON TABLE benefitpoint.marketing_group_account_info TO rl_benefitpoint_a;
GO 

GRANT UPDATE ON TABLE benefitpoint.marketing_group_account_info TO rl_benefitpoint_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON benefitpoint.marketing_group_account_info FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_marketing_group_account_info_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON benefitpoint.marketing_group_account_info FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_marketing_group_account_info_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON benefitpoint.marketing_group_account_info FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION benefitpoint.tr_audit_marketing_group_account_info_u();
GO 

/*******************/
/*** AUDIT TABLE ***/
/*******************/
DROP TABLE IF EXISTS benefitpoint.audit_marketing_group_account_info;
GO 

CREATE TABLE benefitpoint.audit_marketing_group_account_info (
	 account_id 										int 								NOT NULL 
	,old_marketing_group_name 							varchar(100) 						NULL 
	,new_marketing_group_name 							varchar(100) 						NULL 
	,old_marketing_group_type 							benefitpoint.marketing_group_type 	NULL 
	,new_marketing_group_type 							benefitpoint.marketing_group_type 	NULL 
	,old_number_of_ftes 								int 								NULL 
	,new_number_of_ftes 								int 								NULL 
	,old_number_of_ftes_as_of 							timestamp 							NULL 
	,new_number_of_ftes_as_of 							timestamp 							NULL 
	,old_number_of_full_time_equivalents 				int 								NULL 
	,new_number_of_full_time_equivalents 				int 								NULL 
	,old_number_of_full_time_equivalents_as_of_date 	timestamp 							NULL 
	,new_number_of_full_time_equivalents_as_of_date 	timestamp 							NULL 
	,old_coverage_subject_to_employer_mandate 			bool 								NULL 
	,new_coverage_subject_to_employer_mandate 			bool 								NULL 
	,old_associated_account_ids 						TEXT 								NULL 
	,new_associated_account_ids 						TEXT 								NULL 
	,audit_action 										char(1) 							NOT NULL 
	,audit_user 										TEXT 								NOT NULL 	DEFAULT current_user 
	,audit_timestamp 									timestamp 							NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 											bigint 								NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.audit_marketing_group_account_info OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE benefitpoint.audit_marketing_group_account_info TO rl_benefitpoint_a;
GO 

/*****************/
/*** FUNCTIONS ***/
/*****************/
CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_marketing_group_account_info_d() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_marketing_group_account_info (
		 account_id 
		,old_marketing_group_name 
		,old_marketing_group_type 
		,old_number_of_ftes 
		,old_number_of_ftes_as_of 
		,old_number_of_full_time_equivalents 
		,old_number_of_full_time_equivalents_as_of_date 
		,old_coverage_subject_to_employer_mandate 
		,old_associated_account_ids
		,audit_action 
	) 
	SELECT 	 OLD.account_id
			,OLD.marketing_group_name 
			,OLD.marketing_group_type 
			,OLD.number_of_ftes 
			,OLD.number_of_ftes_as_of 
			,OLD.number_of_full_time_equivalents 
			,OLD.number_of_full_time_equivalents_as_of_date 
			,OLD.coverage_subject_to_employer_mandate 
			,OLD.associated_account_ids
			,'D';
	RETURN OLD;
END;
$$;
GO 

CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_marketing_group_account_info_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_marketing_group_account_info (
		 account_id
		,new_marketing_group_name 
		,new_marketing_group_type 
		,new_number_of_ftes 
		,new_number_of_ftes_as_of 
		,new_number_of_full_time_equivalents 
		,new_number_of_full_time_equivalents_as_of_date 
		,new_coverage_subject_to_employer_mandate 
		,new_associated_account_ids
		,audit_action 
	) 
	SELECT 	 NEW.account_id
			,NEW.marketing_group_name 
			,NEW.marketing_group_type 
			,NEW.number_of_ftes 
			,NEW.number_of_ftes_as_of 
			,NEW.number_of_full_time_equivalents 
			,NEW.number_of_full_time_equivalents_as_of_date 
			,NEW.coverage_subject_to_employer_mandate 
			,NEW.associated_account_ids 
			,'I';
	RETURN NEW;
END;
$$;
GO 

CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_marketing_group_account_info_u() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_marketing_group_account_info (
		 account_id
		,old_marketing_group_name 
		,new_marketing_group_name 
		,old_marketing_group_type 
		,new_marketing_group_type 
		,old_number_of_ftes 
		,new_number_of_ftes 
		,old_number_of_ftes_as_of 
		,new_number_of_ftes_as_of 
		,old_number_of_full_time_equivalents 
		,new_number_of_full_time_equivalents 
		,old_number_of_full_time_equivalents_as_of_date 
		,new_number_of_full_time_equivalents_as_of_date 
		,old_coverage_subject_to_employer_mandate 
		,new_coverage_subject_to_employer_mandate 
		,old_associated_account_ids 
		,new_associated_account_ids 
		,audit_action 
	) 
	SELECT 	 OLD.account_id
			,OLD.marketing_group_name 
			,NEW.marketing_group_name 
			,OLD.marketing_group_type 
			,NEW.marketing_group_type 
			,OLD.number_of_ftes 
			,NEW.number_of_ftes 
			,OLD.number_of_ftes_as_of 
			,NEW.number_of_ftes_as_of 
			,OLD.number_of_full_time_equivalents 
			,NEW.number_of_full_time_equivalents 
			,OLD.number_of_full_time_equivalents_as_of_date 
			,NEW.number_of_full_time_equivalents_as_of_date 
			,OLD.coverage_subject_to_employer_mandate 
			,NEW.coverage_subject_to_emploery_mandate 
			,OLD.associated_account_ids 
			,NEW.associated_account_ids
			,'U';
	RETURN OLD;
END;
$$;
GO 