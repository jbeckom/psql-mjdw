CREATE TABLE benefitpoint.carrier_contact_products (
	 carrier_id 	int 	NOT NULL 
	,contact_id 	int 	NOT NULL 
	,product_id 	int 	NOT NULL 
	,CONSTRAINT carrier_contact_products_pkey PRIMARY KEY (carrier_id, contact_id, product_id)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.carrier_contact_products OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.carrier_contact_products TO rl_benefitpoint_r;
GO 

GRANT INSERT ON TABLE benefitpoint.carrier_contact_products TO rl_benefitpoint_a;
GO 

GRANT DELETE ON TABLE benefitpoint.carrier_contact_products TO rl_benefitpoint_d;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER prevent_u BEFORE UPDATE ON benefitpoint.carrier_contact_products FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_prevent_modify();
GO 
