ALTER TABLE powerapps.account_tags 
	DROP CONSTRAINT IF EXISTS tag_detail_fkey;
GO 

ALTER TABLE powerapps.contact_tag
	DROP CONSTRAINT IF EXISTS tag_detail_fkey;
GO 

TRUNCATE TABLE powerapps.tag_detail;
GO 

INSERT INTO powerapps.tag_detail(guid,tag_name,tag_type,tag_owner)
VALUES 	 ('052e803c-949c-eb11-b1ac-000d3a8f7672'::uuid,'ACCOUNTING','Contact','MJ PowerApps')
		,('e92d803c-949c-eb11-b1ac-000d3a8f7672'::uuid,'APPS','Contact','MJ PowerApps')
		,('ef2d803c-949c-eb11-b1ac-000d3a8f7672'::uuid,'AUDIT DELIVERY','Contact','MJ PowerApps')
		,('f32d803c-949c-eb11-b1ac-000d3a8f7672'::uuid,'AUTO ID CARD DELIVERY','Contact','MJ PowerApps')
		,('9235bddb-2543-ed11-bba1-0022482b2e36'::uuid,'BONDS DECISION MAKER','Contact','MJ PowerApps')
		,('f12d803c-949c-eb11-b1ac-000d3a8f7672'::uuid,'CERTIFICATE DELIVERY','Contact','MJ PowerApps')
		,('5b0db2e5-bb9e-eb11-b1ac-0022482210fb'::uuid,'CLAIM KIT DELIVERY','Contact','MJ PowerApps')
		,('a31823b7-2543-ed11-bba1-0022482b2e36'::uuid,'COMPENSATION DISCLOSURE','Contact','MJ PowerApps')
		,('37af4598-2543-ed11-bba1-0022482b2e36'::uuid,'COMPLIANCE','Contact','MJ PowerApps')
		,('468cee8b-2543-ed11-bba1-0022482b2e36'::uuid,'CONTRACT REVIEW','Contact','MJ PowerApps')
		,('3a0db2e5-bb9e-eb11-b1ac-0022482210fb'::uuid,'DAY TO DAY','Contact','MJ PowerApps')
		,('c821c0d5-2543-ed11-bba1-0022482b2e36'::uuid,'EB DECISION MAKER','Contact','MJ PowerApps')
		,('4d0db2e5-bb9e-eb11-b1ac-0022482210fb'::uuid,'ENDORSEMENT DELIVERY','Contact','MJ PowerApps')
		,('400db2e5-bb9e-eb11-b1ac-0022482210fb'::uuid,'EXECUTIVE','Contact','MJ PowerApps')
		,('420db2e5-bb9e-eb11-b1ac-0022482210fb'::uuid,'EXPOSURE SCHEDULES','Contact','MJ PowerApps')
		,('630db2e5-bb9e-eb11-b1ac-0022482210fb'::uuid,'HUMAN RESOURCES','Contact','MJ PowerApps')
		,('610db2e5-bb9e-eb11-b1ac-0022482210fb'::uuid,'LEGAL','Contact','MJ PowerApps')
		,('5d0db2e5-bb9e-eb11-b1ac-0022482210fb'::uuid,'LOSS NOTICES','Contact','MJ PowerApps')
		,('3e0db2e5-bb9e-eb11-b1ac-0022482210fb'::uuid,'OWNER','Contact','MJ PowerApps')
		,('e6ec55c9-2543-ed11-bba1-0022482b2e36'::uuid,'P&C DECISION MAKER','Contact','MJ PowerApps')
		,('490db2e5-bb9e-eb11-b1ac-0022482210fb'::uuid,'POLICY DELIVERY','Contact','MJ PowerApps')
		,('650db2e5-bb9e-eb11-b1ac-0022482210fb'::uuid,'PRIMARY CLAIMS CONTACT','Contact','MJ PowerApps')
		,('6c0db2e5-bb9e-eb11-b1ac-0022482210fb'::uuid,'SAFETY','Contact','MJ PowerApps')
		,('322948c3-2543-ed11-bba1-0022482b2e36'::uuid,'SERVICE FEE AGREEMENT','Contact','MJ PowerApps')
		,('d21faba4-2543-ed11-bba1-0022482b2e36'::uuid,'SPD DELIVERY','Contact','MJ PowerApps')
		,('b44021b1-2543-ed11-bba1-0022482b2e36'::uuid,'STOP LOSS APPLICATION','Contact','MJ PowerApps');
GO 