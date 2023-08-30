CREATE OR REPLACE FUNCTION powerapps.sp_sagitta_contact_upsert(contact_key int)
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;

BEGIN 
	rc := 0;
	
	INSERT INTO powerapps.contact (
		 contact_source
		,source_key 
		,first_name 
		,last_name 
		,contact_type 
		,parent_account_guid 
		,job_title 
		,gender 
		,spouse_name 
		,dob
		,modify_dt
	)
	SELECT 	 'SAGITTA' 							AS contact_source
			,c.sagitem 							AS source_key
			,c.given_name 						AS first_name
			,c.surname 							AS last_name 
			,t.type_description 				AS contact_type
			,parent.guid 						AS parent_account_guid 
			,c.title 							AS job_title 
			,CASE (c.sex_cd)
				WHEN 'F' 	THEN 'Female'
				WHEN 'M' 	THEN 'Male'
				ELSE NULL 
			 END 								AS gender
			,c.spouse 							AS spouse_name 
			,sagitta.fn_int_date(c.birth_dt) 	AS dob
			,c.modify_dt 						AS modify_dt 
	FROM 	sagitta.contacts 		AS c
		INNER JOIN powerapps.account 	AS parent
			ON 	c.client_id::TEXT = parent.source_key::text
			AND parent.account_source = 'SAGITTA'
		LEFT JOIN sagitta."types" 	AS t
			ON c.contact_type_cd = t.sagitem
	WHERE 	c.sagitem = contact_key
	ON CONFLICT (contact_source, source_key) DO UPDATE 
		SET 	 first_name 	= excluded.first_name
				,last_name 		= excluded.last_name 
				,contact_type 	= excluded.contact_type 
				,parent_account_guid 	= excluded.parent_account_guid 
				,job_title 				= excluded.job_title 
				,gender 				= excluded.gender 
				,spouse_name 			= excluded.spouse_name 
				,dob 					= excluded.dob
				,modify_dt  			= excluded.modify_dt 
				,is_dirty				= TRUE 
	WHERE 	(contact.first_name, contact.last_name, contact.contact_type, contact.parent_account_guid, contact.job_title, contact.gender, contact.spouse_name, contact.dob)
		IS DISTINCT FROM (excluded.first_name, excluded.last_name, excluded.contact_type, excluded.parent_account_guid, excluded.job_title, excluded.gender, excluded.spouse_name, excluded.dob);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.sp_sagitta_contact_upsert (int) OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.sp_sagitta_contact_upsert TO rl_powerapps_x;
GO