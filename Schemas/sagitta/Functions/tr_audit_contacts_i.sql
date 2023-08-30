CREATE OR REPLACE FUNCTION sagitta.tr_audit_contacts_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_contacts (
		 sagitem
		,new_audit_staff_cd
		,new_audit_entry_dt
		,new_audit_time
		,new_audit_cd
		,new_audit_history_record_number
		,new_audit_program
		,new_client_id
		,new_contact_type_cd
		,new_given_name
		,new_other_given_name
		,new_surname
		,new_suffix
		,new_salutation
		,new_birth_dt
		,new_spouse
		,new_profession
		,new_title
		,new_company
		,new_sex_cd
		,new_office_location
		,new_comments
		,audit_action 
	)
	SELECT 	 NEW.sagitem
			,NEW.audit_staff_cd
			,NEW.audit_entry_dt
			,NEW.audit_time
			,NEW.audit_cd
			,NEW.audit_history_record_number
			,NEW.audit_program
			,NEW.client_id
			,NEW.contact_type_cd
			,NEW.given_name
			,NEW.other_given_name
			,NEW.surname
			,NEW.suffix
			,NEW.salutation
			,NEW.birth_dt
			,NEW.spouse
			,NEW.profession
			,NEW.title
			,NEW.company
			,NEW.sex_cd
			,NEW.office_location
			,NEW."comments"
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_contacts_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_contacts_i() TO rl_sagitta_x;
GO 
