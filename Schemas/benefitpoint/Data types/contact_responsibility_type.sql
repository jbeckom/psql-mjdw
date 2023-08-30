CREATE TYPE benefitpoint.contact_responsibility_type AS ENUM (
	 'None_Selected' 
	,'Administrative' 
	,'Ben_Admin	Benefits' 
	,'Benefits_Client_Surveys' 
	,'Benefits_Decision_Maker' 
	,'Benefits_Educational_Seminars' 
	,'Benefits_Financial_Officer' 
	,'Benefits_Human_Resources' 
	,'Billing' 
	,'CEO' 
	,'CFO' 
	,'Claims' 
	,'Consultant' 
	,'Corporate_Officer' 
	,'Eligibility' 
	,'Employee_Benefits' 
	,'Employee_Communications' 
	,'Executive_Sponsor' 
	,'Finance_Management' 
	,'General_Management' 
	,'Human_Resources_Management' 
	,'Insured' 
	,'Open_Enrollment' 
	,'Partner' 
	,'Pension' 
	,'Plan_Design' 
	,'Procurement' 
	,'Voluntary' 
	,'VP_Benefits' 
	,'VP_Finance' 
	,'VP_Human_Resources' 
	,'Other' 
);
GO 

/*** PERMISSIONS ***/
ALTER TYPE benefitpoint.contact_responsibility_type OWNER TO mj_admin;
GO
