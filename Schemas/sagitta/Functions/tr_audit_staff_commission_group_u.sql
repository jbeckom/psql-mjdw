CREATE OR REPLACE FUNCTION sagitta.tr_audit_staff_commission_group_u ()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$

BEGIN 
	INSERT INTO sagitta.audit_staff_commission_group (
		 sagitem
		,lis
		,old_standard_commission
		,new_standard_commission
		,old_type
		,new_type
		,old_insurer_id
		,new_insurer_id
		,old_coverage_cd
		,new_coverage_cd
		,old_from_amt
		,new_from_amt
		,old_to_amt
		,new_to_amt
		,old_ab_new_comm_percentage
		,new_ab_new_comm_percentage
		,old_ab_renewal_comm_percentage
		,new_ab_renewal_comm_percentage
		,old_cb_new_comm_percentage
		,new_cb_new_comm_percentage
		,old_cb_renew_comm_percentage
		,new_cb_renew_comm_percentage
		,old_start_dt
		,new_start_dt
		,old_end_dt
		,new_end_dt
		,old_comm_div
		,new_comm_div
		,old_comm_dept
		,new_comm_dept
		,audit_action
	)
	SELECT 	 OLD.sagitem
			,OLD.lis
			,OLD.standard_commission
			,NEW.standard_commission
			,OLD.type
			,NEW.type
			,OLD.insurer_id
			,NEW.insurer_id
			,OLD.coverage_cd
			,NEW.coverage_cd
			,OLD.from_amt
			,NEW.from_amt
			,OLD.to_amt
			,NEW.to_amt
			,OLD.ab_new_comm_percentage
			,NEW.ab_new_comm_percentage
			,OLD.ab_renewal_comm_percentage
			,NEW.ab_renewal_comm_percentage
			,OLD.cb_new_comm_percentage
			,NEW.cb_new_comm_percentage
			,OLD.cb_renew_comm_percentage
			,NEW.cb_renew_comm_percentage
			,OLD.start_dt
			,NEW.start_dt
			,OLD.end_dt
			,NEW.end_dt
			,OLD.comm_div
			,NEW.comm_div
			,OLD.comm_dept
			,NEW.comm_dept
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_staff_commission_group_u () OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_staff_commission_group_u() TO rl_sagitta_x;
GO 
