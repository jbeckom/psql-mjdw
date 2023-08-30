CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_carrier_contact_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_carrier_contact(
		 carrier_id 
		,old_all_contact 
		,new_all_contact 
		,old_title 
		,new_title 
		,old_assistant_first_name 
		,new_assistant_first_name 
		,old_assistant_last_name 
		,new_assistant_last_name 
		,old_assistant_email 
		,new_assistant_email 
		,old_market_size 
		,new_market_size 
		,old_notes 
		,new_notes 
		,old_last_modified_on 
		,new_last_modified_on 
		,audit_action 
	)
	SELECT 	 OLD.carrier_id 
			,OLD.all_contact 
			,NEW.all_contact 
			,OLD.title 
			,NEW.title 
			,OLD.assistant_first_name 
			,NEW.assistant_first_name 
			,OLD.assistant_last_name 
			,NEW.assistant_last_name 
			,OLD.assistant_email 
			,NEW.assistant_email 
			,OLD.market_size 
			,NEW.market_size 
			,OLD.notes 
			,NEW.notes 
			,OLD.last_modified_on 
			,NEW.last_modified_on 
			,'U';
	RETURN OLD;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_carrier_contact_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_carrier_contact_u() TO rl_benefitpoint_x;
GO 
