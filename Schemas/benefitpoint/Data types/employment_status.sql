CREATE TYPE benefitpoint.employment_status AS ENUM (
	 'None_Selected'
	,'Unspecified'
	,'Part_Time'
	,'LOA'
	,'LOA___Paid'
	,'LOA___Unpaid'
	,'COBRA'
	,'Retiree'
	,'Early_Retiree'
	,'Full_Time'
);
GO 

/*** PERMISSIONS ***/
ALTER TYPE benefitpoint.employment_status OWNER TO mj_admin;
GO 
