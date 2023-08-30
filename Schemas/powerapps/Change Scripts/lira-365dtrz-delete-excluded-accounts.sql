DROP TABLE IF EXISTS powerapps.stg_account_guids;
DROP TABLE IF EXISTS powerapps.stg_contact_guids;
DROP TABLE IF EXISTS powerapps.stg_address_guids;
DROP TABLE IF EXISTS powerapps.stg_email_guids;
DROP TABLE IF EXISTS powerapps.stg_fax_guids;
DROP TABLE IF EXISTS powerapps.stg_phone_guids;
SELECT DISTINCT a.guid
INTO powerapps.stg_account_guids
FROM 	powerapps.account AS a 
	INNER JOIN sagitta.policies AS p
			ON a.source_key::int = p.client_cd  
WHERE 	a.account_source = 'SAGITTA'
	AND (
		p.division_cd::int != 1
		OR 
		LEFT(p.department_cd,2) IN ('04','24','54')
	);
SELECT 	c.guid 
INTO 	powerapps.stg_contact_guids
FROM 	powerapps.contact 	AS c
WHERE EXISTS (
	SELECT 	1
	FROM 	powerapps.stg_account_guids
	WHERE 	guid = c.parent_account_guid 
);
CREATE TABLE powerapps.stg_address_guids (address_guid uuid);
INSERT INTO powerapps.stg_address_guids
	SELECT 	aa.address_guid 
	FROM 	powerapps.account_address AS aa
	WHERE EXISTS (
		SELECT 	1
		FROM 	powerapps.stg_account_guids 
		WHERE 	guid = aa.account_guid 
	)
	UNION 
	SELECT 	ca.address_guid 
	FROM 	powerapps.contact_address AS ca 
	WHERE EXISTS (
		SELECT 	1
		FROM 	powerapps.stg_contact_guids 
		WHERE 	guid = ca.contact_guid 
	);
CREATE TABLE powerapps.stg_email_guids (email_guid uuid);
INSERT INTO powerapps.stg_email_guids 
	SELECT 	ae.email_guid 
	FROM 	powerapps.account_email AS ae 
	WHERE EXISTS (
		SELECT 	1
		FROM 	powerapps.stg_account_guids 
		WHERE 	guid = ae.account_guid
	)
	UNION 
	SELECT 	ce.email_guid 
	FROM 	powerapps.contact_email AS ce
	WHERE EXISTS (
		SELECT 	1
		FROM 	powerapps.stg_contact_guids 
		WHERE 	guid = ce.contact_guid
	);
CREATE TABLE powerapps.stg_fax_guids (fax_guid uuid);
INSERT INTO powerapps.stg_fax_guids
	SELECT 	af.fax_guid 
	FROM 	powerapps.account_fax AS af
	WHERE EXISTS (
		SELECT 	1
		FROM 	powerapps.stg_account_guids AS sag
		WHERE 	sag.guid = af.account_guid 
	)
	UNION 
	SELECT 	cf.fax_guid 
	FROM 	powerapps.contact_fax AS cf
	WHERE EXISTS (
		SELECT 	1
		FROM 	powerapps.stg_contact_guids AS scg
		WHERE 	scg.guid = cf.contact_guid 
	);
CREATE TABLE powerapps.stg_phone_guids (phone_guid uuid);
INSERT INTO powerapps.stg_phone_guids
	SELECT 	ap.phone_guid 
	FROM 	powerapps.account_phone AS ap
	WHERE EXISTS (
		SELECT 	1
		FROM 	powerapps.stg_account_guids AS sag
		WHERE 	sag.guid = ap.account_guid 
	)
	UNION 
	SELECT 	cp.phone_guid 
	FROM 	powerapps.contact_phone AS cp
	WHERE EXISTS (
		SELECT 	1
		FROM 	powerapps.stg_contact_guids AS scg
		WHERE 	scg.guid = cp.contact_guid 
	);
