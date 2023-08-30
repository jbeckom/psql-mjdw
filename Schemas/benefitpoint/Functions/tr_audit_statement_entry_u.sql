create or replace function benefitpoint.tr_audit_statement_entry_u() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_statement_entry (
         posting_record_id 
        ,statement_entry_id 
        ,old_product_id 
        ,new_product_id 
        ,old_activity_log_record_id 
        ,new_activity_log_record_id 
        ,old_statement_split_id 
        ,new_statement_split_id 
        ,old_revenue_amount 
        ,new_revenue_amount 
        ,old_premium_amount 
        ,new_premium_amount 
        ,old_apply_to_date 
        ,new_apply_to_date 
        ,old_posted 
        ,new_posted 
        ,old_num_of_lives 
        ,new_num_of_lives 
        ,old_split_column_type 
        ,new_split_column_type 
        ,old_override 
        ,new_override 
        ,old_sagitta_transaction_code 
        ,new_sagitta_transaction_code 
        ,audit_action 
    )
    select   old.posting_record_id 
            ,old.statement_entry_id 
            ,old.product_id 
            ,new.product_id 
            ,old.activity_log_record_id 
            ,new.activity_log_record_id 
            ,old.statement_split_id 
            ,new.statement_split_id 
            ,old.revenue_amount 
            ,new.revenue_amount 
            ,old.premium_amount 
            ,new.premium_amount 
            ,old.apply_to_date 
            ,new.apply_to_date 
            ,old.posted 
            ,new.posted 
            ,old.num_of_lives 
            ,new.num_of_lives 
            ,old.split_column_type 
            ,new.split_column_type 
            ,old.override 
            ,new.override 
            ,old.sagitta_transaction_code 
            ,new.sagitta_transaction_code 
            ,'U'; 
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_statement_entry_u() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_statement_entry_u() to rl_benefitpoint_x;
go 
