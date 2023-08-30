CREATE TABLE IF NOT EXISTS benefitpoint.audit_custom_section (
	 old_customization_area 				TEXT 		NULL 
	,new_customization_area 				TEXT 		NULL 
    ,"label"						    	TEXT 		NOT NULL 
	,old_sort_order 						int 		NULL 
    ,new_sort_order 						int 		NULL 
	,old_active 							bool 		NULL 
    ,new_active 							bool 		NULL  
	,audit_action                           char(1) 	NOT NULL 
	,audit_user 							TEXT 		NOT NULL 	DEFAULT current_user
	,audit_timestamp 						timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 								bigint 		NOT NULL 	GENERATED BY DEFAULT AS IDENTITY 	PRIMARY KEY
);
GO 

/*** PERMISSSIONS ***/
ALTER TABLE benefitpoint.audit_custom_section OWNER TO mj_admin;
GO 

GRANT INSERT ON benefitpoint.audit_custom_section TO rl_benefitpoint_a;
GO 