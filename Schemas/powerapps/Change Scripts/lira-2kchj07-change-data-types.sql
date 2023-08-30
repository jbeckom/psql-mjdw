ALTER TABLE powerapps.suspect 
	 ALTER COLUMN broker_share SET DATA TYPE double PRECISION USING REPLACE(broker_share, '%', '')::double PRECISION 
	,ALTER COLUMN broker_revenue_pct SET DATA TYPE double PRECISION USING replace(broker_revenue_pct, '%', '')::double PRECISION 
	,ALTER COLUMN broker_commission_pct SET DATA TYPE double PRECISION USING replace(broker_commission_pct, '%', '')::double PRECISION 
	,ALTER COLUMN broker_fees_pct SET DATA TYPE double PRECISION USING replace(broker_fees_pct, '%', '')::double PRECISION;
GO 