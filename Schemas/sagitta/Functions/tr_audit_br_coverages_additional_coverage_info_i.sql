CREATE OR REPLACE FUNCTION sagitta.tr_audit_br_coverages_additional_coverage_info_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_br_coverages_additional_coverage_info (
		 sagitem 
		,lis 
		,new_addl_cov_cd 
		,new_first_addl_cov_limit 
		,new_first_addl_cov_deductible_amt 
		,new_first_addl_cov_ded_desc 
		,new_second_addl_cov_limit 
		,new_second_addl_cov_deductible_amt 
		,new_second_addl_cov_ded_desc 
		,new_addl_cov_desc 
		,new_addl_cov_addl_info 
		,new_addl_cov_rate 
		,new_addl_cov_endorse_form 
		,new_addl_cov_endorse_form_date 
		,new_addl_cov_premium_amt 
		,audit_action 
	)
	SELECT 	 NEW.sagitem 
			,NEW.lis 
			,NEW.addl_cov_cd 
			,NEW.first_addl_cov_limit 
			,NEW.first_addl_cov_deductible_amt 
			,NEW.first_addl_cov_ded_desc 
			,NEW.second_addl_cov_limit 
			,NEW.second_addl_cov_deductible_amt 
			,NEW.second_addl_cov_ded_desc 
			,NEW.addl_cov_desc 
			,NEW.addl_cov_addl_info 
			,NEW.addl_cov_rate 
			,NEW.addl_cov_endorse_form 
			,NEW.addl_cov_endorse_form_date 
			,NEW.addl_cov_premium_amt 
			,'I' ;
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_br_coverages_additional_coverage_info_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_br_coverages_additional_coverage_info_i() TO rl_sagitta_x;
GO 
