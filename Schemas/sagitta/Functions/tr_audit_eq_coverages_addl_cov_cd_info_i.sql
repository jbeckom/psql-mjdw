CREATE OR REPLACE FUNCTION sagitta.tr_audit_eq_coverages_addl_cov_cd_info_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_eq_coverages_addl_cov_cd_info (
		 sagitem 
		,lis 
		,new_addl_cov_cd 
		,new_addl_cov_item_number 
		,new_addl_cov_limit 
		,new_addl_cov_ded_amt 
		,new_addl_cov_ded_pct 
		,new_addl_cov_rate 
		,new_addl_cov_endt_form_number 
		,new_addl_cov_edition_dt 
		,new_addl_cov_premium 
		,new_addl_cov_des 
		,new_addl_cov_estimated_ann_rental_expense 
		,new_item_limit_basis 
		,new_item_limit_valuation_type 
		,new_item_deductible_type 
		,new_item_deductible_basis 
		,audit_action 
	)
	SELECT 	 NEW.sagitem 
			,NEW.lis 
			,NEW.addl_cov_cd 
			,NEW.addl_cov_item_number 
			,NEW.addl_cov_limit 
			,NEW.addl_cov_ded_amt 
			,NEW.addl_cov_ded_pct 
			,NEW.addl_cov_rate 
			,NEW.addl_cov_endt_form_number 
			,NEW.addl_cov_edition_dt 
			,NEW.addl_cov_premium 
			,NEW.addl_cov_des 
			,NEW.addl_cov_estimated_ann_rental_expense 
			,NEW.item_limit_basis 
			,NEW.item_limit_valuation_type 
			,NEW.item_deductible_type 
			,NEW.item_deductible_basis 
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_eq_coverages_addl_cov_cd_info_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_eq_coverages_addl_cov_cd_info_i() TO rl_sagitta_x;
GO 