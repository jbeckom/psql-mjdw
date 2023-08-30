/*****************/
/*** FUNCTIONS ***/
/*****************/
DROP FUNCTION IF EXISTS benefitpoint.sp_dependent_upsert(int, text);
GO 

CREATE OR REPLACE FUNCTION benefitpoint.sp_dependent_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO benefitpoint.dependent (
		 account_id
		,dependent_id
		,relationship
	)
	SELECT 	 account_id
			,dependent_id
			,relationship
	FROM 	benefitpoint.stg_dependent 
	ON CONFLICT (account_id, dependent_id) DO UPDATE 
	SET 	relationship 	= excluded.relationship 
	WHERE 	(dependent.relationship)
		IS DISTINCT FROM 	(excluded.relationship);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_dependent_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_dependent_upsert() TO rl_benefitpoint_x;
GO 
