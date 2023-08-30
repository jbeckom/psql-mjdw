/******************/
/*** DATA TYPES ***/
/******************/
ALTER TABLE benefitpoint.audit_phone 
	 ALTER COLUMN old_phone_type SET DATA TYPE TEXT USING old_phone_type::TEXT 
	,ALTER COLUMN new_phone_type SET DATA TYPE TEXT USING new_phone_type::TEXT;
GO 

ALTER TABLE benefitpoint.phone 
	ALTER COLUMN phone_type SET DATA TYPE TEXT USING phone_type::TEXT;
GO 

DROP TYPE IF EXISTS benefitpoint.phone_type;
GO 

/*******************/
/*** CONSTRAINTS ***/
/*******************/
ALTER TABLE benefitpoint.phone 
	ADD CONSTRAINT phone_uid UNIQUE (phone_source, source_type, source_key, area_code, phone_number, phone_type);
	
/*****************/
/*** FUNCTIONS ***/
/*****************/
DROP FUNCTION IF EXISTS benefitpoint.sp_phone_delete(TEXT, TEXT, int);
GO 

DROP FUNCTION IF EXISTS benefitpoint.sp_phone_insert(TEXT, TEXT, int, text);
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
		,phone_number
		,phone_type
	)
	SELECT 	 phone_source
			,source_type
			,source_key
			,area_code
			,phone_number
			,phone_type
	FROM 	benefitpoint.stg_phone 
	ON CONFLICT (phone_source, source_type, source_key, area_code, phone_number, phone_type) DO NOTHING;

	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_phone_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_phone_upsert() TO rl_benefitpoint_x;
GO 
