CREATE OR REPLACE FUNCTION sagitta.fn_contacts_email_group_lis (contact_key int)
RETURNS TEXT 
LANGUAGE plpgsql 
AS $$

BEGIN 
	RETURN (
		SELECT 	string_agg(ceg.lis::TEXT, ',' ORDER BY ceg.lis) 	AS lis
		FROM 	sagitta.contacts_email_group 	AS ceg
		WHERE 	ceg.sagitem 	= contact_key
	);
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.fn_contacts_email_group_lis (int) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.fn_contacts_email_group_lis TO rl_sagitta_x;
GO 
