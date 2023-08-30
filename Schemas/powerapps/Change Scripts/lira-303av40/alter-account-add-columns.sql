ALTER TABLE powerapps.account 
	 ADD COLUMN IF NOT EXISTS current_eb_client 	bool 	NULL 	DEFAULT FALSE 
	,ADD COLUMN IF NOT EXISTS current_pc_client 	bool 	NULL 	DEFAULT FALSE 
	,ADD COLUMN IF NOT EXISTS eb_producer 			TEXT 	NULL 
	,ADD COLUMN IF NOT EXISTS pc_producer 			TEXT 	NULL 
	,ADD COLUMN IF NOT EXISTS bond_producer 		TEXT 	NULL 
	,ADD COLUMN IF NOT EXISTS former_mj_client 		bool 	NULL 	DEFAULT FALSE;
GO 