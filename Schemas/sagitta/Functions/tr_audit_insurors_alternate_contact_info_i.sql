CREATE OR REPLACE FUNCTION sagitta.tr_audit_insurors_alternate_contact_info_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_insurors_alternate_contact_info (
		 sagitem 
		,lis 
		,new_alternate_contact_type_cd 
		,new_alternate_contact_name 
		,new_alternate_contact_addr_1 
		,new_alternate_contact_postal_code 
		,new_alternate_contact_postal_extension_code 
		,new_alternate_contact_city 
		,new_alternate_contact_state_prov_cd 
		,new_alternate_contact_salutation 
		,new_alternate_contact_phone_number 
		,new_alternate_contact_phone_extension_number 
		,new_alternate_contact_addr_2 
		,new_contact_fax_number 
		,new_email_addr 
		,audit_action 
	)
	SELECT 	 NEW.sagitem 
			,NEW.lis 
			,NEW.alternate_contact_type_cd 
			,NEW.alternate_contact_name 
			,NEW.alternate_contact_addr_1 
			,NEW.alternate_contact_postal_code 
			,NEW.alternate_contact_postal_extension_code 
			,NEW.alternate_contact_city 
			,NEW.alternate_contact_state_prov_cd 
			,NEW.alternate_contact_salutation 
			,NEW.alternate_contact_phone_number 
			,NEW.alternate_contact_phone_extension_number 
			,NEW.alternate_contact_addr_2 
			,NEW.contact_fax_number 
			,NEW.email_addr 
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_insurors_alternate_contact_info_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_insurors_alternate_contact_info_i() TO rl_sagitta_x;
GO 
