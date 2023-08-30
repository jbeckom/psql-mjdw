CREATE OR REPLACE FUNCTION sagitta.tr_audit_contacts_address_group_u() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_contacts_address_group (
		 sagitem
		,lis
		,old_type
        ,new_type
		,old_address
        ,new_address
		,old_address_2
        ,new_address_2
		,old_zip
        ,new_zip
		,old_zip_ext
        ,new_zip_ext
		,old_city
        ,new_city
		,old_state
        ,new_state
		,old_country
        ,new_country
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
			,OLD.address
            ,NEW.address
			,OLD.address_2
            ,NEW.address_2
			,OLD.zip
            ,NEW.zip
			,OLD.zip_ext
            ,NEW.zip_ext
			,OLD.city
            ,NEW.city
			,OLD.state
            ,NEW.state
			,OLD.country
            ,NEW.country
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
ALTER FUNCTION sagitta.tr_audit_contacts_address_group_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_contacts_address_group_u() TO rl_sagitta_x;
GO 
