create or replace function audit.tr_psj_log_change() 
returns trigger 
language plpgsql 
security invoker 
as $$

begin 
    insert into audit.psj_log (operation, table_name, table_key, new_record)
        values (tg_op, tg_table_name, coalesce(new.id,old.id),row_to_json(new));

    return coalesce(new,old);
end;
$$;
go 

/*** PERMISSIONS ***/
alter function audit.tr_psj_log_change() owner to mj_admin;
go

grant execute on function audit.tr_psj_log_change() to rl_sagitta_x;
go 