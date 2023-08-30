CREATE OR REPLACE FUNCTION sagitta.tr_audit_contacts_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_contacts (
		 sagitem
		,old_audit_staff_cd
		,old_audit_entry_dt
		,old_audit_time
		,old_audit_cd
		,old_audit_history_record_number
		,old_audit_program
		,old_client_id
		,old_contact_type_cd
		,old_given_name
		,old_other_given_name
		,old_surname
		,old_suffix
		,old_salutation
		,old_birth_dt
		,old_spouse
		,old_profession 
		,old_title
		,old_company
		,old_sex_cd
		,old_office_location
		,old_comments
		,audit_action 
	)
	SELECT 	 OLD.sagitem
			,OLD.audit_staff_cd
			,OLD.audit_entry_dt
			,OLD.audit_time
			,OLD.audit_cd
			,OLD.audit_history_record_number
			,OLD.audit_program
			,OLD.client_id
			,OLD.contact_type_cd
			,OLD.given_name
			,OLD.other_given_name
			,OLD.surname
			,OLD.suffix
			,OLD.salutation
			,OLD.birth_dt
			,OLD.spouse
			,OLD.profession
			,OLD.title
			,OLD.company
			,OLD.sex_cd
			,OLD.office_location
			,OLD."comments"
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_contacts_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_contacts_d() TO rl_sagitta_x;
GO 
