CREATE TYPE benefitpoint.account_classification_type AS ENUM ('None_Selected', 'Agency', 'Agent', 'Group', 'Individual', 'Marketing_Group');
GO 

/*** PERMISSIONS ***/
ALTER TYPE benefitpoint.account_classification_type OWNER TO mj_admin;
GO 
