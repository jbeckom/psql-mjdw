CREATE TYPE benefitpoint.business_type AS ENUM (
	 'None_Selected'
	,'C_Corporation'
	,'S_Corporation'
	,'Government'
	,'Public_or_Nonprofit'
	,'Partnership'
	,'Association'
	,'Higher_Education'
	,'House_Account'
	,'Individual'
	,'LLC'
	,'LLP'
	,'Labor_Management_Trust'
	,'Non_electing_Church_Group'
	,'Professional_Service_Corporation'
	,'Proprietorship'
	,'Other'
);
GO 

/*** PERMISSIONS ***/
ALTER TYPE benefitpoint.business_type OWNER TO mj_admin;
GO 
