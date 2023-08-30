DROP FUNCTION IF EXISTS powerapps.sp_sagitta_contact_upsert(int);
GO 

CREATE OR REPLACE FUNCTION powerapps.sp_contact_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO powerapps.contact (
		 contact_source
		,source_key
		,first_name
		,last_name
		,contact_type
		,parent_account_guid
		,job_title
		,preferred_contact
		,gender
		,family_status
		,spouse_name
		,dob
		,anniversary
		,allow_email
		,follow_email
		,allow_bulk_email
		,allow_phone
		,allow_fax
		,allow_mail
		,description
		,contact_owner
		,status
		,status_reason
		,modify_dt
	)
	SELECT 	 contact_source
			,source_key
			,first_name
			,last_name
			,contact_type
			,parent_account_guid::uuid
			,job_title
			,preferred_contact::bool
			,gender
			,family_status
			,spouse_name
			,dob::date
			,anniversary::date
			,allow_email::bool
			,follow_email::bool
			,allow_bulk_email::bool
			,allow_phone::bool
			,allow_fax::bool
			,allow_mail::bool
			,description
			,contact_owner
			,status
			,status_reason
			,modify_dt
	FROM 	powerapps.stg_contact 
	ON CONFLICT (contact_source, source_key) DO UPDATE 
	SET 	 first_name 			= excluded.first_name
			,last_name 				= excluded.last_name
			,contact_type 			= excluded.contact_type
			,parent_account_guid 	= excluded.parent_account_guid
			,job_title 				= excluded.job_title
			,preferred_contact 		= excluded.preferred_contact
			,gender 				= excluded.gender
			,family_status 			= excluded.family_status
			,spouse_name 			= excluded.spouse_name
			,dob 					= excluded.dob
			,anniversary 			= excluded.anniversary
			,allow_email 			= excluded.allow_email
			,follow_email 			= excluded.follow_email
			,allow_bulk_email 		= excluded.allow_bulk_email
			,allow_phone 			= excluded.allow_phone
			,allow_fax 				= excluded.allow_fax
			,allow_mail 			= excluded.allow_mail
			,description 			= excluded.description
			,contact_owner 			= excluded.contact_owner
			,status 				= excluded.status
			,status_reason 			= excluded.status_reason
			,modify_dt 				= excluded.modify_dt
	WHERE 	(contact.first_name,contact.last_name,contact.contact_type,contact.parent_account_guid,contact.job_title,contact.preferred_contact,contact.gender,contact.family_status,contact.spouse_name,contact.dob,contact.anniversary,contact.allow_email,contact.follow_email,contact.allow_bulk_email,contact.allow_phone,contact.allow_fax,contact.allow_mail,contact.description,contact.contact_owner,contact.status,contact.status_reason,contact.modify_dt) 
		IS DISTINCT FROM 	(excluded.first_name,excluded.last_name,excluded.contact_type,excluded.parent_account_guid,excluded.job_title,excluded.preferred_contact,excluded.gender,excluded.family_status,excluded.spouse_name,excluded.dob,excluded.anniversary,excluded.allow_email,excluded.follow_email,excluded.allow_bulk_email,excluded.allow_phone,excluded.allow_fax,excluded.allow_mail,excluded.description,excluded.contact_owner,excluded.status,excluded.status_reason,excluded.modify_dt);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.sp_contact_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION powerapps.sp_contact_upsert() TO rl_powerapps_x;
GO 