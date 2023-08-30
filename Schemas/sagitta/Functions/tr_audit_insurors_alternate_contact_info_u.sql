CREATE OR REPLACE FUNCTION sagitta.tr_audit_insurors_alternate_contact_info_u() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_insurors_alternate_contact_info (
		 sagitem 
		,lis 
		,old_alternate_contact_type_cd 
		,new_alternate_contact_type_cd 
		,old_alternate_contact_name 
		,new_alternate_contact_name 
		,old_alternate_contact_addr_1 
		,new_alternate_contact_addr_1 
		,old_alternate_contact_postal_code 
		,new_alternate_contact_postal_code 
		,old_alternate_contact_postal_extension_code 
		,new_alternate_contact_postal_extension_code 
		,old_alternate_contact_city 
		,new_alternate_contact_city 
		,old_alternate_contact_state_prov_cd 
		,new_alternate_contact_state_prov_cd 
		,old_alternate_contact_salutation 
		,new_alternate_contact_salutation 
		,old_alternate_contact_phone_number 
		,new_alternate_contact_phone_number 
		,old_alternate_contact_phone_extension_number 
		,new_alternate_contact_phone_extension_number 
		,old_alternate_contact_addr_2 
		,new_alternate_contact_addr_2 
		,old_contact_fax_number 
		,new_contact_fax_number 
		,old_email_addr 
		,new_email_addr 
		,audit_action 
	)
	SELECT 	 OLD.sagitem 
			,OLD.lis 
			,OLD.alternate_contact_type_cd 
			,NEW.alternate_contact_type_cd 
			,OLD.alternate_contact_name 
			,NEW.alternate_contact_name 
			,OLD.alternate_contact_addr_1 
			,NEW.alternate_contact_addr_1 
			,OLD.alternate_contact_postal_code 
			,NEW.alternate_contact_postal_code 
			,OLD.alternate_contact_postal_extension_code 
			,NEW.alternate_contact_postal_extension_code 
			,OLD.alternate_contact_city 
			,NEW.alternate_contact_city 
			,OLD.alternate_contact_state_prov_cd 
			,NEW.alternate_contact_state_prov_cd 
			,OLD.alternate_contact_salutation 
			,NEW.alternate_contact_salutation 
			,OLD.alternate_contact_phone_number 
			,NEW.alternate_contact_phone_number 
			,OLD.alternate_contact_phone_extension_number 
			,NEW.alternate_contact_phone_extension_number 
			,OLD.alternate_contact_addr_2 
			,NEW.alternate_contact_addr_2 
			,OLD.contact_fax_number 
			,NEW.contact_fax_number 
			,OLD.email_addr 
			,NEW.email_addr 
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_insurors_alternate_contact_info_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_insurors_alternate_contact_info_u() TO rl_sagitta_x;
GO 
