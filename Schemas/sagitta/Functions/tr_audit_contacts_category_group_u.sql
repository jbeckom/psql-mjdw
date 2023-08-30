CREATE OR REPLACE FUNCTION sagitta.tr_audit_contacts_category_group_u() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_contacts_category_group (
		 sagitem
		,lis
		,old_category_cd 
		,new_category_cd
		,old_category_desc 
		,new_category_desc
		,audit_action 
	)
	SELECT 	 OLD.sagitem
			,OLD.lis
			,OLD.category_cd
			,NEW.category_cd
			,OLD.category_desc
			,NEW.category_desc
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_contacts_category_group_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_contacts_category_group_u() TO rl_sagitta_x;
GO 
