CREATE OR REPLACE FUNCTION sagitta.tr_audit_insurors_alternate_contact_info_d() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_insurors_alternate_contact_info (
		 sagitem 
		,lis 
		,old_alternate_contact_type_cd 
		,old_alternate_contact_name 
		,old_alternate_contact_addr_1 
		,old_alternate_contact_postal_code 
		,old_alternate_contact_postal_extension_code 
		,old_alternate_contact_city 
		,old_alternate_contact_state_prov_cd 
		,old_alternate_contact_salutation 
		,old_alternate_contact_phone_number 
		,old_alternate_contact_phone_extension_number 
		,old_alternate_contact_addr_2 
		,old_contact_fax_number 
		,old_email_addr 
		,audit_action 
	)
	SELECT 	 OLD.sagitem 
			,OLD.lis 
			,OLD.alternate_contact_type_cd 
			,OLD.alternate_contact_name 
			,OLD.alternate_contact_addr_1 
			,OLD.alternate_contact_postal_code 
			,OLD.alternate_contact_postal_extension_code 
			,OLD.alternate_contact_city 
			,OLD.alternate_contact_state_prov_cd 
			,OLD.alternate_contact_salutation 
			,OLD.alternate_contact_phone_number 
			,OLD.alternate_contact_phone_extension_number 
			,OLD.alternate_contact_addr_2 
			,OLD.contact_fax_number 
			,OLD.email_addr 
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_insurors_alternate_contact_info_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_insurors_alternate_contact_info_d() TO rl_sagitta_x;
GO 
