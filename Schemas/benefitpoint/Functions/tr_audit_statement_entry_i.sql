create or replace function benefitpoint.tr_audit_statement_entry_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_statement_entry (
         posting_record_id 
        ,statement_entry_id 
        ,new_product_id 
        ,new_activity_log_record_id 
        ,new_statement_split_id 
        ,new_revenue_amount 
        ,new_premium_amount 
        ,new_apply_to_date 
        ,new_posted 
        ,new_num_of_lives 
        ,new_split_column_type 
        ,new_override 
        ,new_sagitta_transaction_code 
        ,audit_action 
    )
    select   new.posting_record_id 
            ,new.statement_entry_id 
            ,new.product_id 
            ,new.activity_log_record_id 
            ,new.statement_split_id 
            ,new.revenue_amount 
            ,new.premium_amount 
            ,new.apply_to_date 
            ,new.posted 
            ,new.num_of_lives 
            ,new.split_column_type 
            ,new.override 
            ,new.sagitta_transaction_code 
            ,'I'; 
    return new;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_statement_entry_i() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_statement_entry_i() to rl_benefitpoint_x;
go 
