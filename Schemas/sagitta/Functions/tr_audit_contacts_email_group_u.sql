CREATE OR REPLACE FUNCTION sagitta.tr_audit_contacts_email_group_u() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_contacts_email_group (
		 sagitem
		,lis
		,old_type
		,new_type
		,old_email_address 
		,new_email_address
		,old_primary 
		,new_primary
		,old_preferred 
		,new_preferred
		,audit_action 
	)
	SELECT 	 OLD.sagitem
			,OLD.lis
			,OLD."type"
			,NEW."type"
			,OLD.email_address
			,NEW.email_address
			,OLD."primary"
			,NEW."primary"
			,OLD.preferred
			,NEW.preferred
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_contacts_email_group_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_contacts_email_group_u() TO rl_sagitta_x;
GO 
