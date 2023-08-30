CREATE TYPE benefitpoint.phone_type AS ENUM (
	 'None_Selected'
	,'Work'
	,'Mobile'
	,'Fax'
	,'Main'
	,'Assistant'
	,'Other'
	,'Home'
	,'Customer_Service'
	,'Pager'
);
GO 

/*** PERMISSIONS ***/
ALTER TYPE benefitpoint.phone_type OWNER TO mj_admin;
GO 
