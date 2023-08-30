create or replace function benefitpoint.tr_audit_statement_entry_d() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_statement_entry (
         posting_record_id 
        ,statement_entry_id 
        ,old_product_id 
        ,old_activity_log_record_id 
        ,old_statement_split_id 
        ,old_revenue_amount 
        ,old_premium_amount 
        ,old_apply_to_date 
        ,old_posted 
        ,old_num_of_lives 
        ,old_split_column_type 
        ,old_override 
        ,old_sagitta_transaction_code 
        ,audit_action 
    )
    select   old.posting_record_id 
            ,old.statement_entry_id 
            ,old.product_id 
            ,old.activity_log_record_id 
            ,old.statement_split_id 
            ,old.revenue_amount 
            ,old.premium_amount 
            ,old.apply_to_date 
            ,old.posted 
            ,old.num_of_lives 
            ,old.split_column_type 
            ,old.override 
            ,old.sagitta_transaction_code 
            ,'D'; 
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_statement_entry_d() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_statement_entry_d() to rl_benefitpoint_x;
go 
