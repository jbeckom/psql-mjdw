ALTER TABLE powerapps.prospect 
	 ADD COLUMN IF NOT EXISTS current_eb_client 	bool 	NULL 
	,ADD COLUMN IF NOT EXISTS current_pc_client 	bool 	NULL 
	,ADD COLUMN IF NOT EXISTS eb_producer 			bool 	NULL 
	,ADD COLUMN IF NOT EXISTS pc_producer 			bool 	NULL 
	,ADD COLUMN IF NOT EXISTS bond_producer 		bool 	NULL 
	,ADD COLUMN IF NOT EXISTS former_mj_client 		bool 	NULL;
GO 