CREATE OR REPLACE FUNCTION benefitpoint.sp_marketing_group_account_associated_accounts_insert (_marketing_group_account_id int, _associated_account_id int) 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;
	
BEGIN 
	rc := 0;

	INSERT INTO benefitpoint.marketing_group_account_associated_accounts (marketing_group_account_id,associated_account_id) 
	VALUES (_marketing_group_account_id, _associated_account_id);

	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_marketing_group_account_associated_accounts_insert(int, int) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_marketing_group_account_associated_accounts_insert(int, int) TO rl_benefitpoint_x;
GO 
