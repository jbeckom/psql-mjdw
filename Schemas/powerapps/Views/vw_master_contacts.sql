CREATE VIEW powerapps.vw_master_contacts AS 
SELECT 	 contact_source
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
		,guid
		,modify_dt
FROM 	powerapps.contact
WHERE 	source_key = master_contact;
GO 

/*** PERMISSIONS ***/
ALTER VIEW powerapps.vw_master_contacts OWNER TO mj_admin;
GO 

GRANT SELECT ON powerapps.vw_master_contacts TO rl_powerapps_r;
GO
