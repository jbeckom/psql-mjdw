CREATE TYPE benefitpoint.optional_boolean AS ENUM ('None_Selected', 'False', 'True');
GO 

/*** PERMISSIONS ***/
ALTER TYPE benefitpoint.optional_boolean OWNER TO mj_admin;
GO 