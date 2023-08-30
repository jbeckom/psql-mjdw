/********************/
/*** DEPENDENCIES ***/
/********************/
ALTER TABLE benefitpoint.account_contact_locations 
	DROP CONSTRAINT IF EXISTS account_contact_fkey;
GO 

/********************/
/*** ENTITY TABLE ***/
/********************/
DROP TABLE IF EXISTS benefitpoint.account_contact;
GO 

CREATE TABLE benefitpoint.account_contact (
	 account_id 			int 			NOT NULL 
	,contact_id 			int 			NOT NULL 
	,title 					varchar(100) 	NULL 
	,additional_info 		varchar(100) 	NULL 
	,"primary" 				boolean 		NULL 
	,primary_location_id 	int 			NULL 
	,location_ids 			TEXT 			NULL 
	,responsibilities 		TEXT 			NULL 
	,notes 					varchar(500) 	NULL 
	,last_modified_on 		timestamptz 	NULL 
	,CONSTRAINT account_contact_pkey PRIMARY KEY (account_id, contact_id)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.account_contact OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.account_contact TO rl_benefitpoint_r;
GO 

GRANT INSERT ON TABLE benefitpoint.account_contact TO rl_benefitpoint_a;
GO 

GRANT UPDATE ON TABLE benefitpoint.account_contact TO rl_benefitpoint_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON benefitpoint.account_contact FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_account_contact_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON benefitpoint.account_contact FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_account_contact_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON benefitpoint.account_contact FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION benefitpoint.tr_audit_account_contact_u();
GO 


/*******************/
/*** AUDIT TABLE ***/
/*******************/
DROP TABLE IF EXISTS benefitpoint.audit_account_contact;
GO 

CREATE TABLE benefitpoint.audit_account_contact (
	 account_id 			    int 			NOT NULL 
	,contact_id 				int 			NOT NULL 
	,old_title 					varchar(100) 	NULL 
	,new_title 					varchar(100) 	NULL 
	,old_additional_info 		varchar(100) 	NULL 
	,new_additional_info 		varchar(100) 	NULL 
	,old_primary 				boolean 		NULL 
	,new_primary 				boolean 		NULL 
	,old_primary_location_id 	int 			NULL 
	,new_primary_location_id 	int 			NULL 
	,old_location_ids 			TEXT 			NULL 
	,new_location_ids 			TEXT 			NULL 
	,old_responsibilities 		TEXT 			NULL 
	,new_responsibilities 		TEXT 			NULL 
	,old_notes 					varchar(500) 	NULL 
	,new_notes 					varchar(500) 	NULL 
	,old_last_modified_on 		timestamptz 	NULL 
	,new_last_modified_on 		timestamptz 	NULL 
	,audit_action 				char(1) 		NOT NULL 
	,audit_user 				TEXT 			NOT NULL 	DEFAULT current_user 
	,audit_timestamp 			timestamp 		NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 					bigint 			NOT NULL 	GENERATED ALWAYS AS IDENTITY 
	,CONSTRAINT audit_account_contact_pkey PRIMARY KEY (audit_id)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.audit_account_contact OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.audit_account_contact TO rl_benefitpoint_r;
GO 

GRANT INSERT ON TABLE benefitpoint.audit_account_contact TO rl_benefitpoint_a;
GO 


/**********************/
/*** AUDIT TRIGGERS ***/
/**********************/
CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_account_contact_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO benefitpoint.audit_account_contact (
		 account_id 
		,contact_id 
		,old_title 
		,old_additional_info 
		,old_primary 
		,old_primary_location_id 
		,old_location_ids
		,old_responsibilities 
		,old_notes 
		,old_last_modified_on 
		,audit_action
	)
	SELECT 	 OLD.account_id 
			,OLD.contact_id 
			,OLD.title 
			,OLD.additional_info 
			,OLD."primary" 
			,OLD.primary_location_id 
			,OLD.location_ids 
			,OLD.responsibilities 
			,OLD.notes 
			,OLD.last_modified_on 
			,'D';
		
	RETURN OLD;
END;
$$;
GO 

CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_account_contact_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO benefitpoint.audit_account_contact (
		 account_id 
		,contact_id
		,new_title 
		,new_additional_info 
		,new_primary 
		,new_primary_location_id 
		,new_location_ids 
		,new_responsibilities 
		,new_notes 
		,new_last_modified_on 
		,audit_action
	)
	SELECT 	 NEW.account_id 
			,NEW.contact_id
			,NEW.title 
			,NEW.additional_info 
			,NEW."primary" 
			,NEW.primary_location_id 
			,NEW.location_ids 
			,NEW.responsibilities 
			,NEW.notes 
			,NEW.last_modified_on 
			,'I';
		
	RETURN NEW;
END;
$$;
GO 

CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_account_contact_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO benefitpoint.audit_account_contact (
		 account_id 
		,contact_id
		,old_title 
		,new_title 
		,old_additional_info 
		,new_additional_info 
		,old_primary 
		,new_primary 
		,old_primary_location_id 
		,new_primary_location_id 
		,old_location_ids 
		,new_location_ids 
		,old_responsibilities 
		,new_responsibilities 
		,old_notes 
		,new_notes 
		,old_last_modified_on 
		,new_last_modified_on 
		,audit_action
	)
	SELECT 	 OLD.account_id 
			,OLD.contact_id 
			,OLD.title 
			,NEW.title 
			,OLD.additional_info 
			,NEW.additional_info 
			,OLD."primary" 
			,NEW."primary" 
			,OLD.primary_location_id 
			,NEW.primary_location_id 
			,OLD.location_ids 
			,NEW.location_ids 
			,OLD.responsibilities 
			,NEW.responsibilities 
			,OLD.notes 
			,NEW.notes 
			,OLD.last_modified_on 
			,NEW.last_modified_on 
			,'U';
		
	RETURN OLD;
END;
$$;
GO 

/***********************/
/*** UPSERT FUNCTION ***/
/***********************/
DROP FUNCTION IF EXISTS benefitpoint.sp_account_contact_upsert(int, text);
GO 

CREATE OR REPLACE FUNCTION benefitpoint.sp_account_contact_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO benefitpoint.account_contact (
		 account_id 
		,contact_id
		,title 
		,additional_info 
		,"primary" 
		,primary_location_id 
		,location_ids 
		,responsibilities 
		,notes 
		,last_modified_on 
	)
	SELECT 	 account_id 
			,contact_id 
			,title 
			,additional_info 
			,"primary" 
			,primary_location_id::int 
			,location_ids 
			,responsibilities 
			,notes 
			,last_modified_on 
	FROM 	benefitpoint.stg_account_contact 
	ON CONFLICT (account_id, contact_id) DO UPDATE 
	SET  title 					= excluded.title 
		,additional_info 		= excluded.additional_info 
		,"primary" 				= excluded."primary" 
		,primary_location_id 	= excluded.primary_location_id 
		,location_ids 			= excluded.location_ids 
		,responsibilities 		= excluded.responsibilities 
		,notes 					= excluded.notes 
		,last_modified_on 		= excluded.last_modified_on 
	WHERE 	(account_contact.title,account_contact.additional_info,account_contact."primary",account_contact.primary_location_id,account_contact.location_ids,account_contact.responsibilities,account_contact.notes,account_contact.last_modified_on) 
		IS DISTINCT FROM 	(excluded.title,excluded.additional_info,excluded."primary",excluded.primary_location_id,excluded.location_ids,excluded.responsibilities,excluded.notes,excluded.last_modified_on);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_account_contact_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_account_contact_upsert() TO rl_benefitpoint_x;
GO 