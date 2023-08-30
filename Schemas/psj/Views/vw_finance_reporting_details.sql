create or replace view psj.vw_finance_reporting_details
as 
SELECT 	 split_part(ledger,'.',2) 	AS "Ledger Category"
		,split_part(ledger,'.',3) 	AS "Division"
		,description 				AS "Description"
		,ledger_type 				AS "LedgerType"
		,this_period 				AS "ThisPeriod" 
		,"period"
		,CASE 
			WHEN date_part('month',"period") BETWEEN 9 AND 12 THEN (date_part('year',"period")+1)::text
			ELSE date_part('year',"period")::text
		 END 						AS "Fiscal Year"
		,concat(date_part('year',"period"),date_part('month',"period"),date_part('day',"period"))::int 	AS datekey
		,"period" 					AS "date"
FROM 	sagitta.trial_balance;
go 

/*** PERMISSIONS ***/
alter view psj.vw_finance_reporting_details owner to mj_admin;
go 

grant select on psj.vw_finance_reporting_details to rl_psj_r;
go 