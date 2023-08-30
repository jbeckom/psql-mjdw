create or replace function sagitta.fn_utm_last_period ()
returns int 
language plpgsql 
as $$ 

begin 
    return (
        select  max(period_end_date)
        from    sagitta.utm
        where   period_end_date <= (current_date - '1967-12-31'::date)
    );
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.fn_utm_last_period() owner to mj_admin;
go 

grant execute on function sagitta.fn_utm_last_period() to rl_sagitta_x;
go 