DELETE FROM powerapps.phone 
WHERE EXISTS (
	SELECT 	1
	FROM 	powerapps.stg_phone_guids AS stg
	WHERE 	stg.phone_guid = phone.guid
);
DELETE FROM powerapps.fax 
WHERE EXISTS (
	SELECT 	1
	FROM 	powerapps.stg_fax_guids AS stg
	WHERE 	stg.fax_guid = fax.guid 
);
DELETE FROM powerapps.email 
WHERE EXISTS (
	SELECT 	1
	FROM 	powerapps.stg_email_guids AS stg 
	WHERE 	stg.email_guid = email.guid
);
DELETE FROM powerapps.address 
WHERE EXISTS (
	SELECT 	1
	FROM 	powerapps.stg_address_guids AS stg
	WHERE 	stg.address_guid = address.guid
);
DELETE FROM powerapps.contact 
WHERE EXISTS (
	SELECT 	1
	FROM 	powerapps.stg_contact_guids AS stg
	WHERE 	stg.guid = contact.guid
);
DELETE FROM powerapps.account 
WHERE EXISTS (
	SELECT 	1
	FROM 	powerapps.stg_account_guids AS stg
	WHERE 	stg.guid = account.guid 
);
DELETE FROM powerapps.account_address
WHERE NOT EXISTS (SELECT 1 FROM powerapps.account AS ac WHERE ac.guid = account_guid)
	OR NOT EXISTS (SELECT 1 FROM powerapps.address AS ad WHERE ad.guid = address_guid);
DELETE FROM powerapps.account_email 
WHERE NOT EXISTS (SELECT 1 FROM powerapps.account AS a WHERE a.guid = account_guid)
	OR NOT EXISTS (SELECT 1 FROM powerapps.email AS e WHERE e.guid = email_guid);
DELETE FROM powerapps.account_fax 
WHERE NOT EXISTS (SELECT 1 FROM powerapps.account AS a WHERE a.guid = account_guid)
	OR NOT EXISTS (SELECT 1 FROM powerapps.fax AS f WHERE f.guid = fax_guid);
DELETE FROM powerapps.account_phone 
WHERE NOT EXISTS (SELECT 1 FROM powerapps.account AS a WHERE a.guid = account_guid)
	OR NOT EXISTS (SELECT 1 FROM powerapps.phone AS p WHERE p.guid = phone_guid);
DELETE FROM powerapps.contact_address 
WHERE NOT EXISTS (SELECT 1 FROM powerapps.contact AS c WHERE c.guid = contact_guid)
	OR NOT EXISTS (SELECT 1 FROM powerapps.address AS a WHERE a.guid = address_guid);
DELETE FROM powerapps.contact_email 
WHERE NOT EXISTS (SELECT 1 FROM powerapps.contact AS c WHERE c.guid = contact_guid)
	OR NOT EXISTS (SELECT 1 FROM powerapps.email AS e WHERE e.guid = email_guid);
DELETE FROM powerapps.contact_fax 
WHERE NOT EXISTS (SELECT 1 FROM powerapps.contact AS c WHERE c.guid = contact_guid)
	OR NOT EXISTS (SELECT 1 FROM powerapps.fax AS f WHERE f.guid = fax_guid);
DELETE FROM powerapps.contact_phone 
WHERE NOT EXISTS (SELECT 1 FROM powerapps.contact AS c WHERE c.guid = contact_guid)
	OR NOT EXISTS (SELECT 1 FROM powerapps.phone AS p WHERE p.guid = phone_guid);
DROP TABLE IF EXISTS powerapps.stg_account_guids;
DROP TABLE IF EXISTS powerapps.stg_contact_guids;
DROP TABLE IF EXISTS powerapps.stg_address_guids;
DROP TABLE IF EXISTS powerapps.stg_email_guids;
DROP TABLE IF EXISTS powerapps.stg_fax_guids;
DROP TABLE IF EXISTS powerapps.stg_phone_guids;