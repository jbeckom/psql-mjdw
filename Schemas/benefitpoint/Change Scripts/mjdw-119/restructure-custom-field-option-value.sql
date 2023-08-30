DROP TABLE IF EXISTS benefitpoint.custom_field_option_value;

CREATE TABLE benefitpoint.custom_field_option_value (
	 cfov_source 					TEXT 	NOT NULL 
	,source_key 					int 	NOT NULL 
	,custom_field_option_value_id 	int 	NOT NULL 
	,description 					TEXT 	NOT NULL 
	,active 						bool 	NULL 
	,sort_order 					int 	NOT NULL 
	,default_option_value 			bool 	NULL 
	,code 							TEXT 	NULL 
	,CONSTRAINT custom_field_option_value_pkey PRIMARY KEY (cfov_source, source_key, custom_field_option_value_id)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.custom_field_option_value OWNER TO mj_admin;
GO 

GRANT SELECT ON benefitpoint.custom_field_option_value TO rl_benefitpoint_r;
GO 

GRANT INSERT ON benefitpoint.custom_field_option_value TO rl_benefitpoint_a;
GO 

GRANT UPDATE ON benefitpoint.custom_field_option_value TO rl_benefitpoint_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON benefitpoint.custom_field_option_value FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_custom_field_option_value_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON benefitpoint.custom_field_option_value FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_custom_field_option_value_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON benefitpoint.custom_field_option_value FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION benefitpoint.tr_audit_custom_field_option_value_u();
GO 

/**********************/
/*** AUDIT TABLE(S) ***/
/**********************/
DROP TABLE IF EXISTS benefitpoint.audit_custom_field_option_value;
GO 

CREATE TABLE benefitpoint.audit_custom_field_option_value (
	 cfov_source 						TEXT 	NOT NULL 
	,source_key 						int 	NOT NULL 
	,custom_field_option_value_id 		int 	NOT NULL 
	,old_description 					TEXT 	NULL 
	,new_description 					TEXT 	NULL 
	,old_active 						bool 	NULL 
	,new_active 						bool 	NULL 
	,old_sort_order 					int 	NULL 
	,new_sort_order 					int 	NULL 
	,old_default_option_value 			bool 	NULL 
	,new_default_option_value 			bool 	NULL 
	,old_code 							TEXT 	NULL
	,new_code 							TEXT 	NULL
	,audit_action 						char(1) 	NOT NULL 
	,audit_user 						TEXT 		NOT NULL 	DEFAULT current_user
	,audit_timestamp 					timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 							bigint 		NOT NULL 	GENERATED BY DEFAULT AS IDENTITY 
	,CONSTRAINT audit_custom_field_option_value_pkey PRIMARY KEY (audit_id)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.audit_custom_field_option_value OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE benefitpoint.audit_custom_field_option_value TO rl_benefitpoint_a;
GO 

/**************************/
/*** FUNCTIONS/TRIGGERS ***/
/**************************/

CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_custom_field_option_value_d()
RETURNS TRIGGER 
LANGUAGE plpgsql
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_custom_field_option_value (
		 cfov_source
		,source_key
		,custom_field_option_value_id
		,old_description
		,old_active
		,old_sort_order
		,old_default_option_value
		,old_code
		,audit_action
	)
	SELECT 	 OLD.cfov_source
			,OLD.source_key
			,OLD.custom_field_option_value_id
			,OLD.description
			,OLD.active
			,OLD.sort_order
			,OLD.default_option_value
			,OLD.code
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_custom_field_option_value_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_custom_field_option_value_d() TO rl_benefitpoint_x;
GO 


CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_custom_field_option_value_i()
RETURNS TRIGGER 
LANGUAGE plpgsql
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_custom_field_option_value (
		 cfov_source 
		,source_key 
		,custom_field_option_value_id
		,new_description
		,new_active
		,new_sort_order
		,new_default_option_value
		,new_code
		,audit_action
	)
	SELECT 	 NEW.cfov_source
			,NEW.source_key 
			,NEW.custom_field_option_value_id
			,NEW.description
			,NEW.active
			,NEW.sort_order
			,NEW.default_option_value
			,NEW.code
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_custom_field_option_value_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_custom_field_option_value_i() TO rl_benefitpoint_x;
GO 


CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_custom_field_option_value_u()
RETURNS TRIGGER 
LANGUAGE plpgsql
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_custom_field_option_value (
		 cfov_source
		,source_key 
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
		,audit_action
	)
	SELECT 	 OLD.cfov_source
			,OLD.source_key
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
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_custom_field_option_value_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_custom_field_option_value_u() TO rl_benefitpoint_x;
GO 
