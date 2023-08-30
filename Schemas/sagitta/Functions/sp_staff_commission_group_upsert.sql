CREATE OR REPLACE FUNCTION sagitta.sp_staff_commission_group_upsert (_sagitem varchar(5), _lis int, _xmldata TEXT)
RETURNS int  
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;

BEGIN 
	rc := 0;

	WITH xmldata AS (SELECT _xmldata::XML AS exemel)
	INSERT INTO sagitta.staff_commission_group (
		 sagitem
		,lis
		,standard_commission
		,"type"
		,insurer_id
		,coverage_cd
		,from_amt
		,to_amt
		,ab_new_comm_percentage
		,ab_renewal_comm_percentage
		,cb_new_comm_percentage
		,cb_renew_comm_percentage
		,start_dt
		,end_dt
		,comm_div
		,comm_dept
	)
	SELECT 	 _sagitem 	AS sagitem 
			,_lis 		AS lis
			,REPLACE(regexp_replace(UNNEST(xpath('/CommissionGroup/StandardCommission/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 		AS standard_commission 
			,REPLACE(regexp_replace(UNNEST(xpath('/CommissionGroup/Type/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 						AS "type" 
			,REPLACE(regexp_replace(UNNEST(xpath('/CommissionGroup/InsurerId/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 				AS insurer_id 
			,REPLACE(regexp_replace(UNNEST(xpath('/CommissionGroup/CoverageCd/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 				AS coverage_cd 
			,REPLACE(regexp_replace(UNNEST(xpath('/CommissionGroup/FromAmt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 					AS from_amt 
			,REPLACE(regexp_replace(UNNEST(xpath('/CommissionGroup/ToAmt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 					AS to_amt 
			,REPLACE(regexp_replace(UNNEST(xpath('/CommissionGroup/ABNewCommPercentage/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 		AS ab_new_comm_percentage 
			,REPLACE(regexp_replace(UNNEST(xpath('/CommissionGroup/ABRenewalCommPercentage/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 	AS ab_renewal_comm_percentage 
			,REPLACE(regexp_replace(UNNEST(xpath('/CommissionGroup/CBNewCommPercentage/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 		AS cb_new_comm_percentage 
			,REPLACE(regexp_replace(UNNEST(xpath('/CommissionGroup/CBRenewCommPercentage/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 	AS cb_renew_comm_percentage 
			,REPLACE(regexp_replace(UNNEST(xpath('/CommissionGroup/StartDt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 					AS start_dt 
			,REPLACE(regexp_replace(UNNEST(xpath('/CommissionGroup/EndDt/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 					AS end_dt 
			,REPLACE(regexp_replace(UNNEST(xpath('/CommissionGroup/CommDiv/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 					AS comm_div 
			,REPLACE(regexp_replace(UNNEST(xpath('/CommissionGroup/CommDept/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 					AS standard_commission 
	FROM 	xmldata
	ON CONFLICT (sagitem, lis) DO UPDATE 
	SET 	 standard_commission            = excluded.standard_commission
			,"type"                         = excluded."type"
			,insurer_id                     = excluded.insurer_id
			,coverage_cd                    = excluded.coverage_cd
			,from_amt                       = excluded.from_amt
			,to_amt                         = excluded.to_amt
			,ab_new_comm_percentage         = excluded.ab_new_comm_percentage
			,ab_renewal_comm_percentage     = excluded.ab_renewal_comm_percentage
			,cb_new_comm_percentage         = excluded.cb_new_comm_percentage
			,cb_renew_comm_percentage       = excluded.cb_renew_comm_percentage
			,start_dt                       = excluded.start_dt
			,end_dt                         = excluded.end_dt
			,comm_div                       = excluded.comm_div
			,comm_dept                      = excluded.comm_dept
			,modify_dt 						= timezone('utc'::TEXT, clock_timestamp())
	WHERE 	(staff_commission_group.standard_commission,staff_commission_group."type",staff_commission_group.insurer_id,staff_commission_group.coverage_cd,staff_commission_group.from_amt,staff_commission_group.to_amt,staff_commission_group.ab_new_comm_percentage,staff_commission_group.ab_renewal_comm_percentage,staff_commission_group.cb_new_comm_percentage,staff_commission_group.cb_renew_comm_percentage,staff_commission_group.start_dt,staff_commission_group.end_dt,staff_commission_group.comm_div,staff_commission_group.comm_dept)
		IS DISTINCT FROM 	(excluded.standard_commission,excluded."type",excluded.insurer_id,excluded.coverage_cd,excluded.from_amt,excluded.to_amt,excluded.ab_new_comm_percentage,excluded.ab_renewal_comm_percentage,excluded.cb_new_comm_percentage,excluded.cb_renew_comm_percentage,excluded.start_dt,excluded.end_dt,excluded.comm_div,excluded.comm_dept);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_staff_commission_group_upsert(varchar, int, TEXT) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_staff_commission_group_upsert(varchar, int, text) TO rl_sagitta_x;
GO 
