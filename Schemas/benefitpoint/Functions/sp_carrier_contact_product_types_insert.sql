CREATE OR REPLACE FUNCTION benefitpoint.sp_carrier_contact_product_types_insert (_carrier_id int, _contact_id int, _product_type_id int)
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	rc := 0;

	INSERT INTO benefitpoint.carrier_contact_product_types (carrier_id, contact_id, product_type_id) 
	VALUES (_carrier_id, _contact_id, _product_type_id);

	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_carrier_contact_product_types_insert (int, int, int) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_carrier_contact_product_types_insert (int, int, int) TO rl_benefitpoint_x;
GO 
