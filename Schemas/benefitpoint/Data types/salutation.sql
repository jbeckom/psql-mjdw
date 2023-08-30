CREATE TYPE benefitpoint.salutation AS ENUM (
	 'None_Selected'
	,'Mr'
	,'Mrs'
	,'Ms'
	,'Miss'
);
GO 

/*** PERMISSIONS ***/
ALTER TYPE benefitpoint.salutation OWNER TO mj_admin;
GO 
