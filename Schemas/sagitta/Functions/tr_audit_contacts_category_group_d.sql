CREATE OR REPLACE FUNCTION sagitta.tr_audit_contacts_category_group_d() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_contacts_category_group (
		 sagitem
		,lis
		,old_category_cd
		,old_category_desc
		,audit_action 
	)
	SELECT 	 OLD.sagitem
			,OLD.lis
			,OLD.category_cd
			,OLD.category_desc
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_contacts_category_group_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_contacts_category_group_d() TO rl_sagitta_x;
GO 
