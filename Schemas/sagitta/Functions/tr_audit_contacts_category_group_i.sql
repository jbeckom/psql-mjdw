CREATE OR REPLACE FUNCTION sagitta.tr_audit_contacts_category_group_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_contacts_category_group (
		 sagitem
		,lis
		,new_category_cd
		,new_category_desc
		,audit_action 
	)
	SELECT 	 NEW.sagitem
			,NEW.lis
			,NEW.category_cd
			,NEW.category_desc
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_contacts_category_group_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_contacts_category_group_i() TO rl_sagitta_x;
GO 
