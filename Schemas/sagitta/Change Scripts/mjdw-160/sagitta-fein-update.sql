UPDATE 	sagitta.clients AS c
SET 	fein = stg.fein 
FROM 	sagitta.stg_fein_update AS stg
WHERE 	c.sagitem = stg.sagitem
	AND (c.fein IS NULL OR c.fein <> stg.fein);
GO 