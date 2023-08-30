ALTER TABLE benefitpoint.account
	 ALTER COLUMN inactive_reason SET DATA TYPE TEXT USING inactive_reason::TEXT
	,ALTER COLUMN account_classification SET DATA TYPE TEXT USING account_classification::TEXT 
	,ALTER COLUMN account_type SET DATA TYPE TEXT USING account_type::TEXT;
GO 
	
DROP TYPE benefitpoint."inactive_reason";
GO 

DROP TYPE benefitpoint."account_classification_type";
GO 

DROP TYPE benefitpoint."account_type";
GO 