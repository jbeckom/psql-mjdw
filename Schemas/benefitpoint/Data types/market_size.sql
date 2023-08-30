CREATE TYPE benefitpoint.market_size AS ENUM (
	 'None_Selected'
	,'Any_Size'
	,'Large_Group'
	,'Small_Group'
);
GO 

/*** PERMISSIONS ***/
ALTER TYPE benefitpoint.market_size OWNER TO mj_admin;
GO 
