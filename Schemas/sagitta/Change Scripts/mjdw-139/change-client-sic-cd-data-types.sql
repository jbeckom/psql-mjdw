ALTER TABLE sagitta.clients 
	 ALTER COLUMN sic_1_cd SET DATA TYPE TEXT USING sic_1_cd::TEXT 
	,ALTER COLUMN sic_2_cd SET DATA TYPE TEXT USING sic_2_cd::TEXT 
	,ALTER COLUMN sic_3_cd SET DATA TYPE TEXT USING sic_3_cd::TEXT;
GO 