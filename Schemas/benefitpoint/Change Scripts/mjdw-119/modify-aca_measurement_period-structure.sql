/******************/
/*** DATA TYPES ***/
/******************/
ALTER TABLE benefitpoint.audit_aca_measurement_period 
	ALTER COLUMN "measurement_period" SET DATA TYPE TEXT USING "measurement_period"::TEXT;
GO 

ALTER TABLE benefitpoint.aca_measurement_period 
	ALTER COLUMN "measurement_period" SET DATA TYPE TEXT USING "measurement_period"::TEXT;
GO 

DROP TYPE IF EXISTS benefitpoint.measurement_period;
GO 

/*****************/
/*** FUNCTIONS ***/
/*****************/
DROP FUNCTION IF EXISTS benefitpoint.sp_aca_measurement_period_upsert(int, text);
GO 

CREATE OR REPLACE FUNCTION benefitpoint.sp_aca_measurement_period_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO benefitpoint.aca_measurement_period (
		 account_id
		,measurement_period
		,start_date
		,end_date 
	)
	SELECT 	 account_id
			,measurement_period
			,start_date
			,end_date 
	FROM 	benefitpoint.stg_aca_measurement_period 
	ON CONFLICT (account_id, measurement_period) DO UPDATE 
	SET 	 start_date 	= excluded.start_date 
			,end_date 		= excluded.end_date 
	WHERE 	(aca_measurement_period.start_date, aca_measurement_period.end_date) 
		IS DISTINCT FROM 	(excluded.start_date, excluded.end_date);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_aca_measurement_period_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_aca_measurement_period_upsert() TO rl_benefitpoint_x;
GO 
