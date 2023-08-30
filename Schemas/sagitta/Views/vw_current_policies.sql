CREATE OR REPLACE VIEW sagitta.vw_current_policies 
AS 
SELECT 	*
FROM 	sagitta.policies 
WHERE 	insurer_name <> '610'::TEXT
	AND policy_number !~~* 'app%'::TEXT 
	AND policy_number !~~* '%reserve%' 
	AND policy_number !~~* '%charge%' 
	AND coverage_cd <> 211
	AND division_cd = '1'::TEXT 
	AND ("left"(department_cd, 2) = ANY ('{01,03,07,09,21,05,25,080,510,04,24}'::text[]))
	AND ((NULLIF(canc_nonrenew_renew_ind, 'I'::text) IS NULL) OR ((canc_nonrenew_renew_ind = ANY ('{C,N}'::text[])) AND (('1967-12-31'::date + ('1 day'::interval * ((canc_nonrenew_renew_dt)::integer)::double precision)) > CURRENT_DATE)));
GO 

/*** PERMISSIONS ***/
ALTER VIEW sagitta.vw_current_policies OWNER TO mj_admin;
GO 

GRANT SELECT ON sagitta.vw_current_policies TO rl_sagitta_r;
GO 