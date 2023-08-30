CREATE OR REPLACE FUNCTION sagitta.tr_audit_staff_commission_group_d ()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$

BEGIN 
	INSERT INTO sagitta.audit_staff_commission_group (
		 sagitem
		,lis
		,old_standard_commission
		,old_type
		,old_insurer_id
		,old_coverage_cd
		,old_from_amt
		,old_to_amt
		,old_ab_new_comm_percentage
		,old_ab_renewal_comm_percentage
		,old_cb_new_comm_percentage
		,old_cb_renew_comm_percentage
		,old_start_dt
		,old_end_dt
		,old_comm_div
		,old_comm_dept
		,audit_action
	)
	SELECT 	 OLD.sagitem
			,OLD.lis
			,OLD.standard_commission
			,OLD."type"
			,OLD.insurer_id
			,OLD.coverage_cd
			,OLD.from_amt
			,OLD.to_amt
			,OLD.ab_new_comm_percentage
			,OLD.ab_renewal_comm_percentage
			,OLD.cb_new_comm_percentage
			,OLD.cb_renew_comm_percentage
			,OLD.start_dt
			,OLD.end_dt
			,OLD.comm_div
			,OLD.comm_dept
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_staff_commission_group_d () OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_staff_commission_group_d() TO rl_sagitta_x;
GO 