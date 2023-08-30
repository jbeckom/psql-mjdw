create or replace function sagitta.fn_trial_balance_current_period()
returns date 
language plpgsql 
as $$

begin 
	return (
		select 	max(period) 
		from 	sagitta.trial_balance
	);
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.fn_trial_balance_current_period() owner to mj_admin;
go 

grant execute on function sagitta.fn_trial_balance_current_period() to rl_sagitta_x;
go 
