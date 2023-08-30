CREATE TYPE benefitpoint.employment_frequency AS ENUM (
	 'None_Selected'
	,'Unspecified'
	,'per_Week'
	,'per_Month'
	,'per_6_Months'
	,'per_12_Months'
	,'per_Day'
	,'per_Pay_Period'
);
GO 

/*** PERMISSIONS ***/
ALTER TYPE benefitpoint.employment_frequency OWNER TO mj_admin;
GO 
