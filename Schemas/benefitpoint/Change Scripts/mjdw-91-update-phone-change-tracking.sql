ALTER TABLE benefitpoint.phone 
	 DROP CONSTRAINT phone_pkey;
GO 
	
DROP FUNCTION IF EXISTS benefitpoint.sp_phone_upsert (TEXT, TEXT, int, text);
GO 

DROP TRIGGER audit_u ON benefitpoint.phone;
GO 

DROP FUNCTION benefitpoint.tr_audit_phone_u();
GO 

CREATE TRIGGER prevent_u BEFORE UPDATE ON benefitpoint.phone FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_prevent_modify();
GO 

REVOKE UPDATE ON TABLE benefitpoint.phone FROM rl_benefitpoint_w;
GO 

GRANT DELETE ON TABLE benefitpoint.phone TO rl_benefitpoint_d;
GO 