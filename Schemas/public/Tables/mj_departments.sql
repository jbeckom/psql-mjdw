CREATE TABLE IF NOT EXISTS public.mj_departments (
	 division 			TEXT 		NOT NULL 
	,dept_cd 			TEXT 		NOT NULL 
	,department 		TEXT 		NOT NULL 
	,active 			boolean 	NOT NULL 	DEFAULT FALSE 
	,notes				TEXT 		NULL 
	,modify_dt 			timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,CONSTRAINT departments_pkey PRIMARY KEY (division, dept_cd)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE public.mj_departments OWNER TO mj_admin;
GO 

GRANT SELECT ON public.mj_departments TO rl_public_r;
GO 
