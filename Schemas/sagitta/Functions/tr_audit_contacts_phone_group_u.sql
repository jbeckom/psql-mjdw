CREATE OR REPLACE FUNCTION sagitta.tr_audit_contacts_phone_group_u() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_contacts_phone_group (
		 sagitem
		,lis
		,old_type
		,new_type
		,old_phone_number
		,new_phone_number
		,old_extension
		,new_extension
		,old_primary_phone
		,new_primary_phone
		,old_mobile_number
		,new_mobile_number
		,old_primary_mobile
		,new_primary_mobile
		,old_fax
		,new_fax
		,old_preferred
		,new_preferred
		,audit_action
	)
	SELECT 	 OLD.sagitem
			,OLD.lis
			,OLD."type"
			,NEW."type"
			,OLD.phone_number
			,NEW.phone_number
			,OLD."extension"
			,NEW."extension"
			,OLD.primary_phone
			,NEW.primary_phone
			,OLD.mobile_number
			,NEW.mobile_number
			,OLD.primary_mobile
			,NEW.primary_mobile
			,OLD.fax
			,NEW.fax
			,OLD.preferred
			,NEW.preferred
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_contacts_phone_group_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_contacts_phone_group_u() TO rl_sagitta_x;
GO 
