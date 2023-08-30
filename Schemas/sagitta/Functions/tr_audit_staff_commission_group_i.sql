CREATE OR REPLACE FUNCTION sagitta.tr_audit_staff_commission_group_i ()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$

BEGIN 
	INSERT INTO sagitta.audit_staff_commission_group (
		 sagitem
		,lis
		,new_standard_commission
		,new_type
		,new_insurer_id
		,new_coverage_cd
		,new_from_amt
		,new_to_amt
		,new_ab_new_comm_percentage
		,new_ab_renewal_comm_percentage
		,new_cb_new_comm_percentage
		,new_cb_renew_comm_percentage
		,new_start_dt
		,new_end_dt
		,new_comm_div
		,new_comm_dept
		,audit_action
	)
	SELECT 	 NEW.sagitem
			,NEW.lis
			,NEW.standard_commission
			,NEW."type"
			,NEW.insurer_id
			,NEW.coverage_cd
			,NEW.from_amt
			,NEW.to_amt
			,NEW.ab_new_comm_percentage
			,NEW.ab_renewal_comm_percentage
			,NEW.cb_new_comm_percentage
			,NEW.cb_renew_comm_percentage
			,NEW.start_dt
			,NEW.end_dt
			,NEW.comm_div
			,NEW.comm_dept
			,'I';
	RETURN NEW;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_staff_commission_group_i () OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_staff_commission_group_i() TO rl_sagitta_x;
GO