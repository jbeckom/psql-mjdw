CREATE TYPE benefitpoint.gender AS ENUM (
	 'None_Selected'
	,'Male'
	,'Female'
);
GO 

/*** PERMISSIONS ***/
ALTER TYPE benefitpoint.gender OWNER TO mj_admin;
GO 
