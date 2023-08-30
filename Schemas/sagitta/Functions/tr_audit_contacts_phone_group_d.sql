CREATE OR REPLACE FUNCTION sagitta.tr_audit_contacts_phone_group_d() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_contacts_phone_group (
		 sagitem
		,lis
		,old_type
		,old_phone_number
		,old_extension
		,old_primary_phone
		,old_mobile_number
		,old_primary_mobile
		,old_fax
		,old_preferred
		,audit_action
	)
	SELECT 	 OLD.sagitem
			,OLD.lis
			,OLD."type"
			,OLD.phone_number
			,OLD."extension"
			,OLD.primary_phone
			,OLD.mobile_number
			,OLD.primary_mobile
			,OLD.fax
			,OLD.preferred
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_contacts_phone_group_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_contacts_phone_group_d() TO rl_sagitta_x;
GO 
