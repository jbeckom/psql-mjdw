CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_carrier_contact_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_carrier_contact(
		 carrier_id 
		,old_all_contact 
		,old_title 
		,old_assistant_first_name 
		,old_assistant_last_name 
		,old_assistant_email 
		,old_market_size 
		,old_notes 
		,old_last_modified_on 
		,audit_action 
	)
	SELECT 	 OLD.carrier_id 
			,OLD.all_contact 
			,OLD.title 
			,OLD.assistant_first_name 
			,OLD.assistant_last_name 
			,OLD.assistant_email 
			,OLD.market_size 
			,OLD.notes 
			,OLD.last_modified_on 
			,'D';
	RETURN OLD;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_carrier_contact_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_carrier_contact_d() TO rl_benefitpoint_x;
GO 
