CREATE OR REPLACE FUNCTION benefitpoint.fn_custom_section_id (_label text)
RETURNS int 
LANGUAGE plpgsql 
AS $$

BEGIN 
	RETURN (
		SELECT 	cs_id
		FROM 	benefitpoint.custom_section 
		WHERE 	"label" = _label
	);
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.fn_custom_section_id (text) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.fn_custom_section_id (text) TO rl_benefitpoint_x;
GO 
