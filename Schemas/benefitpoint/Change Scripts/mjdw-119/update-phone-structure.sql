ALTER TABLE benefitpoint.phone 
	RENAME COLUMN phone_number TO "number";
GO 

ALTER TABLE benefitpoint.phone 
	RENAME COLUMN phone_type TO "type";
GO 

ALTER TABLE benefitpoint.audit_phone
	 RENAME COLUMN old_phone_number TO old_number;
GO 

ALTER TABLE benefitpoint.audit_phone 
	RENAME COLUMN old_phone_type TO old_type;
GO 

ALTER TABLE benefitpoint.audit_phone
	RENAME COLUMN new_phone_number TO new_number;
GO 

ALTER TABLE benefitpoint.audit_phone 
	RENAME COLUMN new_phone_type TO new_type;
GO 

CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_phone_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_phone (
		 phone_source 
		,source_type 
		,source_key 
		,old_area_code 
		,old_number 
		,old_type 
		,audit_action
	)
	SELECT 	 OLD.phone_source 
			,OLD.source_type 
			,OLD.source_key 
			,OLD.area_code 
			,OLD."number" 
			,OLD."type" 
			,'D';
	RETURN OLD;
END;
$$;
GO 

CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_phone_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_phone (
		 phone_source 
		,source_type 
		,source_key 
		,new_area_code 
		,new_number 
		,new_type 
		,audit_action
	)
	SELECT 	 NEW.phone_source 
			,NEW.source_type 
			,NEW.source_key 
			,NEW.area_code 
			,NEW."number" 
			,NEW."type" 
			,'I';
	RETURN NEW;
END;
$$;
GO 

CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_phone_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_phone (
		 phone_source 
		,source_type 
		,source_key 
		,old_area_code 
		,new_area_code 
		,old_number 
		,new_number 
		,old_type 
		,new_type 
		,audit_action
	)
	SELECT 	 OLD.phone_source 
			,OLD.source_type 
			,OLD.source_key 
			,OLD.area_code 
			,NEW.area_code 
			,OLD."number" 
			,NEW."number" 
			,OLD."type" 
			,NEW."type" 
			,'U';
	RETURN OLD;
END;
$$;
GO 

CREATE OR REPLACE FUNCTION benefitpoint.sp_phone_upsert()
RETURNS int
LANGUAGE plpgsql
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO benefitpoint.phone(
		 phone_source
		,source_type
		,source_key
		,area_code
		,"number"
		,"type"
	)
	SELECT 	 phone_source
			,source_type
			,source_key
			,area_code
			,"number"
			,"type"
	FROM 	benefitpoint.stg_phone 
	ON CONFLICT (phone_source, source_type, source_key, area_code, "number", "type") DO NOTHING;

	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 