/***********************/
/*** DATA STRUCTURES ***/
/***********************/
DROP TABLE IF EXISTS benefitpoint.carrier_appointment;
GO 

CREATE TABLE benefitpoint.carrier_appointment (
	 account_id 				int 			NOT NULL 
	,carrier_appointment_id 	int 			NOT NULL 
	,carrier_id 				int 			NOT NULL 
	,appointment_on 			timestamp 		NULL 
	,appointment_number 		TEXT 			NULL 
	,states 					TEXT 			NULL  
	,active 					bool 			NULL  
	,CONSTRAINT carrier_appointment_pkey PRIMARY KEY (account_id, carrier_id, carrier_appointment_id)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.carrier_appointment OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.carrier_appointment TO rl_benefitpoint_r;
GO 

GRANT INSERT ON TABLE benefitpoint.carrier_appointment TO rl_benefitpoint_a;
GO 

GRANT UPDATE ON TABLE benefitpoint.carrier_appointment TO rl_benefitpoint_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON benefitpoint.carrier_appointment FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_carrier_appointment_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON benefitpoint.carrier_appointment FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_carrier_appointment_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON benefitpoint.carrier_appointment FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION benefitpoint.tr_audit_carrier_appointment_u();
GO 

DROP TABLE IF EXISTS benefitpoint.audit_carrier_appointment;
GO 

CREATE TABLE IF NOT EXISTS benefitpoint.audit_carrier_appointment (
	 account_id 				int 			NOT NULL 
	,carrier_appointment_id 	int 			NOT NULL 
	,carrier_id 				int 			NOT NULL 
	,old_appointment_on 		timestamp 		NULL 
	,new_appointment_on 		timestamp 		NULL 
	,old_appointment_number 	TEXT 			NULL 
	,new_appointment_number 	TEXT 			NULL 
	,old_states 				TEXT 			NULL 
	,new_states 				TEXT 			NULL 
	,old_active 				bool 			NULL 
	,new_active 				bool 			NULL 
	,audit_action 				char(1) 		NOT NULL 
	,audit_user 				TEXT 			NOT NULL 	DEFAULT current_user
	,audit_timestamp 			timestamp 		NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 					bigint 			NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.audit_carrier_appointment OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE benefitpoint.audit_carrier_appointment TO rl_benefitpoint_a;
GO 

/*************************/
/*** TRIGGER FUNCTIONS ***/
/*************************/
CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_carrier_appointment_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_carrier_appointment (
		 account_id 
		,carrier_appointment_id 
		,carrier_id 
		,old_appointment_on 
		,old_appointment_number 
		,old_states 
		,old_active 
		,audit_action
	)
	SELECT 	 OLD.account_id 
			,OLD.carrier_appointment_id 
			,OLD.carrier_id 
			,OLD.appointment_on 
			,OLD.appointment_number 
			,OLD.states 
			,OLD.active 
			,'D';
	RETURN OLD;
END;
$$;
GO 

CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_carrier_appointment_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_carrier_appointment (
		 account_id 
		,carrier_appointment_id 
		,carrier_id 
		,new_appointment_on 
		,new_appointment_number 
		,new_states 
		,new_active 
		,audit_action
	)
	SELECT 	 NEW.account_id 
			,NEW.carrier_appointment_id 
			,NEW.carrier_id 
			,NEW.appointment_on 
			,NEW.appointment_number 
			,NEW.states 
			,NEW.active 
			,'I';
	RETURN NEW;
END;
$$;
GO 

CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_carrier_appointment_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_carrier_appointment (
		 account_id 
		,carrier_appointment_id 
		,carrier_id 
		,old_appointment_on 
		,new_appointment_on
		,old_appointment_number 
		,new_appointment_number
		,old_active 
		,new_active
		,audit_action
	)
	SELECT 	 OLD.account_id 
			,OLD.carrier_appointment_id 
			,OLD.carrier_id 
			,OLD.appointment_on 
			,NEW.appointment_on
			,OLD.appointment_number 
			,NEW.appointment_number
			,OLD.states 
			,NEW.states 
			,OLD.active 
			,NEW.active
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*****************/
/*** FUNCTIONS ***/
/*****************/
DROP FUNCTION IF EXISTS benefitpoint.sp_carrier_appointment_upsert(int, int, text);
GO 

CREATE OR REPLACE FUNCTION benefitpoint.sp_carrier_appointment_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO benefitpoint.carrier_appointment (
		 account_id
		,carrier_appointment_id
		,carrier_id
		,appointment_on
		,appointment_number
		,active
	)
	SELECT 	 account_id
			,carrier_appointment_id
			,carrier_id
			,appointment_on
			,appointment_number
			,active
	FROM 	benefitpoint.stg_carrier_appointment 
	ON CONFLICT (account_id, carrier_appointment_id, carrier_id) DO UPDATE 
	SET 	 appointment_on 		= excluded.appointment_on
			,appointment_number 	= excluded.appointment_number
			,active 				= excluded.active
	WHERE 	(carrier_appointment.appointment_on,carrier_appointment.appointment_number,carrier_appointment.active) 
		IS DISTINCT FROM 	(excluded.appointment_on,excluded.appointment_number,excluded.active);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_carrier_appointment_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_carrier_appointment_upsert() TO rl_benefitpoint_x;
GO 
