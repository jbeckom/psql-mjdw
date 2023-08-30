CREATE OR REPLACE FUNCTION sagitta.tfn_contacts_deltas(mod_dt timestamp)
RETURNS TABLE (contact_key int)
LANGUAGE plpgsql 
AS $$

BEGIN 
	RETURN 	query 
	SELECT 	co.sagitem 	AS contact_key
	FROM 	sagitta.contacts 	AS co
	WHERE 	co.modify_dt >= mod_dt
		AND EXISTS (
			SELECT 	1
			FROM 	sagitta.clients 	AS cl
			WHERE 	cl.sagitem = co.client_id
				AND ((cl.cat_2_cd IS NULL) OR (cl.cat_2_cd <> ALL ('{PER,PRO}'::text[])))
				AND ((cl.cat_3_cd IS NULL) OR (cl.cat_3_cd <> ALL ('{PER,PRO}'::text[])))
				AND ((cl.cat_4_cd IS NULL) OR (cl.cat_4_cd <> ALL ('{PER,PRO}'::text[])))
				AND ((cl.cat_5_cd IS NULL) OR (cl.cat_5_cd <> ALL ('{PER,PRO}'::text[])))
				AND cl.client_name <> 'DO NOT USE'
		)
	ORDER BY co.audit_entry_dt, co.audit_time;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tfn_contacts_deltas(timestamp) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tfn_contacts_deltas TO rl_sagitta_x;
GO 