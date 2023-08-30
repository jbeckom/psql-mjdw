CREATE OR REPLACE FUNCTION sagitta.tr_audit_contacts_address_group_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_contacts_address_group (
		 sagitem
		,lis
		,new_type
		,new_address
		,new_address_2
		,new_zip
		,new_zip_ext
		,new_city
		,new_state
		,new_country
		,new_primary
		,new_preferred
		,audit_action 
	)
	SELECT 	 NEW.sagitem
			,NEW.lis
			,NEW."type"
			,NEW.address
			,NEW.address_2
			,NEW.zip
			,NEW.zip_ext
			,NEW.city
			,NEW.state
			,NEW.country
			,NEW."primary"
			,NEW.preferred
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_contacts_address_group_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_contacts_address_group_i() TO rl_sagitta_x;
GO 
