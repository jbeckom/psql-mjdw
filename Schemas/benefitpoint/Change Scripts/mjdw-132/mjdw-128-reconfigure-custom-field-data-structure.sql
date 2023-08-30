DROP TABLE IF EXISTS benefitpoint.audit_custom_field;
GO 

CREATE TABLE benefitpoint.audit_custom_field (
	 old_custom_section 	TEXT 	NULL 
	,new_custom_section 	TEXT 	NULL 
	,custom_field_id 		int 	NOT NULL 
	,old_field_type 		TEXT 	NULL 
	,new_field_type 		TEXT 	NULL 
	,old_field_value_type 	TEXT 	NULL 
	,new_field_value_type 	TEXT 	NULL 
	,old_length 			int 	NULL 
	,new_length 			int 	NULL 
	,old_label 				TEXT 	NULL 
	,new_label 				TEXT 	NULL 
	,old_required 			bool 	NULL 
	,new_required 			bool 	NULL 
	,old_active 			bool 	NULL 
	,new_active 			bool 	NULL 
	,old_sort_order 		int 	NULL 
	,new_sort_order 		int 	NULL 
	,old_phi 				bool 	NULL 
	,new_phi 				bool 	NULL 
	,old_sagitta 			bool 	NULL 
	,new_sagitta 			bool 	NULL 
	,old_sagitta_category 	TEXT 	NULL 
	,new_sagitta_category 	TEXT 	NULL 
	,old_dependent_field_parent_id 	int 	NULL 
	,new_dependent_field_parent_id 	int 	NULL 
	,audit_action 					char(1) 	NOT NULL 
	,audit_user 					TEXT 		NOT NULL 	DEFAULT current_user
	,audit_timestamp 				timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 						bigint 		NOT NULL 	GENERATED ALWAYS AS IDENTITY 
	,CONSTRAINT audit_custom_field_pkey PRIMARY KEY (audit_id)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.audit_custom_field OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.audit_custom_field TO rl_benefitpoint_r;
GO 

GRANT INSERT ON TABLE benefitpoint.audit_custom_field TO rl_benefitpoint_a;
GO 

/*********************************************************************************************************************/

CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_custom_field_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_custom_field (
		 old_custom_section
		,custom_field_id
		,old_field_type
		,old_field_value_type
		,old_length
		,old_label
		,old_required
		,old_active
		,old_sort_order
		,old_phi
		,old_sagitta
		,old_sagitta_category
		,old_dependent_field_parent_id
		,audit_action
	)
	SELECT 	 OLD.custom_section
			,OLD.custom_field_id
			,OLD.field_type
			,OLD.field_value_type
			,OLD."length"
			,OLD."label"
			,OLD.required
			,OLD.active
			,OLD.sort_order
			,OLD.phi
			,OLD.sagitta
			,OLD.sagitta_category
			,OLD.dependent_field_parent_id
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*********************************************************************************************************************/

CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_custom_field_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_custom_field (
		 new_custom_section
		,custom_field_id
		,new_field_type
		,new_field_value_type
		,new_length
		,new_label
		,new_required
		,new_active
		,new_sort_order
		,new_phi
		,new_sagitta
		,new_sagitta_category
		,new_dependent_field_parent_id
		,audit_action
	)
	SELECT 	 NEW.custom_section
			,NEW.custom_field_id
			,NEW.field_type
			,NEW.field_value_type
			,NEW."length"
			,NEW."label"
			,NEW.required
			,NEW.active
			,NEW.sort_order
			,NEW.phi
			,NEW.sagitta
			,NEW.sagitta_category
			,NEW.dependent_field_parent_id
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*********************************************************************************************************************/

CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_custom_field_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_custom_field (
		 old_custom_section
		,new_custom_section
		,custom_field_id
		,old_field_type
		,new_field_type
		,old_field_value_type
		,new_field_value_type
		,old_length
		,new_length
		,old_label
		,new_label
		,old_required
		,new_required
		,old_active
		,new_active
		,old_sort_order
		,new_sort_order
		,old_phi
		,new_phi
		,old_sagitta
		,new_sagitta
		,old_sagitta_category
		,new_sagitta_category
		,old_dependent_field_parent_id
		,new_dependent_field_parent_id
		,audit_action
	)
	SELECT 	 OLD.custom_section
			,NEW.custom_section
			,OLD.custom_field_id
			,OLD.field_type
			,NEW.field_type
			,OLD.field_value_type
			,NEW.field_value_type
			,OLD."length"
			,NEW."length"
			,OLD."label"
			,NEW."label"
			,OLD.required
			,NEW.required
			,OLD.active
			,NEW.active
			,OLD.sort_order
			,NEW.sort_order
			,OLD.phi
			,NEW.phi
			,OLD.sagitta
			,NEW.sagitta
			,OLD.sagitta_category
			,NEW.sagitta_category
			,OLD.dependent_field_parent_id
			,NEW.dependent_field_parent_id
			,'U';
	RETURN OLD;
END;
$$;
GO 