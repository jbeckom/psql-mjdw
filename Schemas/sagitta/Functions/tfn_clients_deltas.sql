CREATE OR REPLACE FUNCTION 	sagitta.tfn_clients_deltas (mod_dt timestamp)
RETURNS TABLE (client_key int)
LANGUAGE plpgsql 
AS $$

BEGIN 
	RETURN 	query 
	SELECT 	c.sagitem 	AS client_key
	FROM 	sagitta.clients 	AS c
	WHERE 	((c.cat_1_cd IS NULL) OR (c.cat_1_cd <> ALL ('{PER,PRO}'::text[])))
		AND ((c.cat_2_cd IS NULL) OR (c.cat_2_cd <> ALL ('{PER,PRO}'::text[])))
		AND ((c.cat_3_cd IS NULL) OR (c.cat_3_cd <> ALL ('{PER,PRO}'::text[])))
		AND ((c.cat_4_cd IS NULL) OR (c.cat_4_cd <> ALL ('{PER,PRO}'::text[])))
		AND ((c.cat_5_cd IS NULL) OR (c.cat_5_cd <> ALL ('{PER,PRO}'::text[])))
		AND c.client_name <> 'DO NOT USE'
		AND c.modify_dt >= mod_dt
	ORDER BY c.audit_entry_dt, c.audit_time;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tfn_clients_deltas (timestamp) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tfn_clients_deltas (timestamp) TO rl_sagitta_x;
GO 