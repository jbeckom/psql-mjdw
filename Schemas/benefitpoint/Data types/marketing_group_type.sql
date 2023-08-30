CREATE TYPE benefitpoint.marketing_group_type AS ENUM (
	 'None_Selected' 
	,'Other' 
	,'Pool' 
	,'JPA' 
	,'JPC' 
	,'Association' 
	,'Coalition' 
	,'Trust' 
);
GO 

/*** PERMISSIONS ***/
ALTER TYPE benefitpoint.marketing_group_type OWNER TO mj_admin;
GO 
