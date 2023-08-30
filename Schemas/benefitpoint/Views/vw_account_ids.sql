CREATE VIEW benefitpoint.vw_account_ids
AS 
SELECT 	account_id 
FROM 	benefitpoint.account;
GO 

/*** PERMISSIONS ***/
ALTER VIEW benefitpoint.vw_account_ids OWNER TO mj_admin;
GO 

GRANT SELECT ON benefitpoint.vw_account_ids TO rl_benefitpoint_r;
GO 
