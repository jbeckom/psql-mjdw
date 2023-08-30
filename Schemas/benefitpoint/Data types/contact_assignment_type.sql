CREATE TYPE benefitpoint.contact_assignment_type AS ENUM (
	 'None_Selected' 
	,'Eligibility_Contact' 
	,'Billing_Contact' 
	,'Claims_Contact' 
	,'Renewal_Contact' 
	,'New_Business_Contact' 
	,'Broker_of_Record' 
	,'Sales_Contact' 
	,'Service_Contact' 
	,'Commissions_Contact' 
);
GO 

/*** PERMISSIONS ***/
ALTER TYPE benefitpoint.contact_assignment_type OWNER TO mj_admin;
GO 
