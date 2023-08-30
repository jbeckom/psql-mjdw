CREATE TYPE benefitpoint.inactive_reason AS ENUM (
	 'None_Selected'
	,'Combined_with_PandC'
	,'Competitor_Program'
	,'Duplicate_Account'
	,'Financial'
	,'Rates'
	,'Service'
	,'Lost_Broker_of_Record'
	,'Job_Completed'
	,'Key_Decision_Maker_Change'
	,'Account_No_Longer_Meets_Eligibility'
	,'Account_Out_of_Business'
	,'Merger_or_Acquisition'
	,'Other'
	,'Group_moved_to_Exchange'
);
GO 

/*** PERMISSIONS ***/
ALTER TYPE benefitpoint.inactive_reason OWNER TO mj_admin;
GO 
