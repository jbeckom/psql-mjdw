CREATE OR REPLACE FUNCTION sagitta.tr_audit_contacts_website_group_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_contacts_website_group (
		 sagitem
		,lis
		,new_type
		,new_website
		,new_primary
		,new_preferred
		,audit_action
	)
	SELECT 	 NEW.sagitem
			,NEW.lis
			,NEW."type"
			,NEW.website
			,NEW."primary"
			,NEW.preferred
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_contacts_website_group_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_contacts_website_group_i() TO rl_sagitta_x;
GO 
