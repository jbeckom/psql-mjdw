CREATE TYPE benefitpoint.employment_unit_of_measure AS ENUM (
	 'None_Selected'
	,'Unspecified'
	,'Hours'
	,'Days'
	,'Percent'
	,'Years'
);
GO 

/*** PERMISSIONS ***/
ALTER TYPE benefitpoint.employment_unit_of_measure OWNER TO mj_admin;
GO 
