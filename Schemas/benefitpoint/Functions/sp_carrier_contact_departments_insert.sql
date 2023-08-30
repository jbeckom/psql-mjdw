CREATE OR REPLACE FUNCTION benefitpoint.sp_carrier_contact_departments_insert (_carrier_id int, _contact_id int, _department_id int) 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	rc := 0;

	INSERT INTO benefitpoint.carrier_contact_departments (carrier_id, contact_id, department_id) 
	VALUES (_carrier_id, _contact_idm, _department_id);

	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_carrier_contact_departments_insert (int, int, int) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_carrier_contact_departments_insert (int, int, int) TO rl_benefitpoint_x;
GO 
