CREATE TYPE benefitpoint.customization_area AS ENUM (
	 'None_Selected'
	,'Account_Summary'
	,'Activity_Log'
	,'Carrier_Contact'
	,'Home_Page_Tabs'
	,'Service_Info'
	,'Plan_Info'
	,'Account_Contact'
);
GO 

/*** PERMISSIONS ***/
ALTER TYPE benefitpoint.customization_area OWNER TO mj_admin;
GO 
