CREATE TYPE benefitpoint.measurement_period AS ENUM ('None_Selected', '6_Months', '12_Months', 'Other');
GO 

/*** PERMISSIONS ***/
ALTER TYPE benefitpoint.measurement_period OWNER TO mj_admin;
GO 
