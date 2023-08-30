CREATE TYPE benefitpoint.account_type AS ENUM ('None_Selected', 'Client', 'Prospect', 'Other', 'Informational', 'Marketing_Group');
GO 

/*** PERMISSIONS ***/
ALTER TYPE benefitpoint.account_type OWNER TO mj_admin;
GO 
