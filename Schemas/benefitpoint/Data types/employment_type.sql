CREATE TYPE benefitpoint.employment_type AS ENUM ('None_Selected', 'Unspecified', 'Regular', 'Temporary', 'Seasonal', 'On_call', 'Permanent', 'Contract');
GO 

/*** PERMISSIONS ***/
ALTER TYPE benefitpoint.employment_type OWNER TO mj_admin;
GO 
