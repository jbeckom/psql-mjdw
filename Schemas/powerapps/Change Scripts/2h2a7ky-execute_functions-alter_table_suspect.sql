SELECT powerapps.sp_suspect_miedge_eb_upsert();
GO 

SELECT powerapps.sp_suspect_miedge_pc_upsert();
GO 

ALTER TABLE powerapps.suspect 
	 ALTER COLUMN benefits_renewal 				SET DATA TYPE date 				USING benefits_renewal::date 
	,ALTER COLUMN broker_revenue 				SET DATA TYPE int 				USING broker_revenue::int 
	,ALTER COLUMN broker_commission 			SET DATA TYPE int 				USING broker_commission::int 
	,ALTER COLUMN broker_fees 					SET DATA TYPE int 				USING broker_fees::int 
	,ALTER COLUMN carrier_premium 				SET DATA TYPE int 				USING carrier_premium::int 
	,ALTER COLUMN plan_assets 					SET DATA TYPE bigint 			USING plan_assets::bigint 
	,ALTER COLUMN corrective_distributions 		SET DATA TYPE int 				USING corrective_distributions::int 
	,ALTER COLUMN participant_loans 			SET DATA TYPE int 				USING participant_loans::int 
	,ALTER COLUMN premium 						SET DATA TYPE int 				USING premium::int
	,ALTER COLUMN premium_per_employee 			SET DATA TYPE double PRECISION 	USING REPLACE(premium_per_employee, ',', '')::double PRECISION 
	,ALTER COLUMN revenue 						SET DATA TYPE int 				USING revenue::int 
	,ALTER COLUMN commission 					SET DATA TYPE int 				USING commission::int 
	,ALTER COLUMN fees 							SET DATA TYPE int 				USING fees::int 
	,ALTER COLUMN cargo_renewal 				SET DATA TYPE date 				USING cargo_renewal::date 
	,ALTER COLUMN business_travel_renewal 		SET DATA TYPE date 				USING business_travel_renewal::date 
	,ALTER COLUMN workers_compensation_renewal 	SET DATA TYPE date 				USING workers_compensation_renewal::date 
	,ALTER COLUMN bipd_renewal 					SET DATA TYPE date 				USING bipd_renewal::date 
	,ALTER COLUMN bond_renewal 					SET DATA TYPE date 				USING bond_renewal::date 
	,ALTER COLUMN dot_date 						SET DATA TYPE date 				USING dot_date::date 
	,ALTER COLUMN osha_date 					SET DATA TYPE date 				USING osha_date::date 
	,ALTER COLUMN whd_date 						SET DATA TYPE date 				USING whd_date::date;
GO 