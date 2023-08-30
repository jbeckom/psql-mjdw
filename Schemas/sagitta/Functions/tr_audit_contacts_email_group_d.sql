CREATE OR REPLACE FUNCTION sagitta.tr_audit_contacts_email_group_d() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_contacts_email_group (
		 sagitem
		,lis
		,old_type
		,old_email_address
		,old_primary
		,old_preferred
		,audit_action 
	)
	SELECT 	 OLD.sagitem
			,OLD.lis
			,OLD."type"
			,OLD.email_address
			,OLD."primary"
			,OLD.preferred
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_contacts_email_group_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_contacts_email_group_d() TO rl_sagitta_x;
GO 
