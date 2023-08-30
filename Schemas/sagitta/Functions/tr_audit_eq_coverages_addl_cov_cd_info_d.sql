CREATE OR REPLACE FUNCTION sagitta.tr_audit_eq_coverages_addl_cov_cd_info_d() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_eq_coverages_addl_cov_cd_info (
		 sagitem 
		,lis 
		,old_addl_cov_cd 
		,old_addl_cov_item_number 
		,old_addl_cov_limit 
		,old_addl_cov_ded_amt 
		,old_addl_cov_ded_pct 
		,old_addl_cov_rate 
		,old_addl_cov_endt_form_number 
		,old_addl_cov_edition_dt 
		,old_addl_cov_premium 
		,old_addl_cov_des 
		,old_addl_cov_estimated_ann_rental_expense 
		,old_item_limit_basis 
		,old_item_limit_valuation_type 
		,old_item_deductible_type 
		,old_item_deductible_basis 
		,audit_action 
	)
	SELECT 	 OLD.sagitem 
			,OLD.lis 
			,OLD.addl_cov_cd 
			,OLD.addl_cov_item_number 
			,OLD.addl_cov_limit 
			,OLD.addl_cov_ded_amt 
			,OLD.addl_cov_ded_pct 
			,OLD.addl_cov_rate 
			,OLD.addl_cov_endt_form_number 
			,OLD.addl_cov_edition_dt 
			,OLD.addl_cov_premium 
			,OLD.addl_cov_des 
			,OLD.addl_cov_estimated_ann_rental_expense 
			,OLD.item_limit_basis 
			,OLD.item_limit_valuation_type 
			,OLD.item_deductible_type 
			,OLD.item_deductible_basis 
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_eq_coverages_addl_cov_cd_info_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_eq_coverages_addl_cov_cd_info_d() TO rl_sagitta_x;
GO 