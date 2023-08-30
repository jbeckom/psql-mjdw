CREATE OR REPLACE FUNCTION sagitta.fn_contacts_fax_group_lis (contact_key int)
RETURNS TEXT 
LANGUAGE plpgsql 
AS $$

BEGIN 
	RETURN (
		SELECT 	string_agg(cpg.lis::TEXT, ',' ORDER BY cpg.lis) 	AS lis
		FROM 	sagitta.contacts_phone_group 	AS cpg
		WHERE 	cpg.sagitem 	= contact_key 
			AND cpg.fax 		IS NOT NULL 
	);
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.fn_contacts_fax_group_lis (int) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.fn_contacts_fax_group_lis TO rl_sagitta_x;
GO 
