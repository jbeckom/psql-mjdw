CREATE OR REPLACE FUNCTION sagitta.sp_insurors_alternate_contact_info_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.insurors_alternate_contact_info (
		 sagitem 
		,lis 
		,alternate_contact_type_cd 
		,alternate_contact_name 
		,alternate_contact_addr_1 
		,alternate_contact_postal_code 
		,alternate_contact_postal_extension_code 
		,alternate_contact_city 
		,alternate_contact_state_prov_cd 
		,alternate_contact_salutation 
		,alternate_contact_phone_number 
		,alternate_contact_phone_extension_number 
		,alternate_contact_addr_2 
		,contact_fax_number 
		,email_addr 
	)
	SELECT 	 sagitem 
			,lis 
			,alternate_contact_type_cd 
			,alternate_contact_name 
			,alternate_contact_addr_1 
			,alternate_contact_postal_code 
			,alternate_contact_postal_extension_code 
			,alternate_contact_city 
			,alternate_contact_state_prov_cd 
			,alternate_contact_salutation 
			,alternate_contact_phone_number 
			,alternate_contact_phone_extension_number 
			,alternate_contact_addr_2 
			,contact_fax_number 
			,email_addr 
	FROM 	sagitta.stg_insurors_alternate_contact_info 
	ON CONFLICT (sagitem,lis) DO UPDATE 
	SET 	 alternate_contact_type_cd 					= excluded.alternate_contact_type_cd 
			,alternate_contact_name 					= excluded.alternate_contact_name 
			,alternate_contact_addr_1 					= excluded.alternate_contact_addr_1 
			,alternate_contact_postal_code 				= excluded.alternate_contact_postal_code 
			,alternate_contact_postal_extension_code 	= excluded.alternate_contact_postal_extension_code 
			,alternate_contact_city 					= excluded.alternate_contact_city 
			,alternate_contact_state_prov_cd 			= excluded.alternate_contact_state_prov_cd 
			,alternate_contact_salutation 				= excluded.alternate_contact_salutation 
			,alternate_contact_phone_number 			= excluded.alternate_contact_phone_number 
			,alternate_contact_phone_extension_number 	= excluded.alternate_contact_phone_extension_number 
			,alternate_contact_addr_2 					= excluded.alternate_contact_addr_2 
			,contact_fax_number 						= excluded.contact_fax_number 
			,email_addr 								= excluded.email_addr 
	WHERE 	(insurors_alternate_contact_info.alternate_contact_type_cd,insurors_alternate_contact_info.alternate_contact_name,insurors_alternate_contact_info.alternate_contact_addr_1,insurors_alternate_contact_info.alternate_contact_postal_code,insurors_alternate_contact_info.alternate_contact_postal_extension_code,insurors_alternate_contact_info.alternate_contact_city,insurors_alternate_contact_info.alternate_contact_state_prov_cd,insurors_alternate_contact_info.alternate_contact_salutation,insurors_alternate_contact_info.alternate_contact_phone_number,insurors_alternate_contact_info.alternate_contact_phone_extension_number,insurors_alternate_contact_info.alternate_contact_addr_2,insurors_alternate_contact_info.contact_fax_number,insurors_alternate_contact_info.email_addr) 
		IS DISTINCT FROM 	(excluded.alternate_contact_type_cd,excluded.alternate_contact_name,excluded.alternate_contact_addr_1,excluded.alternate_contact_postal_code,excluded.alternate_contact_postal_extension_code,excluded.alternate_contact_city,excluded.alternate_contact_state_prov_cd,excluded.alternate_contact_salutation,excluded.alternate_contact_phone_number,excluded.alternate_contact_phone_extension_number,excluded.alternate_contact_addr_2,excluded.contact_fax_number,excluded.email_addr); 
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO;

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_insurors_alternate_contact_info_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_insurors_alternate_contact_info_upsert() TO rl_sagitta_x;
GO 
