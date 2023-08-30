CREATE OR REPLACE FUNCTION sagitta.tr_audit_contacts_phone_group_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_contacts_phone_group (
		 sagitem
		,lis
		,new_type
		,new_phone_number
		,new_extension
		,new_primary_phone
		,new_mobile_number
		,new_primary_mobile
		,new_fax
		,new_preferred
		,audit_action
	)
	SELECT 	 NEW.sagitem
			,NEW.lis
			,NEW."type"
			,NEW.phone_number
			,NEW."extension"
			,NEW.primary_phone
			,NEW.mobile_number
			,NEW.primary_mobile
			,NEW.fax
			,NEW.preferred
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_contacts_phone_group_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_contacts_phone_group_i() TO rl_sagitta_x;
GO 
