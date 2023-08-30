CREATE OR REPLACE FUNCTION sagitta.tr_audit_br_coverages_additional_coverage_info_u() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_br_coverages_additional_coverage_info (
		 sagitem 
		,lis 
		,old_addl_cov_cd 
		,new_addl_cov_cd 
		,old_first_addl_cov_limit 
		,new_first_addl_cov_limit 
		,old_first_addl_cov_deductible_amt 
		,new_first_addl_cov_deductible_amt 
		,old_first_addl_cov_ded_desc 
		,new_first_addl_cov_ded_desc 
		,old_second_addl_cov_limit 
		,new_second_addl_cov_limit 
		,old_second_addl_cov_deductible_amt 
		,new_second_addl_cov_deductible_amt 
		,old_second_addl_cov_ded_desc 
		,new_second_addl_cov_ded_desc 
		,old_addl_cov_desc 
		,new_addl_cov_desc 
		,old_addl_cov_addl_info 
		,new_addl_cov_addl_info 
		,old_addl_cov_rate 
		,new_addl_cov_rate 
		,old_addl_cov_endorse_form 
		,new_addl_cov_endorse_form 
		,old_addl_cov_endorse_form_date 
		,new_addl_cov_endorse_form_date 
		,old_addl_cov_premium_amt 
		,new_addl_cov_premium_amt 
		,audit_action 
	)
	SELECT 	 OLD.sagitem 
			,OLD.lis 
			,OLD.addl_cov_cd 
			,NEW.addl_cov_cd 
			,OLD.first_addl_cov_limit 
			,NEW.first_addl_cov_limit 
			,OLD.first_addl_cov_deductible_amt 
			,NEW.first_addl_cov_deductible_amt 
			,OLD.first_addl_cov_ded_desc 
			,NEW.first_addl_cov_ded_desc 
			,OLD.second_addl_cov_limit 
			,NEW.second_addl_cov_limit 
			,OLD.second_addl_cov_deductible_amt 
			,NEW.second_addl_cov_deductible_amt 
			,OLD.second_addl_cov_ded_desc 
			,NEW.second_addl_cov_ded_desc 
			,OLD.addl_cov_desc 
			,NEW.addl_cov_desc 
			,OLD.addl_cov_addl_info 
			,NEW.addl_cov_addl_info 
			,OLD.addl_cov_rate 
			,NEW.addl_cov_rate 
			,OLD.addl_cov_endorse_form 
			,NEW.addl_cov_endorse_form 
			,OLD.addl_cov_endorse_form_date 
			,NEW.addl_cov_endorse_form_date 
			,OLD.addl_cov_premium_amt 
			,NEW.addl_cov_premium_amt 
			,'U' ;
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_br_coverages_additional_coverage_info_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_br_coverages_additional_coverage_info_u() TO rl_sagitta_x;
GO 
