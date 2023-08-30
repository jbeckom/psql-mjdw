CREATE OR REPLACE FUNCTION sagitta.sp_eq_coverages_addl_cov_cd_info_upsert ()
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.eq_coverages_addl_cov_cd_info (
		 sagitem 
		,lis 
		,addl_cov_cd 
		,addl_cov_item_number 
		,addl_cov_limit 
		,addl_cov_ded_amt 
		,addl_cov_ded_pct 
		,addl_cov_rate 
		,addl_cov_endt_form_number 
		,addl_cov_edition_dt 
		,addl_cov_premium 
		,addl_cov_des 
		,addl_cov_estimated_ann_rental_expense 
		,item_limit_basis 
		,item_limit_valuation_type 
		,item_deductible_type 
		,item_deductible_basis 
	)
	SELECT 	 sagitem 
			,lis 
			,addl_cov_cd 
			,addl_cov_item_number 
			,addl_cov_limit 
			,addl_cov_ded_amt 
			,addl_cov_ded_pct 
			,addl_cov_rate 
			,addl_cov_endt_form_number 
			,addl_cov_edition_dt 
			,addl_cov_premium 
			,addl_cov_des 
			,addl_cov_estimated_ann_rental_expense 
			,item_limit_basis 
			,item_limit_valuation_type 
			,item_deductible_type 
			,item_deductible_basis 
	FROM 	sagitta.stg_eq_coverages_addl_cov_cd_info 
	ON CONFLICT (sagitem,lis) DO UPDATE 
	SET 	 addl_cov_cd 							= excluded.addl_cov_cd 
			,addl_cov_item_number 					= excluded.addl_cov_item_number 
			,addl_cov_limit 						= excluded.addl_cov_limit 
			,addl_cov_ded_amt 						= excluded.addl_cov_ded_amt 
			,addl_cov_ded_pct 						= excluded.addl_cov_ded_pct 
			,addl_cov_rate 							= excluded.addl_cov_rate 
			,addl_cov_endt_form_number 				= excluded.addl_cov_endt_form_number 
			,addl_cov_edition_dt 					= excluded.addl_cov_edition_dt 
			,addl_cov_premium 						= excluded.addl_cov_premium 
			,addl_cov_des 							= excluded.addl_cov_des 
			,addl_cov_estimated_ann_rental_expense 	= excluded.addl_cov_estimated_ann_rental_expense 
			,item_limit_basis 						= excluded.item_limit_basis 
			,item_limit_valuation_type 				= excluded.item_limit_valuation_type 
			,item_deductible_type 					= excluded.item_deductible_type 
			,item_deductible_basis 					= excluded.item_deductible_basis 
	WHERE 	(eq_coverages_addl_cov_cd_info.addl_cov_cd,eq_coverages_addl_cov_cd_info.addl_cov_item_number,eq_coverages_addl_cov_cd_info.addl_cov_limit,eq_coverages_addl_cov_cd_info.addl_cov_ded_amt,eq_coverages_addl_cov_cd_info.addl_cov_ded_pct,eq_coverages_addl_cov_cd_info.addl_cov_rate,eq_coverages_addl_cov_cd_info.addl_cov_endt_form_number,eq_coverages_addl_cov_cd_info.addl_cov_edition_dt,eq_coverages_addl_cov_cd_info.addl_cov_premium,eq_coverages_addl_cov_cd_info.addl_cov_des,eq_coverages_addl_cov_cd_info.addl_cov_estimated_ann_rental_expense,eq_coverages_addl_cov_cd_info.item_limit_basis,eq_coverages_addl_cov_cd_info.item_limit_valuation_type,eq_coverages_addl_cov_cd_info.item_deductible_type,eq_coverages_addl_cov_cd_info.item_deductible_basis) 
		IS DISTINCT FROM 	(excluded.addl_cov_cd,excluded.addl_cov_item_number,excluded.addl_cov_limit,excluded.addl_cov_ded_amt,excluded.addl_cov_ded_pct,excluded.addl_cov_rate,excluded.addl_cov_endt_form_number,excluded.addl_cov_edition_dt,excluded.addl_cov_premium,excluded.addl_cov_des,excluded.addl_cov_estimated_ann_rental_expense,excluded.item_limit_basis,excluded.item_limit_valuation_type,excluded.item_deductible_type,excluded.item_deductible_basis); 
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_eq_coverages_addl_cov_cd_info_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_eq_coverages_addl_cov_cd_info_upsert() TO rl_sagitta_x;
GO 
