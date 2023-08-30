alter table powerapps.account
    add column total_rewards_producer text null;
go 

alter table powerapps.audit_account
    add column old_total_rewards_producer text null 
    ,add column new_total_rewards_producer text null;
go 
