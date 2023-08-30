DROP TABLE IF EXISTS benefitpoint.audit_custom_field_option_value;
GO 

CREATE TABLE benefitpoint.audit_custom_field_option_value(
	 old_custom_field_id 			int 	NULL 
	,new_custom_field_id 			int 	NULL 
	,custom_field_option_value_id 	int 	NOT NULL 
	,old_description 				TEXT 	NULL 
	,new_description 				TEXT 	NULL 
	,old_active 					bool 	NULL 
	,new_active 					bool 	NULL 
	,old_sort_order 				int 	NULL 
	,new_sort_order 				int 	NULL 
	,old_default_option_value 		bool 	NULL 
	,new_default_option_value 		bool 	NULL 
	,old_code 						TEXT 	NULL 
	,new_code 						TEXT 	NULL 
	,old_dependent_trigger 			bool 	NULL 
	,new_dependent_trigger 			bool 	NULL 
	,audit_action 					char(1) 	NOT NULL 
	,audit_user 					TEXT 		NOT NULL 	DEFAULT current_user
	,audit_timestamp 				timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 						bigint 		NOT NULL 	GENERATED ALWAYS AS IDENTITY
	,CONSTRAINT audit_custom_field_option_value_pkey PRIMARY KEY (audit_id)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.audit_custom_field_option_value OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.audit_custom_field_option_value TO rl_benefitpoint_r;
GO 

GRANT INSERT ON TABLE benefitpoint.audit_custom_field_option_value TO rl_benefitpoint_a;
GO 

/****************************************************************************************************************/

CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_custom_field_option_value_d()
RETURNS TRIGGER 
LANGUAGE plpgsql
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_custom_field_option_value (
		 old_custom_field_id 
		,custom_field_option_value_id
		,old_description
		,old_active
		,old_sort_order
		,old_default_option_value
		,old_code
		,old_dependent_trigger
		,audit_action
	)
	SELECT 	 OLD.custom_field_id
			,OLD.custom_field_option_value_id
			,OLD.description
			,OLD.active
			,OLD.sort_order
			,OLD.default_option_value
			,OLD.code
			,OLD.dependent_trigger 
			,'D';
	RETURN OLD;
END;
$$;
GO 

/****************************************************************************************************************/

CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_custom_field_option_value_i()
RETURNS TRIGGER 
LANGUAGE plpgsql
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_custom_field_option_value (
		 new_custom_field_id
		,custom_field_option_value_id
		,new_description
		,new_active
		,new_sort_order
		,new_default_option_value
		,new_code
		,new_dependent_trigger
		,audit_action
	)
	SELECT 	 NEW.custom_field_id 
			,NEW.custom_field_option_value_id
			,NEW.description
			,NEW.active
			,NEW.sort_order
			,NEW.default_option_value
			,NEW.code 
			,NEW.dependent_trigger 
			,'I';
	RETURN NEW;
END;
$$;
GO 

/****************************************************************************************************************/

CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_custom_field_option_value_u()
RETURNS TRIGGER 
LANGUAGE plpgsql
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_custom_field_option_value (
		 old_custom_field_id 
		,new_custom_field_id 
		,custom_field_option_value_id
		,old_description
		,new_description
		,old_active
		,new_active
		,old_sort_order
		,new_sort_order
		,old_default_option_value
		,new_default_option_value
		,old_code
		,new_code
		,old_dependent_trigger 
		,new_dependent_trigger 
		,audit_action
	)
	SELECT 	 OLD.custom_field_id 
			,NEW.custom_field_id 
			,OLD.custom_field_option_value_id
			,OLD.description
			,NEW.description
			,OLD.active
			,NEW.active
			,OLD.sort_order
			,NEW.sort_order
			,OLD.default_option_value
			,NEW.default_option_value
			,OLD.code 
			,NEW.code 
			,OLD.dependent_trigger 
			,NEW.dependent_trigger 
			,'U';
	RETURN OLD;
END;
$$;
GO 