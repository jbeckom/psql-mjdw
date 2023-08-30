CREATE TYPE benefitpoint.account_funding_type AS ENUM ('None_Selected', 'Private', 'Public');
GO 

/*** PERMISSIONS ***/
ALTER TYPE benefitpoint.account_funding_type OWNER TO mj_admin;
GO 
