CREATE TYPE benefitpoint.employer_market_size AS ENUM (
	 'Not_Selected'
	,'Small'
	,'Middle'
	,'Medium'
	,'Large'
);
GO 

/*** PERMISSIONS ***/
ALTER TYPE benefitpoint.employer_market_size OWNER TO mj_admin;
GO 
