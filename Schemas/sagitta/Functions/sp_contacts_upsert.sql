DROP FUNCTION IF EXISTS sagitta.sp_contacts_upsert(int,text);
GO 

CREATE OR REPLACE FUNCTION sagitta.sp_contacts_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.contacts (
		 sagitem
		,audit_staff_cd
		,audit_entry_dt
		,audit_time
		,audit_cd
		,audit_history_record_number
		,audit_program
		,client_id
		,contact_type_cd
		,given_name
		,other_given_name
		,surname
		,suffix
		,salutation
		,birth_dt
		,spouse
		,profession
		,title
		,company
		,sex_cd
		,office_location
		,"comments"
	)
	SELECT 	 sagitem
			,audit_staff_cd
			,audit_entry_dt
			,audit_time
			,audit_cd
			,audit_history_record_number
			,audit_program
			,client_id
			,contact_type_cd
			,given_name
			,other_given_name
			,surname
			,suffix
			,salutation
			,birth_dt::int
			,spouse
			,profession
			,title
			,company
			,sex_cd
			,office_location
			,"comments"
	FROM 	sagitta.stg_contacts 
	ON CONFLICT (sagitem) DO UPDATE 
	SET 	 audit_staff_cd 				= excluded.audit_staff_cd
			,audit_entry_dt 				= excluded.audit_entry_dt
			,audit_time 					= excluded.audit_time
			,audit_cd 						= excluded.audit_cd
			,audit_history_record_number 	= excluded.audit_history_record_number
			,audit_program 					= excluded.audit_program
			,client_id 						= excluded.client_id
			,contact_type_cd 				= excluded.contact_type_cd
			,given_name 					= excluded.given_name
			,other_given_name 				= excluded.other_given_name
			,surname 						= excluded.surname
			,suffix 						= excluded.suffix
			,salutation 					= excluded.salutation
			,birth_dt 						= excluded.birth_dt
			,spouse 						= excluded.spouse
			,profession 					= excluded.profession
			,title 							= excluded.title
			,company 						= excluded.company
			,sex_cd 						= excluded.sex_cd
			,office_location 				= excluded.office_location
			,"comments" 					= excluded."comments"
	WHERE 	(contacts.audit_staff_cd,contacts.audit_entry_dt,contacts.audit_time,contacts.audit_cd,contacts.audit_history_record_number,contacts.audit_program,contacts.client_id,contacts.contact_type_cd,contacts.given_name,contacts.other_given_name,contacts.surname,contacts.suffix,contacts.salutation,contacts.birth_dt,contacts.spouse,contacts.profession,contacts.title,contacts.company,contacts.sex_cd,contacts.office_location,contacts."comments")
		IS DISTINCT FROM 	(excluded.audit_staff_cd,excluded.audit_entry_dt,excluded.audit_time,excluded.audit_cd,excluded.audit_history_record_number,excluded.audit_program,excluded.client_id,excluded.contact_type_cd,excluded.given_name,excluded.other_given_name,excluded.surname,excluded.suffix,excluded.salutation,excluded.birth_dt,excluded.spouse,excluded.profession,excluded.title,excluded.company,excluded.sex_cd,excluded.office_location,excluded."comments");
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_contacts_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_contacts_upsert() TO rl_sagitta_x;
GO 
