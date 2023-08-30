CREATE OR REPLACE FUNCTION sagitta.tr_audit_contacts_address_group_d() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_contacts_address_group (
		 sagitem
		,lis
		,old_type
		,old_address
		,old_address_2
		,old_zip
		,old_zip_ext
		,old_city
		,old_state
		,old_country
		,old_primary
		,old_preferred
		,audit_action 
	)
	SELECT 	 OLD.sagitem
			,OLD.lis
			,OLD."type"
			,OLD.address
			,OLD.address_2
			,OLD.zip
			,OLD.zip_ext
			,OLD.city
			,OLD.state
			,OLD.country
			,OLD."primary"
			,OLD.preferred
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_contacts_address_group_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_contacts_address_group_d() TO rl_sagitta_x;
GO 
