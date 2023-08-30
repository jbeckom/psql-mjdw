UPDATE 	powerapps.account AS pa
SET 	ein = sc.fein
FROM 	sagitta.clients AS sc
WHERE 	pa.account_source = 'SAGITTA'
	AND pa.source_key::int = sc.sagitem
	AND (pa.ein IS NULL OR pa.ein <> sc.fein);
GO 