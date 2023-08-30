alter table benefitpoint.account_integration_info
    drop constraint account_integration_info_pkey;
go 

alter table benefitpoint.account_integration_info 
    add constraint account_integration_info_pkey primary key (account_id);
go 

DELETE FROM benefitpoint.account_integration_info WHERE (sagitta_client_id ~* '[[:alpha:]]');
go 