CREATE TYPE benefitpoint.marital_status AS ENUM (
	'None_Selected'
	,'Divorced'
	,'Domestic_Partner'
	,'Married'
	,'Single'
	,'Widowed'
);
GO 

/*** PERMISSIONS ***/
ALTER TYPE benefitpoint.marital_status OWNER TO mj_admin;
GO 
