CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_carrier_contact_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_carrier_contact(
		 carrier_id 
		,new_all_contact 
		,new_title 
		,new_assistant_first_name 
		,new_assistant_last_name 
		,new_assistant_email 
		,new_market_size 
		,new_notes 
		,new_last_modified_on 
		,audit_action 
	)
	SELECT 	 NEW.carrier_id 
			,NEW.all_contact 
			,NEW.title 
			,NEW.assistant_first_name 
			,NEW.assistant_last_name 
			,NEW.assistant_email 
			,NEW.market_size 
			,NEW.notes 
			,NEW.last_modified_on 
			,'I';
	RETURN NEW;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_carrier_contact_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_carrier_contact_i() TO rl_benefitpoint_x;
GO 
