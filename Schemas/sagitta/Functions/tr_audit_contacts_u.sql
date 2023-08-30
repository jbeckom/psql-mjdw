CREATE OR REPLACE FUNCTION sagitta.tr_audit_contacts_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_contacts (
		 sagitem
		,old_audit_staff_cd
		,new_audit_staff_cd
		,old_audit_entry_dt
		,new_audit_entry_dt
		,old_audit_time
		,new_audit_time
		,old_audit_cd
		,new_audit_cd
		,old_audit_history_record_number
		,new_audit_history_record_number
		,old_audit_program
		,new_audit_program
		,old_client_id
		,new_client_id
		,old_contact_type_cd
		,new_contact_type_cd
		,old_given_name
		,new_given_name
		,old_other_given_name
		,new_other_given_name
		,old_surname
		,new_surname
		,old_suffix
		,new_suffix
		,old_salutation
		,new_salutation
		,old_birth_dt
		,new_birth_dt
		,old_spouse
		,new_spouse
		,old_profession 
		,new_profession
		,old_title
		,new_title
		,old_company
		,new_company
		,old_sex_cd
		,new_sex_cd
		,old_office_location
		,new_office_location
		,old_comments
		,new_comments
		,audit_action 
	)
	SELECT 	 OLD.sagitem
			,OLD.audit_staff_cd
			,NEW.audit_staff_cd
			,OLD.audit_entry_dt
			,NEW.audit_entry_dt
			,OLD.audit_time
			,NEW.audit_time
			,OLD.audit_cd
			,NEW.audit_cd
			,OLD.audit_history_record_number
			,NEW.audit_history_record_number
			,OLD.audit_program
			,NEW.audit_program
			,OLD.client_id
			,NEW.client_id
			,OLD.contact_type_cd
			,NEW.contact_type_cd
			,OLD.given_name
			,NEW.given_name
			,OLD.other_given_name
			,NEW.other_given_name
			,OLD.surname
			,NEW.surname
			,OLD.suffix
			,NEW.suffix
			,OLD.salutation
			,NEW.salutation
			,OLD.birth_dt
			,NEW.birth_dt
			,OLD.spouse
			,NEW.spouse
			,OLD.profession
			,NEW.profession
			,OLD.title
			,NEW.title
			,OLD.company
			,NEW.company
			,OLD.sex_cd
			,NEW.sex_cd
			,OLD.office_location
			,NEW.office_location
			,OLD."comments"
			,NEW."comments"
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_contacts_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_contacts_u() TO rl_sagitta_x;
GO 
