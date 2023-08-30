DROP TABLE IF EXISTS powerapps.stg_account_guids;
GO 
DROP TABLE IF EXISTS powerapps.stg_contact_guids;
GO 
DROP TABLE IF EXISTS powerapps.stg_address_guids;
GO 
DROP TABLE IF EXISTS powerapps.stg_email_guids;
GO 
DROP TABLE IF EXISTS powerapps.stg_fax_guids;
GO 
DROP TABLE IF EXISTS powerapps.stg_phone_guids;
GO 
/*** ACCOUNTS ***/
SELECT 	guid 
INTO 	powerapps.stg_account_guids 
FROM 	powerapps.account AS a
WHERE 	account_source = 'SAGITTA'
	AND EXISTS (
		SELECT 	1
		FROM 	benefitpoint.account_integration_info AS aii
		WHERE 	a.source_key = aii.sagitta_client_id 		
	);
GO 
/*** CONTACTS ***/
SELECT 	guid 
INTO 	powerapps.stg_contact_guids 
FROM 	powerapps.contact AS c
WHERE EXISTS (
	SELECT 	1
	FROM 	powerapps.stg_account_guids AS sag
	WHERE 	sag.guid = c.parent_account_guid 
);
GO 
/*** ADDRESSES ***/
CREATE TABLE powerapps.stg_address_guids (address_guid uuid);
GO 
INSERT INTO powerapps.stg_address_guids (address_guid)
	SELECT 	address_guid
	FROM 	powerapps.account_address AS aa
	WHERE EXISTS (
		SELECT 	1
		FROM 	powerapps.stg_account_guids
		WHERE 	guid = aa.account_guid
	)	-- 1081 
	UNION
	SELECT 	address_guid
	FROM 	powerapps.contact_address AS ca
	WHERE EXISTS (
		SELECT 	1
		FROM 	powerapps.stg_contact_guids 
		WHERE 	guid = ca.contact_guid
	);	-- 5
GO 
/*** EMAILS ***/
CREATE TABLE powerapps.stg_email_guids (email_guid uuid);
GO 
	INSERT INTO powerapps.stg_email_guids (email_guid)
	SELECT 	email_guid
	FROM 	powerapps.account_email AS ae
	WHERE EXISTS (
		SELECT 	1
		FROM 	powerapps.stg_account_guids 
		WHERE 	guid = ae.account_guid
	)	-- 26
	UNION 
	SELECT 	email_guid 
	FROM 	powerapps.contact_email AS ce
	WHERE EXISTS (
		SELECT 	1
		FROM 	powerapps.stg_contact_guids 
		WHERE 	guid = ce.contact_guid 
	); 	-- 1
GO 
/*** FAXES ***/
CREATE TABLE powerapps.stg_fax_guids (fax_guid uuid);
GO 
	INSERT INTO powerapps.stg_fax_guids (fax_guid)
	SELECT 	fax_guid
	FROM 	powerapps.account_fax AS af
	WHERE EXISTS (
		SELECT 	1
		FROM 	powerapps.stg_account_guids 
		WHERE 	guid = af.account_guid
	)	-- 60
	UNION 
	SELECT 	fax_guid 
	FROM 	powerapps.contact_fax AS cf
	WHERE EXISTS (
		SELECT 	1
		FROM 	powerapps.stg_contact_guids 
		WHERE 	guid = cf.contact_guid
	); 	-- 4
GO 
/*** PHONES ***/
CREATE TABLE powerapps.stg_phone_guids (phone_guid uuid);
GO 
	INSERT INTO powerapps.stg_phone_guids (phone_guid)
	SELECT 	phone_guid
	FROM 	powerapps.account_phone AS ap
	WHERE EXISTS (
		SELECT 	1
		FROM 	powerapps.stg_account_guids 
		WHERE 	guid = ap.account_guid
	)	-- 457
	UNION 
	SELECT 	phone_guid 
	FROM 	powerapps.contact_phone AS cp
	WHERE EXISTS (
		SELECT 	1
		FROM 	powerapps.stg_contact_guids 
		WHERE 	guid = cp.contact_guid 
	); 	-- 6 
GO 
/*** DELETES ***/
DELETE FROM powerapps.phone 
WHERE EXISTS (
	SELECT 	1
	FROM 	powerapps.stg_phone_guids 
	WHERE 	phone_guid = phone.guid
);
GO 
DELETE FROM powerapps.fax 
WHERE EXISTS (
	SELECT 	1
	FROM 	powerapps.stg_fax_guids 
	WHERE 	fax_guid = fax.guid 
);
GO 
DELETE FROM powerapps.email 
WHERE EXISTS (
	SELECT 	1
	FROM 	powerapps.stg_email_guids 
	WHERE 	email_guid = email.guid 
);
GO 
DELETE FROM powerapps.address 
WHERE EXISTS (
	SELECT 	1
	FROM 	powerapps.stg_address_guids 
	WHERE 	address_guid = address.guid 
);
GO 
DELETE FROM powerapps.contact_phone 
WHERE EXISTS (
	SELECT 	1
	FROM 	powerapps.stg_contact_guids 
	WHERE 	guid = contact_phone.contact_guid 
);
GO 
DELETE FROM powerapps.contact_fax 
WHERE EXISTS (
	SELECT 	1
	FROM 	powerapps.stg_contact_guids 
	WHERE 	guid = contact_fax.contact_guid 
);
GO 
DELETE FROM powerapps.contact_email 
WHERE EXISTS (
	SELECT 	1
	FROM 	powerapps.stg_contact_guids 
	WHERE 	guid = contact_email.contact_guid 
);
GO 
DELETE FROM powerapps.contact_address 
WHERE EXISTS (
	SELECT 	1
	FROM 	powerapps.stg_contact_guids 
	WHERE 	guid = contact_address.contact_guid 
);
GO 
DELETE FROM powerapps.account_phone 
WHERE EXISTS (
	SELECT 	1
	FROM 	powerapps.stg_account_guids 
	WHERE 	guid = account_phone.account_guid
);
GO 
DELETE FROM powerapps.account_fax 
WHERE EXISTS (
	SELECT 	1
	FROM 	powerapps.stg_account_guids 
	WHERE 	guid = account_fax.account_guid 
);
GO 
DELETE FROM powerapps.account_email 
WHERE EXISTS (
	SELECT 	1
	FROM 	powerapps.stg_account_guids 
	WHERE 	guid = account_email.account_guid 
);
GO 
DELETE FROM powerapps.account_address 
WHERE EXISTS (
	SELECT 	1
	FROM 	powerapps.stg_account_guids 
	WHERE 	guid = account_address.account_guid 
);
GO 
DELETE FROM powerapps.contact 
WHERE EXISTS (
	SELECT 	1
	FROM 	powerapps.stg_contact_guids 
	WHERE 	guid = contact.guid
);
GO 
DELETE FROM powerapps.account 
WHERE EXISTS (
	SELECT 	1
	FROM 	powerapps.stg_account_guids 
	WHERE 	guid = account.guid 
);
GO 
/*** CLEANUP STAGING TABLES ***/
DROP TABLE IF EXISTS powerapps.stg_account_guids;
GO 
DROP TABLE IF EXISTS powerapps.stg_contact_guids;
GO 
DROP TABLE IF EXISTS powerapps.stg_address_guids;
GO 
DROP TABLE IF EXISTS powerapps.stg_email_guids;
GO 
DROP TABLE IF EXISTS powerapps.stg_fax_guids;
GO 
DROP TABLE IF EXISTS powerapps.stg_phone_guids;
GO 